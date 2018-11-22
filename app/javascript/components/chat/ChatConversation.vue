<template>
  <div class="column is-3 px-5 pt-8 pb-0">
    <app-card padding="0" margin="0" noFooter="true" class="is-2 is-sidebar-menu is-hidden-mobile"  
      :class="conversation.state.open ? 'conversation-opened' : 'conversation-closed'">
      <chat-top-bar
        class="pointer"
        :user="conversation.user"
        @toggle="pulse(conversation)"
        @close="$emit('close', conversation.user.id);"
        :name="conversation.user.name"></chat-top-bar>      
      <!-- <div class="has-transition-0-2" :class="isShown ? 'conversation-opened py-5 px-2' : 'conversation-closed p-0'"> -->
      <div class="" >
        {{conversation.name}}
        {isShown}
         <span>holi</span> <br>
         <span>holi</span> <br>
         <span>holi</span> <br>
         <span>holi</span> <br>
         <span>holi</span> <br>
         <span>holi</span> <br>
         <span>holi</span> <br>
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
        console.log(id);
        if(chats.filter(chat => chat.user.id == id)){
          return true;
        };
      }
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
    }
  }
</script>