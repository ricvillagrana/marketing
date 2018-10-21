<template>
  <div v-if="campaign">
    <div>
      <p class="title is-3">
        <a :href="`/admin/companies/${campaign.company.id}`"><i class="fa fa-arrow-left fa-0-8x"></i></a>
        {{ campaign.name }} <span v-if="campaign.finished" class="tag">Finalizada</span>
        <a class="ml-15" @click="editCampaign"><i class="fa fa-pencil fa-0-8x"></i></a>
      </p>
      <p class="title is-5">Community Manager: {{ campaign.community_manager.name }} {{ campaign.community_manager.lastname }}</p>
      <table class="table is-bordered is-striped is-fullwidth">
        <tbody>
          <tr>
            <th>Objetivo</th>
            <td>{{ campaign.objetive }}</td>
          </tr>
          <tr>
            <th>Fechas</th>
            <td>Desde {{ $date(campaign.init_date) }} hasta {{ $date(campaign.finish_date) }}</td>
          </tr>
          <tr>
            <th>Empresa</th>
            <td>{{ campaign.company.name }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <campaign-form v-if="campaign"
      :open="editOptions.open"
      :noChangeAdmin="true"
      :id="editOptions.id"
      :company_id="campaign.company.id"
      @close="editOptions.open = false"
      @update-campaign="fetchCampaign"></campaign-form>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import CampaignForm from '../companies/CampaignForm'

  export default {
    name: 'admin-campaigns-show',
    components: {
      AppCard, CampaignForm
    },
    data() {
      return {
        campaign: null,
        editOptions: {
          open: false,
          id: 0
        }
      }
    },
    props: ['campaign_id'],
    beforeMount() {
      this.fetchCampaign()
    },
    methods: {
      editCampaign: function () {
        this.editOptions.open = true
        this.editOptions.id = this.campaign.id
      },
      fetchCampaign: function () {
        const that = this
        this.$axios.get(`/admin/campaigns/${this.campaign_id}.json`)
        .then(({data}) => {
          that.campaign = data.campaign
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo obtener la información.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>