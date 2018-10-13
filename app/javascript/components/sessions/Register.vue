<template>
  <div class="columns">
    <div class="column is-4-desktop is-6-tablet is-12-mobile is-offset-4-desktop is-offset-3-tablet has-text-centered card mt-50">
      <div class="card-content">
        <p class="title is-3">Registro de usuario</p>
        <form>
          <label for="name">Usuario:</label>
          <input type="text" class="input" name="username" v-model="currentUser.username" />

          <label for="name">Nombre:</label>
          <input type="text" class="input" name="name" v-model="currentUser.name" />

          <label for="lastname">Apellido:</label>
          <input type="text" class="input" name="lastname" v-model="currentUser.lastname" />

          <label for="email">Correo electrónico:</label>
          <input type="mail" class="input" name="email" v-model="currentUser.email" />

          <label for="brithday">Fecha de nacimiento:</label>
          <input type="date" class="input" v-model="currentUser.born_date">

          <label for="password">Contraseña:</label>
          <input type="password" class="input" v-model="currentUser.password">

          <label for="password_confirmation">Confirmación de contraseña:</label>
          <input type="password" class="input" v-model="currentUser.password_confirmation">

          <button class="button is-link mt-20" :class="{ 'is-loading' : saving }" @click="save" :disabled="disabled"><i class="fa fa-save"></i>Guardar</button>
        </form>
        <a href="/">Login</a>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'register',
    props: ['user'],
    data() {
      return {
        currentUser: {
          id: '',
          username: '',
          name: '',
          lastname: '',
          born_date: '',
          email: '',
          password: '',
          password_confirmation: ''
        },
        saving: false,
      }
    },
    created() {
      this.currentUser.id = this.user.id
      this.currentUser.username = this.user.username
      this.currentUser.name = this.user.name
      this.currentUser.lastname = this.user.lastname
      this.currentUser.born_date = this.user.born_date
      this.currentUser.email = this.user.email
    },
    methods: {
      save: function (e) {
        e.preventDefault()
        const that = this
        this.saving = true
        this.$axios.put(`/invited/${this.currentUser.id}`, {
          user: {
            ...this.currentUser
          }
        })
        .then(({data}) => {
          if (data.status === 200){
            window.location = '/'
          }
        })
        .catch(err => {
          that.saving = false
          that.$swal({
            type: 'error',
            title: 'Error',
            text: `Error: ${err}`
          })
        })
      }
    },
    computed: {
      disabled() {
        return this.currentUser.password !== this.currentUser.password_confirmation || this.currentUser.password.length < 6
      }
    }
  }
</script>
