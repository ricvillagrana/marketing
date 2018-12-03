<template>
  <div>
   <nav class="navbar is-link">
      <div class="navbar-brand">
        <a class="navbar-item" href="/">
          <p class="title is-4 has-text-light">Marketing</p>
        </a>

        <div class="navbar-burger burger" data-target="navMenubd-example" :class="{ 'is-active':showNavbar }" @click="showNavbar = !showNavbar">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>

      <div class="navbar-menu" :class="{ 'is-active':showNavbar }">
        <div class="navbar-start">

        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="field is-grouped">
              <span class="button is-link is-rounded" @click="toggleMessagess">
                <i class="fa fa-comment fa-normal"></i>
                <span class="tag is-warning is-rounded is-notification-counter" v-if="messages.length > 0">{{ messages.length }}</span>
              </span>
              <div class="notification-box messages" v-show="messagessOpen">
                <p class="px-7 mb-10 title is-5">Mensajes</p>
                <hr class="hr p-0 m-0">
                <div class="notification-list flex-col cursor-pointer">
                  <div class="notification-item flex-row">
                    <p class="title mb-5 is-7">Se creó la publicación</p>
                    <span class="content is-small">loremsaknd klasdnlkas dlkasdl asldkasld sal as</span>
                  </div>
                </div>
              </div>
              <span class="button is-link is-rounded" @click="toggleNotifications">
                <i class="fa fa-bell fa-normal"></i>
                <span class="tag is-warning is-rounded is-notification-counter" v-if="notifications.length > 0">{{ notifications.length }}</span>
              </span>
              <div class="notification-box" v-show="notificationsOpen">
                <p class="px-7 mb-10 title is-5">Notificaciones</p>
                <hr class="hr p-0 m-0">
                <div class="notification-list flex-col cursor-pointer">
                  <div class="notification-item flex-row" v-for="(item, index) in notifications" :key="`notifications${index}`" @click="$redirect(item.hotlink)">
                    <p class="title mb-5 is-7">{{ item.title }}</p>
                    <span class="content is-small">{{ item.message }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link menu-name">
              {{ user.name }} {{ user.lastname }}
            </a>
            <div class="navbar-dropdown ">
              <a href="/profile" class="navbar-item ">
                Perfil
              </a>
              <hr class="navbar-divider">
              <a class="navbar-item has-text-danger" data-method="delete" href="/users/sign_out" @click="handleSignOut">
                <i class="fa fa-times"></i>Cerrar sesión
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <action-cable-vue :channel="'NotificationsChannel'"
                      :room="$user.id.toString()"
                      @received="appendNotification($event)"></action-cable-vue>
  </div>
</template>

<script>
  import ActionCableVue from '../app/ActionCableVue'

  export default {
    name: 'top-bar',
    data() {
      return {
        showNavbar: false,
        notifications: [],
        messages: [],
        notificationsOpen: false,
        messagessOpen: false
      }
    },
    components: {
      ActionCableVue
    },
    beforeMount() {
      this.fetchNotifications()
    },
    props: ['user'],
    methods: {
      handleSignOut() {
        this.$userWillUpdate()
      },
      appendNotification(notification) {
        this.notifications.push(notification)
        this.$notify({
          group: 'app',
          title: notification.title,
          text: notification.message,
          type: 'normal'
        })
      },
      toggleMessagess() {
        this.messagessOpen = !this.messagessOpen
        this.notificationsOpen = false
      },
      toggleNotifications() {
        this.notificationsOpen = !this.notificationsOpen
        this.messagessOpen = false
      },
      fetchNotifications() {
        const that = this

        this.$axios.get('/notifications.json')
        .then(({data}) => {
          that.notifications = data.notifications
        })
        .catch(err => {
          this.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudieron obtener las notificaciones'
          })
        })
      }
    }
  }
</script>
