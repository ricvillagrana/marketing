<template>
  <div>
    <div class="columns">
      <div class="column is-8">
        <div id="semantic-network" @contextmenu="handleRightClick" class="semantic-network"></div>
      </div>
      <div class="column is-4">
        <node
          :node="node"
          @add-child="addChild"
          @should-refresh="fetchSemanticNetwork"
          @select="selectedNode = $event"></node>
      </div>
    </div>
  </div>
</template>

<script>
  import vis from 'vis'
  import Node from './Node'

  export default {
    name: 'semantic-network',
    props: ['campaign_id', 'node_id'],
    components: { vis, Node },
    data() {
      return {
        semantic_network: null,
        nodesRaw: [],
        vis: null,
        nodes: [],
        edges: [],
        selectedNode: 0,
        node: null
      }
    },
    beforeMount() {
      this.fetchSemanticNetwork()
    },
    methods: {
      handleRightClick: function (e) {
        e.preventDefault()
      },
      handleRightClickOnNode: function () {
        
      },
      addChild: function (father) {
        const that = this
        this.$swal({
          title: 'Nombre del nodo',
          input: 'text',
          showCancelButton: true,
          preConfirm: (value) => {
            this.$axios.post('/community_manager/nodes', {
              father_id: father.id,
              node: {name: value}
            }).then(({data}) => {
              that.nodesRaw.push(data.node)
            })
            .catch(err => {
              console.log(err)
            })
          }
        })
      },
      fetchSemanticNetwork: function () { // /community_manager/campaigns/semantic_network/${this.campaign_id}.json
        const that = this
        this.$axios.get(`/community_manager/campaigns/semantic_network/${this.campaign_id}.json`)
        .then(({data}) => {
          that.semantic_network = data
          that.selectedNode = null
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
        this.nodesRaw = []
        this.nodesRaw.push(this.semantic_network)
        this.semanticNetworkNodes(this.semantic_network)
      },
      semanticNetworkNodes: function (semantic_network) {
        semantic_network.children.map(node => this.nodesRaw.push(node))
        semantic_network.children.map(node => this.semanticNetworkNodes(node))
      }
    },
    watch: {
      nodesRaw: function () {
        this.nodes = this.nodesRaw.map(node => this.nodesRaw.indexOf(node) === 0 ? { id: node.id, label: node.name, size: 50, color: '#ffdd57', font: {color: 'black'}} : { id: node.id, label: node.name })
        this.edges = this.nodesRaw.map(node => ({ from: node.node_id, to: node.id }))
      },
      nodes: function () {
        this.vis = new vis.Network(
          document.getElementById('semantic-network'),
          {
            nodes: this.nodes,
            edges: this.edges
          }, 
          {
            nodes: {
              color: '#3273dc',
              font: {
                color: 'white'
              },
              shape: 'circle'
            }
          }
        )
        this.vis.on('click', node => this.selectedNode = node.nodes[0])
        this.vis.on('oncontext', node => this.handleRightClickOnNode('node-right-click', { id: node.nodes[0], position: node.pointer.canvas }))
      },
      selectedNode: function () {
        const that = this
        if (this.selectedNode) this.$axios.get(`/community_manager/nodes/${this.selectedNode}.json`)
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
