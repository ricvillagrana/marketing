<template>
  <div class="">
    <p class="title is-4">Usuarios que participan en la campaña.</p>
    <p class="title is-6 has-text-danger has-text-weight-bold">Si quitas a un usuario de una campaña se eliminará de todos sus nodos.</p>
    <div class="columns">
      <app-card :nested="true" :padding="15" class="column is-6">
        <p class="title is-6">Usuarios en campaña</p>
        <draggable v-model="inCampaign" :class="{ 'draggable-area' : inCampaign.length === 0 }" :options="{group:'people'}" @change="addUserToCampaign($event)">
          <div
            class="campaign-user-item grab box p-15 my-5"
            v-for="(element, key) in inCampaign"
            :key="`designer-stored-${key}`"
            :user_id="element.id">
            <b>{{element.name}}</b> - <span class="tag">{{ element.role.name }}</span>
          </div>
        </draggable>
      </app-card>
      <app-card :nested="true" :padding="15" class="column is-6">
        <p class="title is-6">Usuarios de la empresa</p>
        <draggable v-model="inServer" :class="{ 'draggable-area' : inServer.length === 0 }" :options="{group:'people'}" @change="removeUserFromCampaign($event)">
          <div
            class="campaign-user-item grab box p-15 my-5"
            v-for="(element, key) in inServer"
            :key="`designer-server-${key}`"
            :user_id="element.id">
            <b>{{element.name}}</b> - <span class="tag">{{ element.role.name }}</span>
          </div>
        </draggable>
      </app-card>
    </div>
  </div>
</template>

<script>
  import draggable from 'vuedraggable'
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'campaign-users',
    props: ['users', 'campaign_id', 'company_id', 'community_manager_id'],
    components: { draggable, AppCard },
    data() {
      return {
        inCampaign: [],
        inServer: [],
        allUsers: []
      }
    },
    beforeMount() {
      this.fetchUsers()
    },
    methods: {
      isAdminOrClient: role => role.keyword === 'superadmin' || role.keyword === 'admin' || role.keyword === 'client',
      addUserToCampaign: function (event) {
        this.$swal({
          title: 'Espere...',
          onOpen: () => that.$swal.showLoading()
        })
        const that = this
        this.$axios.post(`/admin/campaigns_users`, {
          user_id: event.added.element.id,
          campaign_id: that.campaign_id
        })
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
      removeUserFromCampaign: function (event) {
        this.$swal({
          title: 'Espere...',
          onOpen: () => that.$swal.showLoading()
        })
        const that = this
        this.$axios.delete(`/admin/campaigns_users/${that.campaign_id}/${event.added.element.id}`)
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
      checkCampaignUsers: function () {
        this.inCampaign = this.allUsers.filter(user => user.id !== this.community_manager_id && this.user_ids.includes(user.id))
        this.inServer = this.allUsers.filter(user => user.id !== this.community_manager_id && !this.user_ids.includes(user.id))
      },
      fetchUsers: function () {
        const that = this
        this.$axios.get(`/admin/campaigns_users/${this.company_id}`)
        .then(({data}) => {
          that.allUsers = data.users.filter(user => user.role && !this.isAdminOrClient(user.role))
          that.checkCampaignUsers()
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
        return this.users.map(user => user.id)
      }
    }
  }
</script>
