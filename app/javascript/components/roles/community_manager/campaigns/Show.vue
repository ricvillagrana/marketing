<template>
  <div v-if="campaign">
    <div class="mb-30">
      <p class="title is-3">
        <a :href="`/community_manager/campaigns`"><i class="fa fa-arrow-left fa-0-8x"></i></a>
        {{ campaign.name }} <span v-if="campaign.finished" class="tag">Finalizada</span>
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
    
    <div class="columns">
      <div class="column">
        <semantic-network
          :campaign_id="campaign.id"
          :node_id="campaign.semantic_network"
          @node-selected="fetchNode($event)"></semantic-network>
      </div>
      <div class="column">
        <node
          :node="node"></node>
      </div>
    </div>    

  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import AppDropdown from '../../../app/AppDropdown'
  import SemanticNetwork from './SemanticNetwork'
  import Node from './Node'

  export default {
    name: 'admin-campaigns-show',
    components: {
      AppCard, AppDropdown, SemanticNetwork, Node
    },
    data() {
      return {
        campaign: null,
        node: null
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
      },
      fetchNode: function(id) {
        const that = this
        if (id) this.$axios.get(`/community_manager/nodes/${id}.json`)
        .then(({data}) => {
          that.node = data.node
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