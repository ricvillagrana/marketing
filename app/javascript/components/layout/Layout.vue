<template>
  <div>
    <top-bar :user="user"/>
    <div class="columns h-100 side-bar">
      <side-bar :roles="user.roles"/>
      <app-card class="column is-main-content content is-small">
        <slot></slot>
      </app-card>
      <chat></chat>
    </div>
 
  </div>
</template>

<script>
  import TopBar from './TopBar'
  import SideBar from './SideBar'
  import AppCard from '../app/AppCard'
  import Chat from './Chat'

  export default {
    name: 'layout',
    components: {
      TopBar, SideBar, AppCard, Chat
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
