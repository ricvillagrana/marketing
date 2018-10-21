<template>
  <div v-if="companies">
    <p class="title is-3">Campañas</p>
    <div v-for="(company, key) in companies" :key="`company-${key}`" v-if="company.campaigns.length > 0">
      <div class="my-30">
        <!--<button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Añadir Campaña</button>-->
        <p class="title is-4"><a :href="`/admin/companies/${company.id}`">{{ company.name }} <span class="tag">{{ company.campaigns.length }} campaña(s)</span></a></p>
      </div>
      <div class="columns is-is-fullwidth">
        <div class="column is-3" v-for="(campaign, key) in company.campaigns" :key="key">
          <app-card shadowless="true">
            <p class="title is-4">{{ campaign.name }}</p>
            <p class="title is-6">Community manager: {{ campaign.community_manager.name }}</p>
            <p>Objetivo: {{ campaign.objetive }}</p>
            <div slot="footer" class="flex-end">
            <a :href="`/admin/campaigns/${campaign.id}`" class="button is-link is-rounded">Ver más</a>
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
    name: 'admin-campaigns',
    components: {
      AppCard
    },
    data() {
      return {
        companies: []
      }
    },
    beforeMount() {
      this.fetchCompanies()
    },
    methods: {
      fetchCompanies: function () {
        const that = this
        this.$axios.get(`/admin/campaigns.json`)
        .then(({data}) => {
          that.companies = data.companies
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