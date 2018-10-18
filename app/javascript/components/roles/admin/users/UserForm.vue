<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">{{ user.name }} {{ user.lastname }}</p>
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
        <span class="has-text-danger is-small">{{ errors.email }}</span><br />

        <label for="brithday">Fecha de nacimiento:</label>
        <input type="date" class="input is-medium" v-model="user.born_date">
      </form>
    </template>
    <template slot="footer">
      <button class="button is-danger" @click="$emit('close')"><i class="fa fa-times"></i>Cancelar</button>
      <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save" :disabled="!validate"><i class="fa fa-save"></i>Guardar</button>
    </template>
  </app-modal>
</template>

<script>
  import AppModal from '../../../app/AppModal'
  
  export default {
    components: {AppModal},
    name: 'user-form',
    data() {
      return {
        user: {
          username: '',
          name: '',
          lastname: '',
          born_date: '',
          email: ''
        },
        errors: {
          email: ''
        },
        saving: false
      }
    },
    props: ['open', 'user_id'],
    methods: {
      save: function (e) {
        e.preventDefault()
        const that = this
        this.saving = true
        if (this.user_id) {
          this.$axios.put(`/admin/users/${this.user.id}`, this.user)
          .then(({data}) => {
            if(data.status === 200){
              that.saving = false
              that.$emit('close')
              that.$swal({
                type: 'success',
                title: 'Guardado',
                text: `El usuario ${data.user.username} se actualizó correctamente`
              })
              that.$emit('update-user')
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
        } else {
          this.$axios.post(`/admin/users`, this.user)
          .then(({data}) => {
            if(data.status === 200){
              that.saving = false
              that.$emit('close')
              that.$swal({
                type: 'success',
                title: 'Guardado',
                html: `El link de invitación para el usuario: 
                  <pre><code>${data.link}</code></pre>`
              })
              that.$emit('update-user')
            } else {
              that.saving = false
              that.$swal({
                type: 'error',
                title: 'Error',
                text: `El usuario no se pudo crear.`,
                footer: `Error: ${data}`
              })
            }
          })
          .catch(err => {
            that.saving = false
            that.$swal({
              type: 'error',
              title: 'Error',
              text: `El usuario no se pudo crear.`,
              footer: `Error ${err}`
            })
          })
        }  
      }
    },
    computed: {
      validate: function () {
        this.errors = []

        // email
        var emailRegEx = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        const email = emailRegEx.test(this.user.email)
        if (!email) { this.errors.email = "Debe ser un email válido" }

        return email
      }
    },
    watch: {
      user_id: function () {
        const that = this
        this.$axios.get(`/admin/users/${this.user_id}.json`)
        .then(({data}) => {
          that.user.id = data.user.id
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