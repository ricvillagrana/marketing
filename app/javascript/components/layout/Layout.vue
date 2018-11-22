<template>
  <div>
    <top-bar :user="user"/>
    <div class="columns h-100 p-25">
      <side-bar :role="user.role"/>
      <app-card class="column is-main-content content is-small">
        <div class="title is-5 has-text-centered has-text-grey" v-if="!user.role">No tienes empresas asignadas, pide al Súper Administrador que te asigne a una.</div>
        <slot></slot>
      </app-card>
      <!-- <chat :user="user"></chat> -->
     
    </div>
    <chat @open-chat="appendChat($event)"></chat>
    <div class="chat-area">
      <chat-conversation
        v-for="(chat, key) in chats"
        :key="`chat-${key}`"
        :user="user"
        @close="closeChat($event)"
        :conversation="chat"></chat-conversation>
    </div>
  </div>
</template>

<script>
  import TopBar from './TopBar'
  import SideBar from './SideBar'
  import AppCard from '../app/AppCard'
  import Chat from './Chat'
  import ChatConversation from '../chat/ChatConversation'

  export default {
    name: 'layout',
    components: {
      TopBar, SideBar, AppCard, Chat, ChatConversation
    },
    data() {
      return {
        chats: [],
      }
    },
    props: ['notice', 'alert', 'user'],
    methods: {
/*    appendChat: function (user) {
         var active = false;
        this.chats.forEach(function(element) {
          if(user.id == element.id ){
            active = true;
          }
        });
        if(!active){this.chats.push(user)}
      }, */
      appendChat: function (user) {
        var active = false;
        var newChat = new this.$chat(user);
         if((this.chats.filter(chat => chat.user.name == newChat.user.name)).length!=0){
           active = !active;
         }
        if(!active){
          this.chats.push(newChat);
           this.$store("chats",this.chats);
        }
      },
      closeChat: function (id) {
        let chats = this.$store('chats')
        chats = chats.filter(chat => chat.user.id !== id)
        this.$store('chats', chats)
        this.updateChats()
      },
      updateChats () {
        this.chats = this.$store('chats')
      }
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
