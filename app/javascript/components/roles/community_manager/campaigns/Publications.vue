<template>
  <app-card nested="true" margin="0" v-if="node_id && node.children && node.children.length === 0">
    <button class="button is-link is-rounded is-pulled-right" @click="form.add.open = true">Agregar</button>
    <p class="title is-3">Publicaciones del nodo {{ node.name }}</p>
    <div class="columns is-is-fullwidth" v-if="node.publications.length !== 0">
      <div class="column is-4" v-for="(publication, key) in node.publications" :key="key">
        <app-card>
          <p class="title is-4">{{ publication.name }}</p>
          <p>{{ publication.content }}</p>
          <div slot="footer" class="flex-end">
          <a :href="`/community_manager/publications/${publication.id}`" class="button is-link is-rounded">Ver más</a>
          </div>
        </app-card>
      </div>
    </div>
    <div v-else class="title is-5 has-text-centered has-text-grey">
      No hay publicaciones<p class="has-text-link pointer" @click="form.add.open = true">Agrega una</p>
    </div>

    <publication-form
      :open="form.add.open"
      :node_id="node_id"
      :community_manager_id="community_manager_id"
      @should-update-publications="fetchPublications"
      @close="form.add.open = false"></publication-form>
  </app-card>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import PublicationForm from './PublicationForm'

  export default {
    name: 'publications',
    components: {
      AppCard, PublicationForm
    },
    props: ['node_id', 'community_manager_id'],
    data() {
      return {
        node: [],
        form: {
          add: {
            open: false
          }
        }
      }
    },
    beforeMount() {
      this.fetchPublications()
    },
    methods: {
      fetchPublications: function () {
        const that = this
        if (this.node_id) this.$axios.get(`/community_manager/nodes/${this.node_id}/publications.json`)
        .then(({data}) => {
          that.node = data.node
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudieron obtener las publicaciones.',
            footer: `Error: ${err}`
          })
        })
      }
    },
    watch: {
      node_id: function () {
        this.fetchPublications()
      },
      node: function () {
        const isLeaf = this.node_id && this.node.children && this.node.children.length === 0
        this.$emit('is-leaf', isLeaf)
      }
    }
  }
</script>