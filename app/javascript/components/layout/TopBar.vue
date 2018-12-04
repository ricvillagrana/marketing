<template>
  <div v-if="currentUser">
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
                <span class="tag is-warning is-rounded is-notification-counter" v-if="-unseenMessages > 0">{{ unseenMessages }}</span>
              </span>
              <div class="notification-box messages" v-show="messagessOpen">
                <p class="px-7 mb-10 title is-5">Mensajes</p>
                <hr class="hr p-0 m-0">
                <div class="notification-list flex-col cursor-pointer">
                  <div class="notification-item flex-row" v-for="(conversation, index) in conversations" :key="`message-${index}`" @click="appendConversation(mate(item))" v-if="lastMessage(conversation)">
                    <p class="title mb-5 is-7">{{ mate(conversation).name }} {{ mate(conversation).lastname }}  {{ $moment(lastMessage(conversation).created_at).fromNow() }}</p>
                    <span class="content is-small"><b>{{ lastMessage(conversation).user.id === currentUser.id ? 'Tú' : lastMessage(conversation).user.name }}</b>: {{ lastMessage(conversation).message }}</span>
                  </div>
                </div>
              </div>
              <span class="button is-link is-rounded" @click="toggleNotifications">
                <i class="fa fa-bell fa-normal"></i>
                <span class="tag is-warning is-rounded is-notification-counter" v-if="unseenNotifications > 0">{{ unseenNotifications }}</span>
              </span>
              <div class="notification-box" v-show="notificationsOpen">
                <p class="px-7 mb-10 title is-5">Notificaciones</p>
                <hr class="hr p-0 m-0">
                <div class="notification-list flex-col cursor-pointer">
                  <div class="notification-item flex-row" v-for="(item, index) in notifications" :key="`notification-${index}`" @click="$redirect(item.hotlink)">
                    <p class="title mb-5 is-7">{{ item.title }}</p>
                    <span class="content is-small">{{ item.message }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link menu-name">
              {{ currentUser.name }} {{ currentUser.lastname }}
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
                      :room="currentUser.id.toString()"
                      @received="appendNotification($event)"></action-cable-vue>

    <action-cable-vue :channel="'ConversationNotificationChannel'"
                      :room="$user.id.toString()"
                      @received="appendConversationNotificaton($event)"></action-cable-vue>
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
        conversations: [],
        notificationsOpen: false,
        messagessOpen: false,
        unseenMessages: 0,
        currentUser: null
      }
    },
    components: {
      ActionCableVue
    },
    beforeMount() {
      this.fetchNotifications()
      this.fetchMessagesCount()
      this.fetchConversations()

      this.currentUser = this.$user
      if (!this.$user) {
        const retry = setInterval(() => {
          if (!this.$user) {
            this.$fetchUser()
          } else {
            this.currentUser = this.$user
            clearInterval(retry)
          }
        }, 1000)
      }
    },
    props: ['user'],
    methods: {
      appendConversation(user) {
        let chats = this.$storage('chats')
        if (!chats) chats = []
        if (chats.filter(chat => chat.user.id === user.id).length === 0) {
          chats.push({
            user: user,
            opened: true
          })
          this.$storage('chats', chats)
          this.$emit('update')
        } else console.log('is opened')
      },
      seeNotifications() {
        this.$axios.put('/notifications/see')
        .catch(err => {
          console.log(err)
        })
      },
      handleSignOut() {
        this.$userWillUpdate()
      },
      appendNotification(notification) {
        this.notifications = [
          notification,
          ...this.notifications
        ]
        this.$notify({
          group: 'app',
          title: notification.title,
          text: notification.message,
          type: 'blue'
        })
      },
      appendConversationNotificaton(notification) {
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
        this.seeNotifications()
        this.notifications = this.notifications.map(notification => {
          notification.seen = true
          return notification
        })
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
      },
      fetchConversations() {
        const that = this

        this.$axios.get('/chat/conversations.json')
        .then(({data}) => {
          that.conversations = data.conversations
        })
        .catch(err => {
          this.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudieron obtener las conversaciones'
          })
        })
      },
      fetchMessagesCount() {
        const that = this

        this.$axios.get('/chat/unread_messages.json')
        .then(({data}) => {
          that.unseenMessages = data.count
        })
        .catch(err => {
          this.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudieron obtener los mensajes nuevos'
          })
        })
      },
      mate(conversation) {
        return conversation.users.filter(user => user.id !== this.$user.id).pop()
      },
      lastMessage(conversation) {
        return conversation.messages.length > 0 ? null : conversation.messages[conversation.messages.length - 1]
      }
    },
    computed: {
      unseenNotifications() {
        return this.notifications.filter(notification => !notification.seen).length
      }
    }
  }
</script>
