<template>
  <div>
    <top-bar :user="user"/>
    <div class="columns h-100 p-25">
      <side-bar :role="user.role"/>
      <app-card class="column is-main-content content is-small">
        <div class="title is-5 has-text-centered has-text-grey" v-if="!user.role">No tienes empresas asignadas, pide al Súper Administrador que te asigne a una.</div>
        <slot></slot>
      </app-card>
    </div>
    <general-chat></general-chat>
  </div>
</template>

<script>
  import TopBar from './TopBar'
  import SideBar from './SideBar'
  import AppCard from '../app/AppCard'
  import GeneralChat from '../app/Chat/GeneralChat'

  export default {
    name: 'layout',
    components: {
      TopBar, SideBar, AppCard, GeneralChat
    },
    props: ['notice', 'alert', 'user'],
    beforeMount () {
      this.$fetchUser()
    },
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
