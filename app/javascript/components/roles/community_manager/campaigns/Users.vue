<template>
  <app-card nested="true" margin="0"  v-if="node">
    <p class="title is-4">Usuarios que participan en el Nodo.</p>
    <div class="columns">
      <app-card :padding="15" class="column is-6">
        <p class="title is-6">Usuarios en nodo</p>
        <draggable v-model="inNode" :class="{ 'draggable-area' : inNode.length === 0 }" :options="{group:'people', handle:'.draggable'}" @change="addUserToNode($event)">
          <div
            class="campaign-user-item grab app-card p-15 my-5 draggable"
            v-for="(element, key) in inNode"
            :key="`designer-stored-${key}`"
            :user_id="element.id">
            <b>{{element.name}}</b> - <span class="tag">{{ element.role.name }}</span>
          </div>
        </draggable>
      </app-card>
      <app-card :padding="15" class="column is-6">
        <p class="title is-6">Usuarios en campaña</p>
        <draggable v-model="inCampaign" :class="{ 'draggable-area' : inCampaign.length === 0 }" :options="{group:'people', handle:'.draggable'}" @change="removeUserFromNode($event)">
          <div
            class="campaign-user-item p-15 my-5"
            :class="!cgExists || element.role.keyword !== 'cg' ? 'draggable app-card grab': 'app-card-nested not-allowed'"
            v-for="(element, key) in inCampaign"
            :key="`designer-server-${key}`"
            :user_id="element.id">
            <b>{{element.name}}</b> - <span class="tag">{{ element.role.name }}</span>
          </div>
        </draggable>
      </app-card>
    </div>
  </app-card>
</template>

<script>
  import draggable from 'vuedraggable'
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'node-users',
    props: ['node', 'community_manager_id', 'campaign_id'],
    components: { draggable, AppCard },
    data() {
      return {
        inNode: [],
        inCampaign: [],
        users: [],
        nodeUsers: []
      }
    },
    beforeMount() {
      this.fetchUsers()
      this.fetchNodeUsers()
    },
    methods: {
      isAdminOrClient: role => role.keyword === 'superadmin' || role.keyword === 'admin' || role.keyword === 'client',
      addUserToNode: function (event) {
        this.$swal({
          title: 'Espere...',
          onOpen: () => that.$swal.showLoading()
        })
        const that = this
        this.$axios.post(`/community_manager/nodes_users`, {
          user_id: event.added.element.id,
          node_id: that.node.id
        })
        .then(({data}) => {
          if (data.status === 200){
            that.$swal.close()
          } else {
            that.$swal({
              type: 'error',
              title: 'Error',
              text: 'No se pudo agragar al usuario.',
              footer: `Error: ${data.message}`
            })
            if (data.gc_error) {
              setTimeout(() => {
                console.log('Should return gc', event.added.element.id)
                that.inNode = that.inNode.filter(user => user.id !== event.added.element.id)
                that.inCampaign.push(that.users.find(user => user.id === event.added.element.id))
              }, 1000)
            }
          }
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo agragar al usuario.',
            footer: `Error: ${err}`
          })
        })
      },
      removeUserFromNode: function (event) {
        this.$swal({
          title: 'Espere...',
          onOpen: () => that.$swal.showLoading()
        })
        const that = this
        console.log(event.added.element)
        this.$axios.delete(`/community_manager/nodes_users/${that.node.id}/${event.added.element.id}`)
        .then(({data}) => {
          that.$swal.close()
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo agragar al usuario.',
            footer: `Error: ${err}`
          })
        })
      },
      checkNodeUsers: function () {
        this.inNode = this.users.filter(user => this.user_ids.includes(user.id))
        this.inCampaign = this.users.filter(user => !this.user_ids.includes(user.id))
      },
      fetchUsers: function () {
        const that = this
        if (this.node) this.$axios.get(`/community_manager/campaign_users/${this.node.id}.json`)
        .then(({data}) => {
          that.users = data.users.filter(user => user.role && !this.isAdminOrClient(user.role))
          that.checkNodeUsers()
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
      fetchNodeUsers: function () {
        const that = this
        if (this.node) this.$axios.get(`/community_manager/nodes_users/${this.node.id}.json`)
        .then(({data}) => {
          that.nodeUsers = data.users.filter(user => user.role && !this.isAdminOrClient(user.role))
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
    },
    computed: {
      user_ids: function () {
        return this.nodeUsers.map(user => user.id)
      },
      cgExists: function () {
        return this.inNode.some(user => user.role.keyword === 'cg')
      }
    },
    watch: {
      node: function () {
        this.fetchUsers()
        this.fetchNodeUsers()
      },
    }
  }
</script>
