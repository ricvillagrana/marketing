<template>
  <div>
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
          <td>{{ admin.created_at }}</td>
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
    <admin-editor :open="editOptions.open" :id="editOptions.user_id" @close="editOptions.open = false"></admin-editor>
  </div>
</template>

<script>
  import AdminEditor from './admins/Editor'

  export default {
    name: 'superadmin-admins',
    data() {
      return {
        editOptions: {
          open: false,
          user_id: 0
        },
        deleteOptions: {
          open: false,
          user: null
        }
      }
    },
    props: ['admins'],
    components: {
      AdminEditor
    },
    methods: {
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
                  text: 'El usuario se eliminó de manera corrects.',
                })
              }
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
      }
    }
  }
</script>
