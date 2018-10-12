<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">Invitar nuevo administrador.</p>
    </template>
    <template slot="content">
      <div>
        <label for="email">Correo electrónico:</label>
        <input type="mail" class="input" name="email" v-model="user.email" />
      </div>
    </template>
    <template slot="footer">
      <button class="button is-danger" @click="$emit('close')"><i class="fa fa-times"></i>Cancelar</button>
      <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save"><i class="fa fa-plus"></i>Invitar</button>
    </template>
  </app-modal>
</template>

<script>
  import AppModal from '../../app/AppModal'
  export default {
    components: {AppModal},
    name: 'admin-add',
    data() {
      return {
        user: {
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
            this.$emit('update-users')
          } else {
            that.saving = false
            console.log(data.errors.email)
            that.$swal({
              type: 'error',
              title: 'Error',
              text: `El usuario no se pudo crear.`,
              footer: `Error: email ${data.errors.email[0]}`
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
