<template>
  <div>
    <dashboard-community-manager
      v-if="user.role.keyword == 'cm'"
      :user="user"></dashboard-community-manager>
  </div>
</template>

<script>
import DashboardCommunityManager from './CommunityManager'

export default {
  name: 'dashboard',
  props: ['user'],
  data: () => ({}),
  components: {
    DashboardCommunityManager,

  }
}
</script>
