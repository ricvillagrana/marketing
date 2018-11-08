<template>
  <div class="columns">
    <app-card shadowless="true" class="column" padding="15">
      <p class="title has-text-facebook is-4">Información de Facebook <a href="/facebook/auth" class="is-size-7">Refrescar</a></p>
      <div v-if="facebookData && facebookData.user">
        <p class="title has-text-grey-dark is-5">Páginas</p>
        <div class="mb-20 box" v-for="(page, key) in facebookData.pages" :key="`page-${key}`">
          <div class="columns">
            <div class="column">
              <p class="title mb-0 has-text-facebook is-size-5">{{ page.name }}</p>
              <p class="m-0 has-text-grey">ID: {{ page.id }}</p>
              <p class="m-0">Categoría: {{ page.category }}</p>
              <button @click="handleCreatePost(page)" class="button is-facebook is-small my-15">
                <i class="fa fa-facebook"></i>
                Creat Post
              </button>
            </div>
            <div class="column">
              <p class="title has-text-grey-dark is-size-6">Permisos</p>
              <div class="m-0" v-for="(perm, key) in page.perms" :key="`perm-${key}`">
                {{ perm }}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-else class="has-text-grey has-text-centered">
        <a href="/facebook/auth" class="button is-facebook is-big">
          <i class="fa fa-facebook"></i>
          Vincular con Facebook
        </a>
      </div>
    </app-card>
    <app-card shadowless="true" class="column" padding="15">
    </app-card>
  </div>
</template>

<script>
import AppCard from '../../app/AppCard'

export default {
  name: 'dashboard-community-manager',
  props: ['user'],
  data: () => ({
    facebookData: null
  }),
  beforeMount () {
    this.fetchFacebookData()
  },
  methods: {
    handleCreatePost: function (page) {
      this.$swal({
        title: 'Post para ' + page.name,
        input: 'text',
        showCancelButton: true,
        preConfirm: (value) => {
          this.$axios.post('/facebook/post', {
            id: page.id,
            access_token: page.access_token,
            content: value
          }).then(({data}) => {
            console.log(data)
          })
          .catch(err => {
            console.log(err)
          })
        }
      })
    },
    fetchFacebookData: function () {
      const that = this
      this.$axios.get('/facebook/data')
        .then(({data}) => {
          that.facebookData = data.facebook_data
        })
    }
  },
  components: {
    AppCard
  }
}
</script>
