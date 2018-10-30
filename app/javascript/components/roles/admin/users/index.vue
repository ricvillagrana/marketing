<template>
  <div>
    <div v-for="(company, key) in companies" :key="`company-${key}`" class="mb-25">
      <button class="button is-link is-rounded is-pulled-right" @click="handleAddUser(company)"><i class="fa fa-plus"></i>Añadir usuario</button>
      <p class="title is-3">Usuarios de {{ company.name }}</p>
      <p v-if="!company.users">Aún no hay usuarios, agrega uno.</p>
      <table v-else class="table is-bordered is-striped is-hoverable is-fullwidth">
        <thead>
          <tr class="has-text-weight-bold">
            <!--<td>Imagen</td>-->
            <td>Nombre</td>
            <td>Usuario</td>
            <td>Correo electŕonico</td>
            <td>Roles</td>
            <td>Estatus</td>
            <td>Campañas</td>
            <td>Opciones</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(user, key) in company.users" :key="key" v-if="!user.companies_user.roles.some(isAdmin)">
            <td>{{ user.name }} {{ user.lastname }}</td>
            <td>@{{ user.username }}</td>
            <td>{{ user.email }}</td>
            <td>
              <div class="tags">
                <span class="tag is-link" v-for="(role, key) in user.companies_user.roles" :key="`role-${key}`">{{ role.name }}</span>
              </div>
            </td>
            <td>
              <div class="tags has-addons pointer" v-if="!user.user_creation">
                <span class="tag">Activo</span>
                <span class="tag is-success">✔</span>
              </div>
              <div class="tags has-addons pointer" @click="showLink(`${$base_url}/invited/${user.user_creation.creation_token}`)" v-else>
                <span class="tag">Inactivo</span>
                <span class="tag is-warning">Link de nvitación</span>
              </div>
            </td>
            <td>
              Administra: {{ user.campaigns_admin.length }} <br />
              Participa: {{ user.campaigns.length }}
            </td>
            <td>
              <div class="buttons has-addons">
                <a class="button is-warning" @click="handleEditUser(user, company)"><i class="fa fa-edit"></i></a>
                <a class="button is-danger" @click="handleDeleteUser(user)"><i class="fa fa-times"></i></a>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <user-form 
      :open="addOptions.open"
      :company_id="addOptions.company_id"
      @close="addOptions.open = false" 
      @update-user="fetchCompanies"></user-form>

    <user-form
      :open="editOptions.open"
      :user_id="editOptions.user_id"
      :company_id="editOptions.company_id"
      @close="editOptions.open = false" 
      @update-user="fetchCompanies"></user-form>
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
        companies: [],
        addOptions: {
          open: false,
          company_id: 0
        },
        editOptions: {
          open: false,
          user_id: 0,
          company_id: 0
        }
      }
    },
    beforeMount() {
      this.fetchCompanies()
    },
    methods: {
      isAdmin: role => role.keyword === 'superadmin' || role.keyword === 'admin',
      fetchCompanies: function () {
        const that = this
        this.$axios.get('/admin/users.json')
        .then(({data}) => {
          that.companies = data.companies
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo actualizar la lista de usuarios.',
            footer: `Error: ${err}`
          })
        })
      },
      handleAddUser: function ({id}) {
        this.addOptions.company_id = id
        this.addOptions.open = true
      },
      handleEditUser: function (user, company) {
        this.editOptions.company_id = company.id
        this.editOptions.user_id = user.id
        this.editOptions.open = true
      },
      handleDeleteUser: function (user) {
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
            this.$axios.delete(`/admin/users/${user.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$swal({
                  type: 'success',
                  title: 'Elminado',
                  text: 'El usuario se eliminó de manera correcta.',
                })
              } else {
                that.$swal({
                  type: 'error',
                  title: 'Error',
                  text: 'No se pudo eliminar al usuario.',
                  footer: `Error: ${data.message}`
                })
              }
              that.fetchCompanies()
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
      }
    }
  }
</script>