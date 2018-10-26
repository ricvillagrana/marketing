<template>
  <div>
    <div class="dropdown is-active">
      <div class="dropdown-trigger">
        <div v-if="selected" class="py-15">
          <strong>{{ selected.name }} {{ selected.lastname }}</strong> - {{ selected.username }}
          <a @click="editUser"><i class="fa fa-pencil fa-normal"></i></a>
        </div>
        <div v-else>
          <input type="text" class="input is-medium" name="user_id" id="search-user" v-model="words" />
          <div class="dropdown-menu" id="dropdown-menu2" role="menu" v-if="usersFiltered.length !== 0">
            <div class="dropdown-content">
              <a class="dropdown-item py-15" v-for="(user, key) in usersFiltered" :key="key" @click="selectUser(user.id)">
                <p><strong>{{ user.name }} {{ user.lastname }}</strong> - {{ user.username }}</p>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'cm-select',
    data() {
      return {
        users: [],
        selected: null,
        words: ''
      }
    },
    props: ['user_id', 'company_id'],
    mounted() {
      this.fetchUsers()
    },
    methods: {
      editUser: function () {
        this.selected = null
        setTimeout(() => {
          document.getElementById('search-user').focus()
        },100)
      },
      selectUser: function (id) {
        this.selected = this.users.filter(user => user.id === id).pop()
        this.$emit('user-selected', id)
        this.words = ''
      },
      fetchUsers: function () {
        const that = this
        if (this.company_id) {
          this.$axios.get(`/admin/community_managers/${this.company_id}.json`)
          .then(({data}) => {
            that.users = data.community_managers
          })
          .catch(err => {
            that.$swal({
              type: 'error',
              title: 'Error',
              text: 'No se pudo actualizar la lista de usiarios.',
              footer: `Error: ${err}`
            })
          })
        }
      }
    },
    computed: {
      usersFiltered: function () {
        return this.users.filter(users => (this.words.length === 0 ? null :
          new RegExp(this.words.toLowerCase()).test(users.name.toLowerCase()) ||
          new RegExp(this.words.toLowerCase()).test(users.lastname.toLowerCase()) ||
          new RegExp(this.words.toLowerCase()).test(users.username.toLowerCase())
        ))
      }
    },
    watch: {
      user_id: function () {
        this.selected = this.users.filter(users => users.id === this.user_id).pop()
      }
    }
  }
</script>
