<template>
  <div v-if="campaigns && company">
    <p class="title is-3">Campañas de {{ company.name }}</p>
    <div class="columns is-is-fullwidth">
      <div class="column is-4" v-for="(campaign, key) in campaigns" :key="key">
        <app-card nested="true">
          <p class="title is-4">{{ campaign.name }}</p>
          <p>Objetivo: {{ campaign.objetive }}</p>
          <div slot="footer" class="flex-end">
          <a :href="`/community_manager/campaigns/${campaign.id}`" class="button is-link is-rounded">Ver más</a>
          </div>
        </app-card>
      </div>
    </div>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'community-manager-campaigns',
    components: {
      AppCard
    },
    data() {
      return {
        campaigns: [],
        company: null
      }
    },
    beforeMount() {
      this.fetchCampaigns()
    },
    methods: {
      fetchCampaigns: function () {
        const that = this
        this.$axios.get(`/community_manager/campaigns.json`)
        .then(({data}) => {
          that.campaigns = data.campaigns
          that.company =  data.campaigns[0].company
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudieron obtener las campañas.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>
