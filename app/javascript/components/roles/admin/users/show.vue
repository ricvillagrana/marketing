<template>
  <div v-if="user">
    <div>
      <p class="title is-2">
        <a href="/admin/users"><i class="fa fa-arrow-left fa-0-8x"></i></a>
        {{ user.name }} {{ user.lastname }} <span class="tag is-link">@{{ user.username }}</span>
        <a class="ml-15" @click="editUser"><i class="fa fa-pencil fa-0-8x"></i></a>
      </p>
      <table class="table is-bordered is-striped is-fullwidth">
        <tbody>
          <tr>
            <th width="25%">Correo electrónico</th>
            <td>{{ user.email }}</td>
          </tr>
          <tr>
            <th>Fecha de nacimiento</th>
            <td>{{ user.brondate ? $date(user.borndate) : 'No se especificó' }}</td>
          </tr>
          <tr>
            <th>Roles</th>
            <td>
              <roles-select :user_id="user.id"></roles-select>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <user-form v-if="user"
      :open="editOptions.open"
      :user_id="editOptions.user_id"
      :noChangeAdmin="true"
      @close="editOptions.open = false"
      @update-user="fetchUser"></user-form>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import UserForm from './UserForm'
  import RolesSelect from './RolesSelect'

  export default {
    name: 'admin-users',
    components: {
      AppCard, UserForm, RolesSelect
    },
    data() {
      return {
        user: null,
        editOptions: {
          open: false,
          user_id: 0
        }
      }
    },
    props: ['user_id'],
    beforeMount() {
      this.fetchUser()
    },
    methods: {
      editUser: function () {
        this.editOptions.open = true
        this.editOptions.user_id = this.user.id
      },
      fetchUser: function () {
        const that = this
        this.$axios.get(`/admin/users/${this.user_id}.json`)
        .then(({data}) => {
          that.user = data.user
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo obtener la información.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>