<template>
  <div v-if="publication">
    <div class="columns">
      <div class="column">
        <p class="title is-3">
          {{ publication.name }}
          <span class="tag is-warning">{{ publication.status.name }}</span>
          <span class="title is-6 has-text-grey">Nodo: {{ publication.node.name }}</span>
        </p>
        <p v-if="daysToEnd > 0" class="title is-6 has-text-link">
          Termina en {{ daysToEnd }} días
          ({{ $dateText(publication.publication_date) }})
        </p>
        <p class="title is-6 has-text-danger" v-if="daysToEnd === 0">Termina hoy</p>
        <p class="title is-6 has-text-grey" v-if="daysToEnd < 0">
          Terminada hace {{ daysToEnd * -1 }} días
          ({{ $dateText(publication.publication_date) }})
        </p>

        <!-- <div class="tags has-addons m-0 is-grouped is-grouped-multiline flex-row" v-for="(user, key) in publication.node.users" :key="key">
          <span class="tag is-link">{{ user.role.name }}</span>
          <span class="tag is-grey"> {{ user.name }} {{ user.lastname }}</span>
        </div> -->
        <div class="box p-20">
          <textarea name="content" v-model="publication.content" class="textarea" rows="10" :readonly="saving" placeholder="Escribe tu contenido aquí..."></textarea>
          <div class="flex flex-end">
            <p class="has-text-grey-dark mt-25 mr-15 is-size-6">
              <i class="fa fa-pencil"></i>
              {{ $dateText(publication.updated_at) }}
              a las {{ $time(publication.updated_at) }}
              </p>
            <button class="button is-link is-medium mt-15" :class="{ 'is-loading' : saving }" @click="handleSave">
              <i class="fa fa-save"></i>
              Guardar
            </button>
          </div>
        </div>
      </div>
      <div class="column">
        asldn
      </div>
    </div>
    <div>
      <div class="box p-20">
        <drag-drop
          class="mb-15"
          :publication_id="publication_id"
          :url="`/content_generator/upload/${publication_id}`"
          @uploaded="fetchPublication"
          @images="images = $event"></drag-drop>

        <div class="dropzone-content has-text-centered">
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
  name: 'content-generator-publications-show',
  data() {
    return {
      publication: null,
      dragging: false,
      images: [],
      saving: false
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
      
      this.$axios.get(`/content_generator/publications/${this.publication_id}.json`)
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
    handleSave: function (e) {
      e.preventDefault()
      console.info('edit');
      const that = this
      this.saving = true
      this.$axios.put(`/content_generator/publications/${this.publication.id}`, { publication: this.publication })
      .then(result => {
        that.fetchPublication()
        that.saving = false
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
    handleDeleteImage: function (image) {
      const that = this
        this.$swal({
          title: `Se eliminará el la imágen`,
          text: "No se podrá recuprar",
          html: `<b>Imagen: </b> ${image.filename} <br />`,
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
            this.$axios.delete(`/content_generator/upload/${that.publication_id}/${image.id}`)
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
  },
  computed: {
    daysToEnd: function () {
      return Math.trunc(this.$moment.duration(this.$moment(this.publication.publication_date).diff(this.$moment(new Date()))).asDays())
    }
  }
}
</script>

