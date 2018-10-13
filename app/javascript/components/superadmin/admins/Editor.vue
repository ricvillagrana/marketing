<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">Modificando a {{ user.name }} {{ user.lastname }}</p>
    </template>
    <template slot="content">
      <form>
        <label for="name">Usuario:</label>
        <input type="text" class="input is-medium" name="username" v-model="user.username" />

        <label for="name">Nombre:</label>
        <input type="text" class="input is-medium" name="name" v-model="user.name" />

        <label for="lastname">Apellido:</label>
        <input type="text" class="input is-medium" name="lastname" v-model="user.lastname" />

        <label for="email">Correo electrónico:</label>
        <input type="mail" class="input is-medium" name="email" v-model="user.email" />

        <label for="brithday">Fecha de nacimiento:</label>
        <input type="date" class="input is-medium" v-model="user.born_date">
      </form>
    </template>
    <template slot="footer">
      <button class="button is-danger" @click="$emit('close')"><i class="fa fa-times"></i>Cancelar</button>
      <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save"><i class="fa fa-save"></i>Guardar</button>
    </template>
  </app-modal>
</template>

<script>
  import AppModal from '../../app/AppModal'
  export default {
    components: {AppModal},
    name: 'admin-editor',
    data() {
      return {
        user: {
          username: '',
          name: '',
          lastname: '',
          born_date: '',
          email: ''
        },
        saving: false
      }
    },
    props: ['open', 'id'],
    methods: {
      save: function (e) {
        e.preventDefault()
        const that = this
        this.saving = true
        this.$axios.put(`/superadmin/admins/${this.id}`, this.user)
        .then(({data}) => {
          if(data.status === 200){
            that.saving = false
            that.$emit('close')
            that.$swal({
              type: 'success',
              title: 'Guardado',
              text: `El usuario ${data.user.username} se actualizó correctamente`
            })
            this.$emit('update-users')
          }
        })
        .catch(err => {
          that.saving = false
          that.$swal({
            type: 'error',
            title: 'Error',
            text: `El usuario no se pudo actualizar`,
            footer: `Error ${err}`
          })
        })
        
      }
    },
    watch: {
      id: function () {
        const that = this
        this.$swal({
          title: 'Cargando...',
          onOpen: () => that.$swal.showLoading()
        })
        this.$axios.get(`/superadmin/admins/${this.id}`)
        .then(({data}) => {
          that.user.username = data.user.username
          that.user.name = data.user.name
          that.user.lastname = data.user.lastname
          that.user.born_date = data.user.born_date
          that.user.email = data.user.email
          this.$swal.close()
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo obtener la información del sevidor.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>
