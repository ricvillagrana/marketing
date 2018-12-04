<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">{{ user.name }} {{ user.lastname }}</p>
    </template>
    <template slot="content">
      <form>
        <label for="name">Usuario:</label>
        <input type="text" class="input" name="username" v-model="user.username" />
        <span class="has-text-danger is-small">{{ errors.username }}</span><br />

        <label for="name">Nombre:</label>
        <input type="text" class="input" name="name" v-model="user.name" />

        <label for="lastname">Apellido:</label>
        <input type="text" class="input" name="lastname" v-model="user.lastname" />

        <label for="email">Correo electrónico:</label>
        <input type="mail" class="input" name="email" v-model="user.email" />
        <span class="has-text-danger is-small">{{ errors.email }}</span><br />

        <label v-if="user_id" for="comapny">Selecciona una Empresa</label>
        <company-selector
          v-if="user_id"
          :company_id="user.company_id"
          @selected="user.company_id = $event"></company-selector>

        <label for="brithday">Fecha de nacimiento:</label>
        <input type="date" class="input" v-model="user.born_date">
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
  import CompanySelector from './CompanySelectror'

  export default {
    components: {AppModal, CompanySelector},
    name: 'user-form',
    data() {
      return {
        user: {
          id: 0,
          username: '',
          name: '',
          lastname: '',
          born_date: '',
          email: '',
          company_id: 0
        },
        errors: {
          email: '',
          username: ''
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
          this.$axios.put(`/superadmin/admins/${this.user.id}`, this.user)
          .then(({data}) => {
            if(data.status === 200){
              that.saving = false
              that.$emit('close')
              that.$swal({
                type: 'success',
                title: 'Guardado',
                text: `El usuario ${data.user.username} se actualizó correctamente`
              })
              that.$emit('update-users')
              that.user.company_id = 0
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
          this.$axios.post(`/superadmin/admins`, this.user)
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
              that.$emit('update-users')
              that.user.company_id = 0
            } else {
              that.saving = false
              that.$swal({
                type: 'error',
                title: 'Error',
                text: `El usuario no se pudo crear.`,
                footer: `Error: el email o el usuario ya fue tomado por alguien más`
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

        // username
         const username = this.user.username.length >= 3
        if (!username) { this.errors.username = "Debe ser un usuario válido, 3 o más caracteres" }

        return email && username
      }
    },
    watch: {
      user_id: function () {
        const that = this
        this.$axios.get(`/superadmin/admins/${this.user_id}`)
        .then(({data}) => {
          that.user = data.user
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
