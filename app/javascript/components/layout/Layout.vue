<template>
  <div>
    <top-bar :user="user"/>
    <div class="columns h-100 p-25">
      <side-bar :role="user.role"/>
      <app-card class="column is-main-content content is-small">
        <slot></slot>
      </app-card>
    </div>
  </div>
</template>

<script>
  import TopBar from './TopBar'
  import SideBar from './SideBar'
  import AppCard from '../app/AppCard'

  export default {
    name: 'layout',
    components: {
      TopBar, SideBar, AppCard
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
