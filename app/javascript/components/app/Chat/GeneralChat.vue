<template>
  <div class="general-chat-area flex flex-col flex-row-reverse items-end">
    <div class="flex flex-col">
      <div class="general-chat-list flex flex-col">
        <div class="general-chat-list-head flex cursor-pointer" @click="chatListVisible = !chatListVisible">
          <span class="py-10 px-15">Contactos</span>
        </div>
        <div class="general-chat-list-content p-0 flex flex-col" v-show="chatListVisible">
          <div v-for="(user, index) in filteredUsers"
               class="w-100 py-5 px-10 cursor-pointer items-center user"
               :title="user.username"
               @click="$emit('appendConversation', user)"
               :key="`user-${index}`">
            {{ user.name }} {{ user.lastname }} - <span class="tag is-blue">{{ user.role.name }}</span>
          </div>
        </div>
        <input class="general-chat-input" type="text" v-model="searchPattern" placeholder="Buscar..." v-show="chatListVisible">
      </div>
    </div>


    <div class="flex flex-col mx-5" v-for="(chat, index) in conversations" :key="`chat-${index}`">
    <general-chat-conversation :chat="chat"
                               @removeConversation="$emit('removeConversation', $event)"
                               @toggleChatStatus="$emit('toggleChatStatus', $event)"></general-chat-conversation>
    </div>

  </div>
</template>

<script>
  import GeneralChatConversation from './GeneralChatConversation'

  export default {
    name: 'general-chat',
    components: {
      GeneralChatConversation
    },
    props: {
      conversations: Array
    },
    data() {
      return {
        users: [],
        chatListVisible: false,
        searchPattern: ''
      }
    },
    computed: {
      filteredUsers() {
        const regexp = new RegExp(this.searchPattern.toLowerCase())
        return this.searchPattern === ''
          ? this.users
          : this.users.filter(
              user =>
                regexp.test(user.name.toLowerCase()) ||
                regexp.test(user.lastname.toLowerCase()) ||
                regexp.test(user.username.toLowerCase()) ||
                regexp.test(user.role.name.toLowerCase())
            )
      }
    },
    methods: {
      fetchUsers() {
        const that = this

        this.$axios.get('/chat/users.json')
          .then(({ data }) => {
            that.users = data.users.filter(user => user.id !== that.$user.id)
          })
          .catch(err => {
            this.$swal({
              type: 'error',
              title: 'Error',
              text: err
            })
          })
      }
    },
    created() {
      this.fetchUsers()
    },
    mounted() {}
  }
</script>
