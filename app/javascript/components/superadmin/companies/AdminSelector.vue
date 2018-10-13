<template>
  <div>
    <div class="dropdown is-active">
      <div class="dropdown-trigger">
        <div v-if="selected" class="py-15">
          <strong>{{ selected.name }} {{ selected.lastname }}</strong> - {{ selected.username }}
          <button class="button is-rounded is-link" @click="editAdmin"><i class="fa fa-edit fa-normal"></i></button>
        </div>
        <div v-else>
          <input type="text" class="input is-medium" name="user_id" id="search-admin" v-model="words" />
          <div class="dropdown-menu" id="dropdown-menu2" role="menu" v-if="adminsFiltered.length !== 0">
            <div class="dropdown-content">
              <a class="dropdown-item py-15" v-for="(admin, key) in adminsFiltered" :key="key" @click="selectAdmin(admin.id)">
                <p><strong>{{ admin.name }} {{ admin.lastname }}</strong> - {{ admin.username }}</p>
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
    name: 'admin-selector',
    data() {
      return {
        admins: [],
        selected: null,
        words: ''
      }
    },
    props: ['user_id'],
    mounted() {
      this.fetchAdmins()
    },
    methods: {
      editAdmin: function () {
        this.selected = null
        setTimeout(() => {
          document.getElementById('search-admin').focus()
        },100)
      },
      selectAdmin: function (id) {
        this.selected = this.admins.filter(admin => admin.id === id).pop()
        this.$emit('user-selected', id)
        this.words = ''
      },
      fetchAdmins: function () {
        const that = this
        this.$axios.get('/superadmin/admins.json')
        .then(({data}) => {
          that.admins = data.admins
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
    },
    computed: {
      adminsFiltered: function () {
        return this.admins.filter(admin => (this.words.length === 0 ? null :
          new RegExp(this.words.toLowerCase()).test(admin.name.toLowerCase()) ||
          new RegExp(this.words.toLowerCase()).test(admin.lastname.toLowerCase()) ||
          new RegExp(this.words.toLowerCase()).test(admin.username.toLowerCase())
        ))
      }
    },
    watch: {
      user_id: function () {
        this.selected = this.admins.filter(admin => admin.id === this.user_id).pop()
      }
    }
  }
</script>
