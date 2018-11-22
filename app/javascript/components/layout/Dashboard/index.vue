<template>
  <div>
    <dashboard-community-manager
      v-if="user.role.keyword == 'cm'"
      :user="user"></dashboard-community-manager>
    <dashboard-admin
      v-if="user.role.keyword == 'admin'"
      :user="user"></dashboard-admin>
  </div>
</template>

<script>
import DashboardCommunityManager from './CommunityManager'
import DashboardAdmin from './Admin'

export default {
  name: 'dashboard',
  props: ['user'],
  data: () => ({}),
  components: {
    DashboardCommunityManager,
    DashboardAdmin,

  }
}
</script>
