<template>
  <div class="columns">
    <div class="column is-4-desktop is-6-tablet is-12-mobile is-offset-4-desktop is-offset-3-tablet has-text-centered card mt-50">
      <div class="card-content">
        <p class="title is-3">Inicia sesión</p>
        <form :action="url" method="post">
          <label for="email">Usuario</label><br />
          <input type="email" name="email" class="input" v-model="form.email" />
          <br />
          <label for="password">Contraseña</label><br />
          <input type="password" name="password" class="input" v-model="form.password" />

          <button type="submit" class="button is-link mt-25" @click="send">
            <i class="fa fa-sign-in"></i>
            Iniciar sesión
          </button>

        </form>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'login',
    data() {
      return {
        form: {
          email: '',
          password: ''
        },
        error: null
      }
    },
    methods: {
      send: function (e) {
        const that = this
        axios.post(this.url, {
          ...that.form
        })
        .then(response => {
          console.log(response.data)
          window.location = '/'
        })
        .catch(err => {
          that.error = err
        })
      }
    },
    props: [
      'user', 'url'
    ]
  }
</script>
