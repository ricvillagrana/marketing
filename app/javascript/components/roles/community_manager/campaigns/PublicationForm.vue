<template>
  <app-modal :open='open' @close="$emit('close')" v-if="publication">
    <template slot="header">
      <p class="modal-card-title">Nueva Publicación</p>
    </template>
    <template slot="content">
      <form>
        <label for="name">Nombre:</label>
        <input type="text" class="input" name="name" v-model="publication.name" />
        <span class="has-text-danger is-small">{{ errors.publication.name }}</span><br />

        <label for="name">Tarea para el Community Manager:</label>
        <textarea type="text" class="textarea" name="name" v-model="task.content"></textarea>
        <span class="has-text-danger is-small">{{ errors.task.content }}</span><br />
      </form>
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
        task: {
          name: `Nueva publicación creada`,
          content: ''
        },
        errors: {
          task: {
            content: ''
          },
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
        this.$axios.post(`/community_manager/nodes/${this.node_id}/publications`, { publication: this.publication })
        .then(result => {
          console.log(result)
          that.$axios.post(`/community_manager/publications/${result.data.publication.id}/tasks`, { task: that.task, community_manager_id: that.community_manager_id })
          .then((result) => {

          })
          .catch(err => {
            that.$swal({
              type: 'error',
              title: 'Error',
              text: 'No se pudo crear la tarea.',
              footer: `Error: ${err}`
            })
          })
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
        this.errors.task.content = ''
        this.errors.publication.name = ''

        // task.content
        const content = this.task.content.length !== 0
        if (!content) { this.errors.task.content = "Debe contener algo" }

         // publication.name
        const name = this.publication.name.length !== 0
        if (!name) { this.errors.publication.name = "Debe contener algo" }

        return content && name
      }
    }
  }
</script>
