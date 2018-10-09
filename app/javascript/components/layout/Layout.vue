<template>
  <div>
    <top-bar :user="user"/>
    <div class="columns h-100 side-bar">
      <side-bar :roles="user.roles"/>
      <div class="column is-main-content">
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script>
  import TopBar from './TopBar'
  import SideBar from './SideBar'

  export default {
    name: 'layout',
    components: {
      TopBar, SideBar
    },
    props: ['notice', 'alert', 'user'],
    mounted() {
      if (this.notice !== '') {
        this.$notify({
          group: 'app',
          title: 'Notice',
          type: 'success',
          text: this.notice
        });
      }
      if (this.alert !== '') {
        this.$notify({
          group: 'app',
          title: 'Alert',
          type: 'warn',
          text: this.alert
        });
      }
    }
  }
</script>
