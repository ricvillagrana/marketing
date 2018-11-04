<template>
  <app-modal :open='open' @close="$emit('close')" v-if="publication">
    <template slot="header">
      <p class="modal-card-title">Nueva Publicación</p>
    </template>
    <template slot="content">
      <label for="name">Nombre:</label>
      <input type="text" class="input" name="name" v-model="publication.name" @keypress.enter="save" />
      <span class="has-text-danger is-small">{{ errors.publication.name }}</span><br />
    </template>
    <template slot="footer">
      <button class="button is-danger" @click="$emit('close')"><i class="fa fa-times"></i>Cancelar</button>
      <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save" :disabled="!validate"><i class="fa fa-save"></i>Guardar</button>
    </template>
  </app-modal>
</template>

<script>
  import AppModal from '../../../app/AppModal'
  
  export default {
    name: 'publication-form',
    components: {
      AppModal
    },
    data() {
      return {
        publication: {
          name: ''
        },
        errors: {
          publication: {
            name: ''
          }
        },
        saving: false
      }
    },
    props: ['open', 'node_id', 'community_manager_id'],
    methods: {
      save: function (e) {
        e.preventDefault()
        const that = this
        this.saving = true
        this.$axios.post(`/community_manager/nodes/${this.node_id}/publications`, { publication: this.publication })
        .then(result => {
          console.log(result)
          that.$emit('close')
          that.$emit('should-update-publications')
          this.saving = false
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo crear la puublicación.',
            footer: `Error: ${err}`
          })
        })
      }
    },
    computed: {
      validate: function () {
        this.errors.publication.name = ''

         // publication.name
        const name = this.publication.name.length !== 0
        if (!name) { this.errors.publication.name = "Debe contener algo" }

        return name
      }
    }
  }
</script>
