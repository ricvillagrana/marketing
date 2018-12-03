<template>
  <div class="general-chat-area flex flex-col flex-row-reverse">
    <div class="flex flex-col">
      <div class="general-chat-list flex flex-col">
        <div class="general-chat-list-head flex cursor-pointer" @click="chatListVisible = !chatListVisible">
          <span class="py-10 px-15">Contactos</span>
        </div>
        <div class="general-chat-list-content p-0 flex flex-col" v-show="chatListVisible">
          <div class="w-100 py-5 px-10 cursor-pointer items-center user" :title="user.username" v-for="(user, index) in filteredUsers" :key="`user-${index}`">
            {{ user.name }} {{ user.lastname }} - <span class="tag is-blue">{{ user.role.name }}</span>
          </div>
        </div>
        <input class="input" type="text" v-model="searchPattern" v-show="chatListVisible">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'general-chat',
  components: {},
  props: {},
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
      return this.searchPattern === '' ? this.users : this.users.filter(user =>
        regexp.test(user.name.toLowerCase())
        || regexp.test(user.lastname.toLowerCase())
        || regexp.test(user.username.toLowerCase())
        || regexp.test(user.role.name.toLowerCase()))
    }
  },
  methods: {
    fetchUsers() {
      const that = this

      this.$axios('/chat/users.json')
      .then(({data}) => {
        that.users = data.users
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
  mounted() {},
}
</script>
