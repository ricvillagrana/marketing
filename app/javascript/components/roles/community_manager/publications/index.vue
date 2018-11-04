<template>
  <div v-if="campaigns">
    <p class="title is-3">Publicaciones</p>
    <div v-for="(campaign, key) in campaigns" :key="`campaign-${key}`" v-if="campaign.publications.length > 0">
      <div class="my-30">
        <!--<button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Añadir Campaña</button>-->
        <p class="title is-4"><a :href="`/community_manager/campaigns/${campaign.data.id}`">{{ campaign.data.name }} <span class="tag">{{ campaign.publications.length }} publicaciones</span></a></p>
      </div>
      <div class="columns is-is-fullwidth">
        <div class="column is-4" v-for="(publication, key) in campaign.publications" :key="key">
          <app-card nested="true">
            <p class="title is-4">{{ publication.name }}</p>
            <p>
              Nodo: {{ publication.node.name }}
            </p>
            <div slot="footer" class="flex-end">
            <a :href="`/community_manager/publications/${publication.id}`" class="button is-link is-rounded">Ver más</a>
            </div>
          </app-card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'community-manager-publications',
    components: {
      AppCard
    },
    data() {
      return {
        campaigns: []
      }
    },
    beforeMount() {
      this.fetchPublications()
    },
    methods: {
      fetchPublications: function () {
        const that = this
        this.$axios.get(`/community_manager/publications.json`)
        .then(({data}) => {
          that.campaigns = data.campaigns
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
    }
  }
</script>