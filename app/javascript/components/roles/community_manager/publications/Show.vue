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
          class="mb-15"
          :publication_id="publication_id"
          @uploaded="fetchPublication"
          @images="images = $event"></drag-drop>

        <div class="dropzone-content">
          <span v-for="(image, key) in publication.images" :key="key" class="flex flex-row-reverse">
          <img :src="image.url" :alt="image.name" :id="image.id">
            <a class="button is-danger" @click="handleDeleteImage(image)">
              <i class="fa fa-times"></i>
              Eliminar
            </a>
          </span>
        </div>
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
    },
    handleDeleteImage: function (image) {
      const that = this
        this.$swal({
          title: `Se eliminará el la imágen ${image.filename}`,
          text: "No se podrá recuprar",
          type: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Eliminar',
          cancelButtonText: 'No, cancelar',
          cancelButtonColor: 'red',
          reverseButtons: true
        }).then((result) => {
          if (result.value) {
            this.$swal({
              title: 'Eliminando...',
              onOpen: () => that.$swal.showLoading()
            })
            this.$axios.delete(`/test/${that.publication_id}/${image.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$swal.close()
                // that.$swal({
                //   type: 'success',
                //   title: 'Elminado',
                //   text: 'La imagen se eliminó de manera correcta.',
                // })
              } else {
                that.$swal({
                  type: 'error',
                  title: 'Error',
                  text: 'No se pudo eliminar la imagen.',
                  footer: `Error: ${data.message}`
                })
              }
              that.fetchPublication()
            })
            .catch(err => {
              that.$swal({
                type: 'error',
                title: 'Error',
                text: 'No se pudo eliminar la imagen.',
                footer: `Error: ${err}`
              })
            })
          }
        })
    }
  }
}
</script>

