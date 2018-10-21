<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">Empresa {{ company.name }}</p>
    </template>
    <template slot="content">
      <div>
        <label for="name">Nombre de la empresa:</label>
        <input type="text" class="input" :class="{ 'is-danger': errors.name }" name="name" v-model="company.name" />
        <span class="has-text-danger is-small">{{ errors.name }}</span><br />

        <label for="description">Descripción:</label>
        <textarea class="textarea" :class="{ 'is-danger': errors.description }" name="description" v-model="company.description"></textarea>
        <span class="has-text-danger is-small">{{ errors.description }}</span><br />

        <div v-if="!noChangeAdmin">
          <label for="user_id">Administrador:</label>
          <admin-selector @user-selected="company.user_id = $event" :user_id="company.user_id"></admin-selector>
        </div>

        <label for="contact_name">Nombre de contacto:</label>
        <input type="text" class="input" :class="{ 'is-danger': errors.contact_name }" name="contact_name" v-model="company.contact_name" />
        <span class="has-text-danger is-small">{{ errors.contact_name }}</span><br />

        <label for="phone">Teléfono:</label>
        <input type="number" class="input" :class="{ 'is-danger': errors.phone }" name="phone" v-model="company.phone" />
        <span class="has-text-danger is-small">{{ errors.phone }}</span><br />

        <label for="email">Correo electrónico:</label>
        <input type="email" class="input" :class="{ 'is-danger': errors.email }" name="email" v-model="company.email" />
        <span class="has-text-danger is-small">{{ errors.email }}</span><br />

        <label for="address">Dirección:</label>
        <input type="text" class="input" :class="{ 'is-danger': errors.address }" name="address" v-model="company.address" />
        <span class="has-text-danger is-small">{{ errors.address }}</span><br />

        <label for="init_hour">Hora de inicio de labores:</label>
        <input type="time" class="input" :class="{ 'is-danger': errors.init_hour }" name="init_hour" v-model="company.init_hour" />
        <span class="has-text-danger is-small">{{ errors.init_hour }}</span><br />

        <label for="final_hour">Hora de final de labores:</label>
        <input type="time" class="input" :class="{ 'is-danger': errors.final_hour }" name="final_hour" v-model="company.final_hour" />
        <span class="has-text-danger is-small">{{ errors.final_hour }}</span><br />
      </div>
    </template>
    <template slot="footer">
      <button class="button is-danger" @click="$emit('close')"><i class="fa fa-times"></i>Cancelar</button>
      <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save" :disabled="!validate"><i class="fa fa-save"></i>Guardar</button>
    </template>
  </app-modal>
</template>

<script>
  import AppModal from '../../../app/AppModal'
  import AdminSelector from './AdminSelector'

  export default {
    components: {AppModal, AdminSelector},
    name: 'company-form',
    data() {
      return {
        company: {
          id: '',
          user_id: '',
          name: '',
          description: '',
          contact_name: '',
          phone: '',
          email: '',
          address: '',
          init_hour: '',
          final_hour: ''
        },
        errors: [],
        saving: false
      }
    },
    props: ['open', 'company_id', 'noChangeAdmin'],
    methods: {
      save: function (e) {
        e.preventDefault()
        const that = this
        this.saving = true
        if (this.company_id) {
          this.$axios.put(`/superadmin/companies/${this.company.id}`, { ...this.company })
          .then(({data}) => {
            if(data.status === 200){
              that.saving = false
              that.$emit('close')
              that.$swal({
                type: 'success',
                title: 'Empresa actualizada',
                text: 'Se actualizó correctamente'
              })
              that.$emit('update-company')
            } else {
              that.saving = false
              that.$swal({
                type: 'error',
                title: 'Error',
                text: `No se pude guardar la empresa.`,
                footer: `Error: admin ${data.errors.admin[0]}`
              })
            }
          })
          .catch(err => {
            that.saving = false
            that.$swal({
              type: 'error',
              title: 'Error',
              text: `No se pude guardar la empresa.`,
              footer: `Error ${err}`
            })
          }) 
        } else {
          this.$axios.post(`/superadmin/companies`, { ...this.company })
          .then(({data}) => {
            if(data.status === 200){
              that.saving = false
              that.$emit('close')
              that.$swal({
                type: 'success',
                title: 'Empresa creada',
                text: 'Se creó correctamente'
              })
              that.$emit('update-company')
            } else {
              that.saving = false
              that.$swal({
                type: 'error',
                title: 'Error',
                text: `No se pude crear la empresa.`,
                footer: `Error: admin ${data.errors.admin[0]}`
              })
            }
          })
          .catch(err => {
            that.saving = false
            that.$swal({
              type: 'error',
              title: 'Error',
              text: `No se pude crear la empresa.`,
              footer: `Error ${err}`
            })
          }) 
        }
      }
    },
    computed: {
      validate: function () {
        this.errors = []
        // Name
        const name = this.company.name !== ''
        if (!name) { this.errors.name = "No puede estar vacío." }

        // Description 
        const descriptionLengthRequired = 50
        const descriptionLength =this.company.description.length
        const description = descriptionLength >= descriptionLengthRequired
        if (!description) { this.errors.description = `Debe tener al menos ${descriptionLengthRequired} letras, son ${descriptionLength}.` }
        
        // Contact name
        const contact_name = this.company.contact_name !== ''
        if (!contact_name) { this.errors.contact_name = "No puede estar vacío." }
        
        // phone
        const phone = this.company.phone.length == 10
        if (!phone) { this.errors.phone = "Deben ser 10 dígitos." }
        
        // email
        var emailRegEx = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        const email = emailRegEx.test(this.company.email)
        if (!email) { this.errors.email = "Debe ser un email válido" }
        
        // address
        const address = this.company.address !== ''
        if (!address) { this.errors.address = "No puede estar vacía" }
        
        // init_hour
        const init_hour = this.company.init_hour !== ''
        if (!init_hour) { this.errors.init_hour = "Debe ser una hora correcta" }
        
        // final_hour
        const final_hour = this.company.final_hour !== ''
        if (!final_hour) { this.errors.final_hour = "Debe ser una hora correcta" }

        return name && description && contact_name && phone && email && address && init_hour && final_hour
      }
    },
    watch: {
      company_id: function () {
        const that = this
        this.$axios.get(`/superadmin/companies/${this.company_id}`)
        .then(({data}) => {
          that.company.id = data.company.id
          that.company.user_id = data.company.user_id
          that.company.name = data.company.name
          that.company.description = data.company.description
          that.company.contact_name = data.company.contact_name
          that.company.phone = data.company.phone
          that.company.email = data.company.email
          that.company.address = data.company.address
          that.company.init_hour = that.$inputTime(data.company.init_hour)
          that.company.final_hour = that.$inputTime(data.company.final_hour)
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
