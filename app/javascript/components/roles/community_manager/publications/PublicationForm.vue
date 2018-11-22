<template>
  <app-modal :open='open' @close="$emit('close')" v-if="publication">
    <template slot="header">
      <p class="modal-card-title">Editando publicación: {{ publication.name }}</p>
    </template>
    <template slot="content">

      <label for="name">Nombre:</label>
      <input type="text" class="input" name="name" v-model="publication.name" @keypress.enter="save" />
      <span class="has-text-danger is-small">{{ errors.publication.name }}</span><br />

      <label for="publication_date">Fecha de finalización:</label>
      <input type="date" min="2018-01-01" class="input" name="publication_date" :class="{ 'is-danger': errors.date }" v-model="publication.publication_date" />
      <span class="has-text-danger is-small">{{ errors.publication.publication_date }}</span><br />

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
          name: '',
          publication_date: ''
        },
        errors: {
          publication: {
            name: '',
            publication_date: ''
          }
        },
        saving: false
      }
    },
    props: ['open', 'publication_id'],
    beforeMount () {
      this.fetchPublication()
    },
    methods: {
      save: function (e) {
        e.preventDefault()
        const that = this
        this.saving = true
        this.$axios.put(`/community_manager/publications/${this.publication.id}`, { publication: this.publication })
        .then(result => {
          console.log(result)
          that.$emit('close')
          that.$emit('should-update-publication')
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
      },
      fetchPublication: function () {
        const that = this
        this.$axios.get(`/community_manager/publications/${this.publication_id}.json`)
          .then(({data}) => {
            that.publication = data.publication
          })
          .catch(err => that.$swal({
            type: 'error',
            title: 'Error',
            text: err
          }))
      }
    },
    computed: {
      validate: function () {
        this.errors.publication.name = ''
        this.errors.publication.publication_date = ''

         // publication.name
        const name = this.publication.name.length !== 0
        if (!name) { this.errors.publication.name = "Debe contener algo" }

         // publication.publication_date
        const publication_date = this.publication.publication_date !== '' && this.$moment(new Date()).isBefore(this.$moment(this.publication.publication_date))
        if (!publication_date) { this.errors.publication.publication_date = "Debe ser fecha posterior a hoy" }

        return name && publication_date
      }
    },
    watch: {
      publication_id: function () {
        this.fetchPublication
      }
    }
  }
</script>
