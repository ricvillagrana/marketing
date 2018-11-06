<template>
  <div v-if="publication">
    <p class="title is-3">{{ publication.name }}</p>
    <div>
      <p class="title is-5">Ususarios:</p>
      <ul>
        <li v-for="(user, key) in publication.node.users" :key="key"><span class="tag is-warning is-small">{{ user.role.name }}</span> {{ user.name }} {{ user.lastname }}</li>
      </ul>
      <p class="title is-4">Contenido</p>
      <div class="box p-20">
        <p v-if="!publication.content || publication.content === ''" class="title is-5 has-text-centered has-text-grey">
          No tiene contenido
        </p>
        <p v-else>{{ publication.content }}</p>
      </div>

      <p class="title is-4">Multimedia</p>
      <div class="box p-20">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'community-manager-publications-show',
  data() {
    return {
      publication: null
    }
  },
  props: ['publication_id'],
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

