<template>
  <div>
    <button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Añadir usuario</button>
    <p class="title is-2">Usuarios</p>
    <p v-if="!users">No hay usuarios aún, agrega uno.</p>
    <div class="columns">
      <div class="column is-4" v-for="(user, key) in users" :key="key">
        <app-card shadowless="true">
          <p class="title is-4">{{ user.name }} {{ user.lastname }}</p>
          <div class="tags">
            <span class="tag" v-for="(role, key) in user.roles" :key="`role-${key}`">{{ role.name }}</span>
          </div>
          <div slot="footer" class="flex-end">
            <a class="button is-link is-rounded" :href="`/admin/users/${user.id}`">Ver más</a>
          </div>
        </app-card>
        
      </div>
    </div>
    <user-form
      :open="addOptions.open"
      @close="addOptions.open = false" 
      @update-user="fetchUsers"></user-form>
    <user-form
      :open="editOptions.open" 
      :user_id="editOptions.user_id" 
      @close="editOptions.open = false" 
      @update-user="fetchUsers"></user-form>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import UserForm from './UserForm'

  export default {
    name: 'admin-users',
    components: {
      AppCard, UserForm
    },
    data() {
      return {
        users: [],
        addOptions: {
          open: false
        },
        editOptions: {
          open: false,
          user_id: 0
        }
      }
    },
    beforeMount() {
      this.fetchUsers()
    },
    methods: {
      fetchUsers: function () {
        const that = this
        this.$axios.get('/admin/users.json')
        .then(({data}) => {
          that.users = data.users
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo actualizar la lista de usuarios.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>