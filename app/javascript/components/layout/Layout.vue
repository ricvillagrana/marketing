<template>
  <div>
    <top-bar :user="user" @update="updateConversations" />

    <div class="columns h-100 p-25">
      <side-bar :role="user.role"/>
      <app-card class="column is-main-content content is-small">
        <div class="title is-5 has-text-centered has-text-grey" v-if="!user.role">No tienes empresas asignadas, pide al Súper Administrador que te asigne a una.</div>
        <slot></slot>
      </app-card>
    </div>
    <general-chat
      :conversations="conversations"
      @removeConversation="removeConversation($event)"
      @toggleChatStatus="toggleChatStatus($event)"
      @appendConversation="appendConversation($event)"
      @update="updateConversations"
    ></general-chat>
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
    data() {
      return {
        conversations: []
      }
    },
    beforeMount () {
      this.$fetchUser()
    },
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
          this.updateConversations()
        } else console.log('is opened')
      },
      removeConversation(user) {
        let chats = this.$storage('chats')
        chats = chats.filter(chat => chat.user.id !== user.id)
        this.$storage('chats', chats)
        this.updateConversations()
      },
      toggleChatStatus({user}) {
        const chats = this.$storage('chats')
        const chat = chats.filter(chat => chat.user.id === user.id)[0]
        chat.opened = !chat.opened
        this.$storage('chats', chats)
        this.updateConversations()
      },
      updateConversations() {
        this.conversations = this.$storage('chats')
      }
    },
    mounted() {
      this.updateConversations()
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
