<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">{{ user.name }} {{ user.lastname }}</p>
    </template>
    <template slot="content">
      <form>
        <label for="name">Usuario:</label>
        <input type="text" class="input" name="username" v-model="user.username" />

        <label for="name">Nombre:</label>
        <input type="text" class="input" name="name" v-model="user.name" />

        <label for="lastname">Apellido:</label>
        <input type="text" class="input" name="lastname" v-model="user.lastname" />

        <roles-select
          v-if="user.id"
          :user_id="user.id"
          :company_id="company_id"></roles-select>

        <label for="email">Correo electrónico:</label>
        <input type="mail" class="input" name="email" v-model="user.email" />
        <span class="has-text-danger is-small">{{ errors.email }}</span><br />

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
  import RolesSelect from './RolesSelect'
  
  export default {
    components: {
      AppModal, RolesSelect
    },
    name: 'user-form',
    data() {
      return {
        user: null,
        errors: {
          email: ''
        },
        saving: false
      }
    },
    props: ['open', 'user_id', 'company_id'],
    beforeMount() {
      this.userReset()
    },
    methods: {
      userReset: function () {
        this.user = {
          id: null,
          username: '',
          name: '',
          lastname: '',
          born_date: '',
          email: ''
        }
      },
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
              that.userReset()
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
          this.$axios.post(`/admin/users`, {
            ...this.user,
            company_id: this.company_id
          })
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
              that.userReset()
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
