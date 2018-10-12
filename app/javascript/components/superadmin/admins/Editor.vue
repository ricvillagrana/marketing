<template>
  <div class="modal" :class="{ 'is-active' : open}">
    <div class="modal-background"  @click="$emit('close')"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Modificando a {{ user.name }} {{ user.lastname }}</p>
        <button class="delete" aria-label="close" @click="$emit('close')"></button>
      </header>
      <section class="modal-card-body">
        <form>
          <label for="name">Usuario:</label>
          <input type="text" class="input" name="username" v-model="user.username" />

          <label for="name">Nombre:</label>
          <input type="text" class="input" name="name" v-model="user.name" />

          <label for="lastname">Apellido:</label>
          <input type="text" class="input" name="lastname" v-model="user.lastname" />

          <label for="email">Correo electrónico:</label>
          <input type="mail" class="input" name="email" v-model="user.email" />

          <label for="brithday">Fecha de nacimiento:</label>
          <input type="date" class="input" v-model="user.borthday">

        </form>
      </section>
      <footer class="modal-card-foot">
        <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save"><i class="fa fa-save"></i>Guardar</button>
        <button class="button is-danger" @click="$emit('close')"><i class="fa fa-times"></i>Cancelar</button>
      </footer>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'admin-editor',
    data() {
      return {
        user: {
          username: '',
          name: '',
          lastname: '',
          birthday: '',
          email: ''
        },
        saving: false
      }
    },
    props: ['open', 'id'],
    methods: {
      save: function () {
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
          that.user.birthdate = data.user.birthdate
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
