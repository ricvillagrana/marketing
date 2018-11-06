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
      @selected-node="selectedNode = $event"
      @selected-node-users="nodeUsers = $event"></semantic-network>

    <node-users
      v-if="campaign"
      v-show="selectedIsLeaf"
      :campaign_id="campaign_id"
      :users="nodeUsers"
      :node_id="selectedNode"
      class="mb-25"></node-users>
        
    <publications
      v-if="campaign"
      :community_manager_id="campaign.community_manager.id"
      :node_id="selectedNode"
      @is-leaf="selectedIsLeaf = $event"></publications>

  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import AppDropdown from '../../../app/AppDropdown'
  import SemanticNetwork from './SemanticNetwork'
  import Publications from './Publications'
  import NodeUsers from './Users'

  export default {
    name: 'admin-campaigns-show',
    components: {
      AppCard, AppDropdown, SemanticNetwork, Publications, NodeUsers
    },
    data() {
      return {
        campaign: null,
        selectedNode: null,
        selectedIsLeaf: false,
        nodeUsers: []
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