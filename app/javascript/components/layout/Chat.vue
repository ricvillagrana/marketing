<template>
  <div class="column is-2 is-fixed p-0 m-0">
    <app-card padding="0" noFooter="true" class="is-2 is-sidebar-menu is-hidden-mobile">
      <chat-top-bar
        class="pointer"
        @click.native="isShown = !isShown"></chat-top-bar>
      <div class="has-transition-0-2" :class="isShown ? 'chat-open py-5 px-2' : 'chat-closed p-0'">
          <span class=" title is-6 has-text-black pr-20 pl-20 py-0">Contactos</span>
          <p class=" main-chat-item py-5 px-10 pointer" @click="$emit('open-chat', user)" v-for="(user, key) in usersFiltered" :key="`user-${key}`">{{ user.name }} {{ user.lastname }}</p>
          <chat-group></chat-group>
      </div>
      <chat-search-bar v-show="isShown" @update-words="words = $event" />
      
    </app-card>
    
  </div>
  

</template>


<script>
  import AppCard from '../app/AppCard'
  import ChatTopBar from '../chat/ChatTopBar'
  import ChatSearchBar from '../chat/ChatSearchBar'
  import ChatConversation from '../chat/ChatConversation'
  import ChatGroup from '../chat/ChatGroup'
  

  export default {
    data(){
      return {
        isShown: false,
        users: [],
        words: ''
      }
    },
    components: {
      AppCard, ChatTopBar, ChatSearchBar,ChatConversation, ChatGroup},
    name: 'chat',
    props: ['user'],
    beforeMount () {
      this.fetchUsers()
    },
    methods: {
      openChat: function (user) {
        this.$swal({text: user.name})
        
   
      },
      fetchUsers: function () {
        const that = this
        this.$axios.get('/companies/users.json')
          .then(({data}) => {
            that.users = data.users
          })
          .catch(err => console.log(err))
      }
    },
    computed: {
      usersFiltered: function () {
        return this.users.filter(user => (this.words.length === 0 ? this.users :
          new RegExp(this.words.toLowerCase()).test(user.name.toLowerCase()) ||
          new RegExp(this.words.toLowerCase()).test(user.lastname.toLowerCase()) ||
          new RegExp(this.words.toLowerCase()).test(user.username.toLowerCase())
        ))
      }
    }
  }
</script>