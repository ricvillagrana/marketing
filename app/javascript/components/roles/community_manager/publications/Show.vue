<template>
  <div v-if="publication">
    <div class="columns">
      <div class="column">
        <p class="title is-3">
          {{ publication.name }}
          <app-dropdown
            :title="dropdown.title"
            :color="dropdown.color"
            :options="dropdown.options"
            @edit="editOptions.open = true"></app-dropdown>
          <!-- <span class="tag is-warning">{{ publication.status.name }}</span> -->
          <span class="title is-6 has-text-grey">Nodo: {{ publication.node.name }}</span>
        </p>
        <div class="flex flex-end mb-15" v-show="publication.content && publication.content !== ''">
          <button @click="handleCreatePost" class="button is-facebook is-medium my-0 h-full">
            <i class="fa fa-facebook"></i>
            Pulbicar ahora
          </button>
        </div>
        <p v-if="daysToEnd > 0" class="title is-6 has-text-link">
          Termina en {{ daysToEnd }} días
          ({{ $dateText(publication.publication_date) }})
        </p>
        <p class="title is-6 has-text-danger" v-if="daysToEnd === 0">Termina hoy</p>
        <p class="title is-6 has-text-grey" v-if="daysToEnd < 0">
          Terminada hace {{ daysToEnd * -1 }} días
          ({{ $dateText(publication.publication_date) }})
        </p>

        <div class="box p-20">
          <p v-if="!publication.content || publication.content === ''" class="title is-5 has-text-centered has-text-grey my-50">
            No tiene contenido
          </p>
          <pre v-else class="is-size-6 p-15 pre">
            {{ publication.content }}<br />
          </pre>
          <span v-if="publication.content && publication.content !== ''" class="has-text-grey-dark mt-25 mr-15 is-size-6">
            <i class="fa fa-pencil"></i>
            {{ $dateText(publication.updated_at) }}
            a las {{ $time(publication.updated_at) }}
          </span>
        </div>
      </div>
      <div class="column">
        <publication-chat :publication="publication"></publication-chat>
      </div>
    </div>
    <div>
      <div class="box p-20">
        <div class="dropzone-content has-text-centered">
          <span v-for="(image, key) in publication.images" :key="key" class="flex flex-row-reverse">
            <img :src="image.url" :alt="image.name" :id="image.id">
          </span>
          <div v-if="publication.images.length === 0">
            <p class="title is-5 has-text-centered has-text-grey">
              No tiene multimedia
            </p>
          </div>
        </div>
      </div>
    </div>
    <publication-form
      :publication_id="publication.id"
      :open="editOptions.open"
      @close="editOptions.open = false"
      @should-update-publication="fetchPublication"></publication-form>
    <action-cable-vue :channel="'PublicationUpdateChannel'"
                      :room="publication_id.toString()"
                      @received="fetchPublication()"></action-cable-vue>
  </div>
</template>

<script>
import AppDropdown from '../../../app/AppDropdown'
import PublicationChat from '../../../app/Chat/'
import PublicationForm from './PublicationForm'
import ActionCableVue from '../../../app/ActionCableVue'

export default {
  name: 'community-manager-publications-show',
  data() {
    return {
      publication: null,
      editOptions: {
        open: false
      },
      dropdown: {
        title: '',
        color: 'light',
        options: [
          {
            name: 'Editar',
            icon: 'pencil',
            shouldEmit: 'edit',
            class: 'has-text-link'
          }
        ]
      }
    }
  },
  props: ['publication_id'],
  components: { AppDropdown, PublicationForm, PublicationChat, ActionCableVue },
  beforeMount() {
    this.fetchPublication()
  },
  methods: {
    fetchPublication: function () {
      const that = this
      this.$axios.get(`/community_manager/publications/${this.publication_id}.json`)
        .then(({data}) => {
          this.$swal.close()
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
    handleCreatePost: function () {
      const imageUrl = this.$base_url + this.publication.images[0].url
      const that = this
      const page = this.$user.facebook_data.pages.filter(page => page.id === this.publication.facebook_data.id)[0]
      const access_token = page.access_token
      this.$swal({
        title: `Se publicará "${that.publication.name}"`,
        html: `Estás a punto de publicar en <span class="has-text-weight-bold has-text-facebook">Facebok</span>`,
        type: 'info',
        footer: 'Por el momento sólo se publicará la primera imágen.',
        showCancelButton: true,
        confirmButtonText: 'Publicar',
        cancelButtonText: 'Cancelar',
        cancelButtonColor: 'red',
        reverseButtons: true
      }).then((result) => {
        if (result.value) {
          this.$swal({
            title: 'Publicando en Facebook...',
            onOpen: () => that.$swal.showLoading()
          })
          this.$axios.post('/community_manager/facebook/albums', {
            id: this.publication.facebook_data.id,
            access_token: access_token,
            name: `${this.publication.id}-${this.publication.name}`,
            message: `Album identifier: ${this.$guidGenerator()}`
          })
          .then(({data}) => {
            this.$axios.post('/community_manager/facebook/albums/photos', {
              id: this.publication.facebook_data.id,
              publication_id: that.publication.id,
              access_token: access_token,
              caption: that.$guidGenerator(),
              content: that.publication.content,
              images: that.publication.images
            })
            .then(({data}) => {
              that.$swal({
                type: 'success',
                title: 'Listo',
                text: 'Se creará la publicación pronto, espera la notificación.'
              })
            })
            .catch(err => {
              that.$swal({
                type: 'error',
                title: 'Error',
                text: 'No se pudo crear la publicación.',
                footer: `Error: ${err}`
              })
            })
          })
          .catch(err => {
            that.$swal({
              type: 'error',
              title: 'Error',
              text: 'No se pudieron subir las imágenes a Facebook.',
              footer: `Error: ${err}`
            })
          })
        }
      })
    }
  },
  computed: {
    daysToEnd() {
      return Math.trunc(this.$moment.duration(this.$moment(this.publication.publication_date).diff(this.$moment(new Date()))).asDays())
    }
  }
}
</script>
