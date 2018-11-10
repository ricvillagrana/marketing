<template>
  <div v-if="publication">
    <p class="title is-3">{{ publication.name }} <span class="tag is-warning">{{ publication.status.name }}</span></p>
    <p class="title is-5">Nodo: {{ publication.node.name }}</p>

    <div>
      <div class="tags has-addons m-0"  v-for="(user, key) in publication.node.users" :key="key">
        <span class="tag is-link">{{ user.role.name }}</span>
        <span class="tag is-grey"> {{ user.name }} {{ user.lastname }}</span>
      </div>
      <p class="title is-4">Contenido</p>
      <div class="box p-20">
        <p v-if="!publication.content || publication.content === ''" class="title is-5 has-text-centered has-text-grey">
          No tiene contenido
        </p>
        <p v-else>{{ publication.content }}</p>
      </div>

      <p class="title is-4">Multimedia</p>
      <div class="box p-20 has-text-centered">
        <drag-drop
          @images="images = $event"></drag-drop>
        <button v-show="images.length > 0" class="button is-success is-large">
          <i class="fa fa-upload"></i>
          {{ images.length > 1 ? `Subir imágenes (${images.length})` : `Subir imagen` }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import DragDrop from '../../../app/DragDrop'

export default {
  name: 'community-manager-publications-show',
  data() {
    return {
      publication: null,
      dragging: false,
      images: []
    }
  },
  props: ['publication_id'],
  components: { DragDrop },
  beforeMount() {
    this.fetchPublication()
  },
  methods: {
    fetchPublication: function () {
      const that = this
      this.$axios.get(`/community_manager/publications/${this.publication_id}.json`)
        .then(({data}) => {
          that.publication = data.publication
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'Error al consultar la publicación',
            footer: `Error: ${err}`
          })
        })
    }
  }
}
</script>

