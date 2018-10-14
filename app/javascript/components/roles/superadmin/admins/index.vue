<template>
  <div>
    <button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Invitar Administrador</button>
    <p class="title is-2">Administradores</p>
    <table class="table is-bordered is-striped is-hoverable is-fullwidth">
      <thead>
        <tr class="has-text-weight-bold">
          <!--<td>Imagen</td>-->
          <td>Nombre</td>
          <td>Apellido</td>
          <td>Usuario</td>
          <td>Correo electŕonico</td>
          <td>Se unió</td>
          <td>Estatus</td>
          <td>Opciones</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(admin, key) in admins" :key="key">
          <!--<td>
            <figure>
              <img :src="admin.image" :alt="admin.name" class="image is-32x32" />
            </figure>
          </td>-->
          <td>{{ admin.name }}</td>
          <td>{{ admin.lastname }}</td>
          <td>{{ admin.username }}</td>
          <td>{{ admin.email }}</td>
          <td>{{ $datetime(admin.created_at) }}</td>
          <td @click="showLink(`${base_url}/invited/${admin.user_creation.creation_token}`)">{{ admin.user_creation ? 'Link de invitación' : '' }}</td>
          <td>
            <div class="buttons has-addons">
              <!--<a class="button is-link"><i class="fa fa-eye"></i></a>-->
              <a class="button is-warning" @click="editUser(admin)"><i class="fa fa-edit"></i></a>
              <a class="button is-danger" @click="deleteUser(admin)"><i class="fa fa-times"></i></a>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <user-form
      :open="editOptions.open" 
      :user_id="editOptions.user_id" 
      @close="editOptions.open = false" 
      @update-users="fetchAdmins"></user-form>
    <user-form
      :open="addOptions.open"
      @close="addOptions.open = false" 
      @update-users="fetchAdmins"></user-form>
  </div>
</template>

<script>
  import UserForm from './UserForm'
  import AdminAdd from './Add'

  export default {
    name: 'superadmin-admins',
    data() {
      return {
        admins: [],
        editOptions: {
          open: false,
          user_id: 0
        },
        addOptions: {
          open: false
        },
        base_url: window.location.origin
      }
    },
    props: ['users'],
    mounted() {
      this.fetchAdmins()
    },
    components: {
      UserForm, AdminAdd
    },
    methods: {
      addUser: function () {
        const that = this
        this.addOptions.open = true
      },
      editUser: function ({id}) {
        this.editOptions.user_id = id
        this.editOptions.open = true
      },
      deleteUser: function (user) {
        const that = this
        this.$swal({
          title: `Se eliminará el usuario ${user.name}`,
          text: "No se podrá recuprar",
          type: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Eliminar',
          cancelButtonText: 'No, cancelar',
          cancelButtonColor: 'red',
          reverseButtons: true
        }).then((result) => {
          if (result.value) {
            this.$swal({
              title: 'Eliminando...',
              onOpen: () => that.$swal.showLoading()
            })
            this.$axios.delete(`/superadmin/admins/${user.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$swal({
                  type: 'success',
                  title: 'Elminado',
                  text: 'El usuario se eliminó de manera correcta.',
                })
              }
              that.fetchAdmins()
            })
            .catch(err => {
              that.$swal({
                type: 'error',
                title: 'Error',
                text: 'No se pudo eliminar al usuario.',
                footer: `Error: ${err}`
              })
            })
          }
        })
      },
      showLink: function (link) {
        this.$swal({
          type: 'info',
          title: 'Link de invitación',
          html: `<pre><code>${link}</code></pre>`
        })
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
    }
  }
</script>
