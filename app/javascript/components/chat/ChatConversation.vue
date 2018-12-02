<template>
  <div class="column is-3 px-5 pt-8 pb-0">
    <app-card padding="0" margin="0" noFooter="true" class="  is-2 is-sidebar-menu is-hidden-mobile"  
      :class="conversation.state.open ? 'conversation-opened' : 'conversation-closed'">
      <chat-top-bar
        class="pointer"
        :user="conversation.user"
        @toggle="pulse(conversation)"
        @close="$emit('close', conversation.user.id);"
        :name="conversation.user.name"></chat-top-bar>      
      <!-- <div class="has-transition-0-2" :class="isShown ? 'conversation-opened py-5 px-2' : 'conversation-closed p-0'"> -->
      <div class="chat-container scroll">
        <div class=" chat-message-container flex-col flex-end">
          
          <span class="chat-message m-4 tag" :class="true ? 'me is-link flex-self-end' : 'is-dark-light'">
            {{conversation.user.name}}
            {{conversation.user.lastname}}
          </span>
        </div>
        <div class="m-5 chat-message-container flex-col flex-end">
          <span class="chat-message m-4 tag" :class="true ? 'me is-link flex-self-end' : 'is-dark-light'">
            {{conversation.user.name}}
            {{conversation.user.lastname}}
          </span>
        </div>
        <div class="m-5 chat-message-container flex-col flex-end">
          <span class="chat-message m-4 tag" :class="false ? 'me is-link flex-self-end' : 'is-dark-light'">
            {{conversation.user.name}}
            {{conversation.user.lastname}}
          </span>
        </div>
        <div class="m-5 chat-message-container flex-col flex-end">
          <span class="chat-message m-4 tag" :class="false ? 'me is-link flex-self-end' : 'is-dark-light'">
            {{conversation.user.name}}
            {{conversation.user.lastname}}
          </span>
        </div>
        <div class="m-5 chat-message-container flex-col flex-end">
          <span class="chat-message m-4 tag" :class="true ? 'me is-link flex-self-end' : 'is-dark-light'">
            {{conversation.user.name}}
            {{conversation.user.lastname}}
          </span>
        </div>
        <div class="m-5 chat-message-container flex-col flex-end">
          <span class="chat-message m-4 tag" :class="false ? 'me is-link flex-self-end' : 'is-dark-light'">
            {{conversation.user.name}}
            {{conversation.user.lastname}}
            
          </span>
        </div>
        <div class="m-5 chat-message-container flex-col flex-end">
          <span class="chat-message m-4 tag" :class="true ? 'me is-link flex-self-end' : 'is-dark-light'">
            {{conversation.user.name}}
            {{conversation.user.lastname}}
          </span>
        </div>
        
      </div>
      <chat-text-area/>
      <!-- <chat-search-bar v-show="isShown" @update-words="words = $event" /> -->
    </app-card>
  </div>
</template>


<script>
  import AppCard from '../app/AppCard'
  import ChatTopBar from '../chat/ChatTopBar'
  import ChatTextArea from '../chat/ChatTextArea'
  // import ChatSearchBar from '../chat/ChatSearchBar'


  export default {
    name: 'chat-conversation',
    props: ['user', 'conversation'],
    data(){
      return {
        isShown: false,
        users: "",
        words: '',
        objeto: ""
      }
    },
    components: {
      AppCard,
      ChatTopBar,
      ChatTextArea
    },
    methods:{
      pulse: function({user}){
        this.conversation.toggle()
        const chats = this.$store('chats')
        const chat = chats.filter(chat => chat.user.id === user.id)[0]
        chat.state = this.conversation.state
        this.$store('chats', chats)
      },
      shown: function(id){
        
        var chats = this.$store("chats");
        if(chats.filter(chat => chat.user.id == id)){
          return true;
        };
      },
      down() {
        setTimeout(() => {
          let boxes = document.getElementsByClassName('chat-container')
          boxes = [...boxes]
          
          boxes.map(box => box.scrollTo(0, box.scrollHeight))
        }, 1)
      },
    },
    computed: {
      conversationName: function () {
        return this.conversation.name
      }
    },
    watch: {
      resetTo: function () {
        this.isShown = this.resetTo
      }
    },
  mounted: function () {
    this.down();
}
  }
</script>