<template>
  <div>
    <div id="semantic-network" class="semantic-network"></div>
    
  </div>
</template>

<script>
  import vis from 'vis'

  export default {
    name: 'semantic-network',
    props: ['campaign_id', 'node_id'],
    components: { vis },
    data() {
      return {
        semantic_network: null,
        nodesRaw: [],
      }
    },
    beforeMount() {
      this.fetchSemanticNetwork()
    },
    methods: {
      fetchSemanticNetwork: function () { // /community_manager/campaigns/semantic_network/${this.campaign_id}.json
        const that = this
        this.$axios.get(`/community_manager/campaigns/semantic_network/${this.campaign_id}.json`)
        .then(({data}) => {
          that.semantic_network = data
          that.processSemanticNetwork()
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
      processSemanticNetwork: function () {
        this.nodesRaw.push(this.semantic_network)
        this.semanticNetworkNodes(this.semantic_network)
      },
      semanticNetworkNodes: function (semantic_network) {

        semantic_network.children.map(node => this.nodesRaw.push(node))
        semantic_network.children.map(node => this.semanticNetworkNodes(node))
      }
    },
    computed: {
      nodes: function () {
        return this.nodesRaw.map(node => ({ id: node.id, label: node.name }))
      },
      edges: function () {
        return this.nodesRaw.map(node => ({ from: node.node_id, to: node.id }))
      }
    },
    watch: {
      nodes: function () {
        new vis.Network(
          document.getElementById('semantic-network'),
          {
            nodes: this.nodes,
            edges: this.edges
          }, 
          {});
      } 
    }
  }
</script>
