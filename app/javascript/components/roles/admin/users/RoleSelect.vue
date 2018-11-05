<template>
  <div class="field">
    <div class="control">
      <div class="select">
        <select :id="is_new ? 'role-selector' : 'role-selector-new'" @change="selected">
          <option>Ninguna</option>
          <option :selected="role_id == role.id ? 'selected' : ''" v-for="(role, key) in roles" :key="key" :role_id="role.id">{{ role.name }}</option>
        </select>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'role-select',
    data() {
      return {
        roles: []
      }
    },
    props: ['role_id', 'is_new'],
    beforeMount() {
      this.fetchRoles()
    },
    methods: {
      selected: function () {
        const selector = this.is_new ? document.getElementById('role-selector') : document.getElementById('role-selector-new')
        const index = selector.options.selectedIndex
        const selected = selector.options[index]
        const role_id = selected.getAttribute('role_id')
        this.$emit('selected', role_id)
      },
      fetchRoles: function () {
        const that = this
        this.$axios.get(`/roles.json`)
        .then(result => {
          that.roles = result.data.roles.filter(role => role.keyword !== 'admin' && role.keyword !== 'superadmin')
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'Error al consultar los roles',
            footer: `Error: ${err}`
          })
        })
      }
    },
    watch: {
      role_id: function () {
        this.fetchRoles()
      }
    }
  }
</script>

