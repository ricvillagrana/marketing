<template>
  <div>
    <button class="button is-link is-rounded is-pulled-right" @click="handleAddUser"><i class="fa fa-plus"></i>Añadir usuario</button>
    <p class="title is-3">Usuarios</p>
    <p v-if="!users">Aún no hay usuarios, agrega uno.</p>
    <table v-else class="table is-bordered is-striped is-hoverable is-fullwidth">
      <thead>
        <tr class="has-text-weight-bold">
          <!--<td>Imagen</td>-->
          <td>Nombre</td>
          <td>Usuario</td>
          <td>Correo electŕonico</td>
          <td>Rol</td>
          <td>Estatus</td>
          <td>Campañas</td>
          <td>Opciones</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(user, key) in users" :key="key">
          <td>{{ user.name }} {{ user.lastname }}</td>
          <td>@{{ user.username }}</td>
          <td>{{ user.email }}</td>
          <td>
            <div class="tags">
              <span class="tag is-link" v-if="user.role">{{ user.role.name }}</span>
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
          <td @click="showUserDetails(user)" class="pointer">
            Administra: {{ user.campaigns_admin.length }} <br />
            Participa: {{ user.campaigns.length }}
          </td>
          <td>
            <div class="buttons has-addons">
              <a class="button is-warning" @click="handleEditUser(user)"><i class="fa fa-edit"></i></a>
              <a class="button is-danger" @click="handleDeleteUser(user)"><i class="fa fa-times"></i></a>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <user-form 
      :open="addOptions.open"
      :company_id="addOptions.company_id"
      @close="addOptions.open = false" 
      @update-user="fetchUsers"></user-form>

    <user-form
      :open="editOptions.open"
      :user_id="editOptions.user_id"
      :company_id="editOptions.company_id"
      @close="editOptions.open = false" 
      @update-user="fetchUsers"></user-form>

      <app-modal :open="showDetails" v-if="selected"  @close="() => {showDetails = false; selected = null}">
        <div slot="header">Campañas de {{ selected.name }} {{ selected.lastname }}</div>
        <div class="is-size-5" slot="content">
          <p class="">Campañas que administra:</p>
          <ul class="no-list">
            <li v-for="(campaign, key) in selected.campaigns_admin" :key="key"><a :href="`/admin/campaigns/${campaign.id}`">{{ campaign.name }}</a></li>
            <li v-show="selected.campaigns_admin.length == 0" class="has-text-grey has-text-weight-bold">Ninguna</li>
          </ul>

          <p class="">Campañas en las que participa:</p>
          <ul class="no-list">
            <li v-for="(campaign, key) in selected.campaigns" :key="key"><a :href="`/admin/campaigns/${campaign.id}`">{{ campaign.name }}</a></li>
            <li v-show="selected.campaigns.length == 0" class="has-text-grey has-text-weight-bold">Ninguna</li>
          </ul>
        </div>
        <div slot="footer">
          <button class="button is-link" @click="() => {showDetails = false; selected = null}">Ok</button>
        </div>
      </app-modal>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import AppModal from '../../../app/AppModal'
  import UserForm from './UserForm'

  export default {
    name: 'admin-users',
    components: {
      AppCard, AppModal, UserForm
    },
    data() {
      return {
        users: [],
        selected: null,
        addOptions: {
          open: false,
          company_id: 0
        },
        editOptions: {
          open: false,
          user_id: 0,
        },
        showDetails: false
      }
    },
    beforeMount() {
      this.fetchUsers()
    },
    methods: {
      isAdmin: role => role.keyword === 'superadmin' || role.keyword === 'admin',
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
        this.resetOptions()
      },
      resetOptions: function () {
        this.editOptions = {
          open: false,
          user_id: 0,
        }
      },
      showUserDetails: function ({id}) {
        this.selected = this.users.filter(user => user.id === id)[0]
        this.showDetails = true
      },
      handleAddUser: function ({id}) {
        this.addOptions.company_id = id
        this.addOptions.open = true
      },
      handleEditUser: function (user) {
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
              that.fetchUsers()
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