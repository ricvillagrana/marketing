<template>
  <div>
    <div class="field is-grouped is-grouped-multiline">
      <div class="control" v-for="(role, key) in userRoles" :key="`role-select-${key}`">
        <div class="tags has-addons">
          <a class="tag is-link">{{ role.name }}</a>
          <a class="tag is-delete" @click="remove(role.id)"></a>
        </div>
      </div>
    </div>
    <span>Selecciona un nuevo rol a añadir:</span>
    <div class="dropdown" :class="{ 'is-active' : dropdownActive }">
      <div class="dropdown-trigger">
        <button class="button is-outlined" aria-haspopup="true" aria-controls="dropdown-menu" @click="dropdownActive = !dropdownActive">
          <span>Roles</span>
          <span class="icon is-small">
            <i class="fa fa-angle-down" aria-hidden="true"></i>
          </span>
        </button>
      </div>
      <div class="dropdown-menu" id="dropdown-menu" role="menu">
        <div class="dropdown-content">
          <a @click="append(role.id)" class="dropdown-item" v-for="(role, key) in roles" :key="`role-select-${key}`">
            {{ role.name }}
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'roles-select',
    props: ['user_id'],
    data() {
      return {
        serverRoles: [],
        userRoles: [],
        dropdownActive: false
      }
    },
    beforeMount() {
      this.fetchServerRoles()
      this.fetchUserRoles()
    },
    mounted() {

    },
    methods: {
      append: function (role_id) {
        this.$axios.put(
          `/admin/users/${this.user_id}/roles/append`,
          { role_id }
        ).then(({data}) => {
          this.userRoles.push(this.roles.filter(role => role.id === role_id).pop())
        }).catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: `No se pudo asignar el rol.`,
            footer: `Error: ${err}`
          })
        })
      },
      remove: function (role_id) {
        this.$axios.delete(
          `/admin/users/${this.user_id}/roles/remove/${role_id}`,
        ).then(({data}) => {
        this.userRoles = this.userRoles.filter((role => role.id !== role_id))
        }).catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: `No se pudo revocar del rol.`,
            footer: `Error: ${err}`
          })
        })
      },
      fetchServerRoles: function () {
        const that = this
        this.$axios.get(`/roles`)
        .then(({data}) => {
          that.serverRoles = data.roles
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: `No se pudieron obtener los roles.`,
            footer: `Error: ${err}`
          })
        })
      },
      fetchUserRoles: function () {
        const that = this
        this.$axios.get(`/admin/users/${this.user_id}/roles`)
        .then(({data}) => {
          that.userRoles = data.roles
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: `No se pudieron obtener los roles para el id del usuario.`,
            footer: `Error: ${err}`
          })
        })
      }
    },
    computed: {
      roles: function () {
        return this.serverRoles.filter(role => !this.userRoles.map(userRole => userRole.id).includes(role.id))
      }
    }
  }
</script>
