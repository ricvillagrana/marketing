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

          <div v-if="!registered">

            <label for="password">Contraseña:</label>
            <input type="password" class="input" v-model="currentUser.password">

            <label for="password_confirmation">Confirmación de contraseña:</label>
            <input type="password" class="input" v-model="currentUser.password_confirmation">

          </div>

          <button class="button is-link mt-20" :class="{ 'is-loading' : saving }" @click="save" :disabled="!enabled"><i class="fa fa-save"></i>Guardar</button>
        </form>
        <a href="/">Login</a>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'register',
    props: ['user','registered'],
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
        let user = null
        if(this.registered){
          user = {
            id: this.currentUser.id,
            username: this.currentUser.username,
            name: this.currentUser.name,
            lastname: this.currentUser.lastname,
            born_date: this.currentUser.born_date,
            email: this.currentUser.email
          }
        }else{
          user= {
            ...this.currentUser
          }
        }
        this.$axios.put(`/invited/${this.currentUser.id}`, {user})
        .then(({data}) => {
          if (data.status === 200){
            that.saving = false
            if(that.registered){
              that.$swal({
                type: 'success',
                title: 'Éxito',
                text: 'El usuario fue modificado'
              })
            }else{
              that.$redirect('/')
            }
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
      enabled() {
        let password = true
        if(!this.registered) {
          password = this.currentUser.password == this.currentUser.password_confirmation && this.currentUser.password.length >= 6
        }
        const name = this.currentUser.name.length >= 2
        const username = this.currentUser.username.length >= 3

        return password && name && username

      }
    }
  }
</script>
