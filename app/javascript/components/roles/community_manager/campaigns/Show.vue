<template>
  <div v-if="campaign">
    <div class="mb-30">
      <p class="title is-3">
        <a :href="`/community_manager/campaigns`"><i class="fa fa-arrow-left fa-0-8x"></i></a>
        {{ campaign.name }} <span v-if="campaign.finished" class="tag">Finalizada</span>
      </p>
      <p class="title is-5">Empresa: {{ campaign.company.name }}</p>
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
    <semantic-network
      :campaign_id="campaign.id"
      :node_id="campaign.semantic_network"
      @selected-node="selectedNode = $event"></semantic-network>
        
      <publications
        v-if="campaign"
        :node_id="selectedNode"></publications>

  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import AppDropdown from '../../../app/AppDropdown'
  import SemanticNetwork from './SemanticNetwork'
  import Publications from './Publications'

  export default {
    name: 'admin-campaigns-show',
    components: {
      AppCard, AppDropdown, SemanticNetwork, Publications
    },
    data() {
      return {
        campaign: null,
        selectedNode: null,
      }
    },
    props: ['campaign_id'],
    beforeMount() {
      this.fetchCampaign()
    },
    methods: {
      fetchCampaign: function () {
        const that = this
        this.$axios.get(`/community_manager/campaigns/${this.campaign_id}.json`)
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