<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">Crear nueva campaña.</p>
    </template>
    <template slot="content">
      <div>
        <label for="name">Nombre de la campaña:</label>
        <input type="text" class="input is-medium" name="name" :class="{ 'is-danger': errors.name }" v-model="campaign.name" />
        <span class="has-text-danger is-small">{{ errors.name }}</span><br />

        <label for="objetive">Objetivo:</label>
        <textarea class="textarea is-medium" name="objetive" :class="{ 'is-danger': errors.objetive }" v-model="campaign.objetive"></textarea>
        <span class="has-text-danger is-small">{{ errors.objetive }}</span><br />

        <label for="cm">Community Manager:</label>
        <cm-select
          :user_id="campaign.community_manager_id"
          @user-selected="campaign.community_manager_id = $event"
        ></cm-select>

        <label for="init_date">Fecha de inicio:</label>
        <input type="date" min="2018-01-01" class="input is-medium" name="init_date" :class="{ 'is-danger': errors.init_date }" v-model="campaign.init_date" />
        <span class="has-text-danger is-small">{{ errors.init_date }}</span><br />

        <label for="finish_date">Fecha de finalización:</label>
        <input type="date" min="2018-01-01" class="input is-medium" name="finish_date" :class="{ 'is-danger': errors.finish_date }" v-model="campaign.finish_date" />
        <span class="has-text-danger is-small">{{ errors.finish_date }}</span><br />

      </div>
    </template>
    <template slot="footer">
      <button class="button is-danger" @click="close()"><i class="fa fa-times"></i>Cancelar</button>
      <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save" :disabled="!validate"><i class="fa fa-plus"></i>Crear</button>
    </template>
  </app-modal>
</template>

<script>
  import AppModal from '../../../app/AppModal'
  import CmSelect from './CmSelect'
  
  export default {
    components: {
      AppModal, CmSelect
    },
    name: 'campaign-form',
    data() {
      return {
        saving: false,
        campaign: null,
        errors: {
          name: '',
          objetive: '',
          init_date: '',
          final_date: ''
        }
      }
    },
    props: ['open', 'company_id', 'id'],
    beforeMount() {
      this.reset()
    },
    methods: {
      save: function (e) {
        e.preventDefault()
        const that = this
        this.saving = true
        this.$axios.post(`/admin/companies/${this.company_id}/campaigns`, { campaign: this.campaign })
        .then(({data}) => {
          if(data.status === 200){
            that.saving = false
            that.close()
            that.$emit('update-company')
          } else {
            that.saving = false
            console.log(data)
            that.$swal({
              type: 'error',
              title: 'Error',
              text: `No se pudo crear la campaña.`,
              footer: `Error: el Community Manager debe existir`
            })
          }
        })
        .catch(err => {
          that.saving = false
          that.$swal({
            type: 'error',
            title: 'Error',
            text: `No se pudo crear la campaña.`,
            footer: `Error ${err}`
          })
        }) 
      },
      close: function () {
        this.reset()
        this.$emit('close')
      },
      reset: function () {
        this.campaign = {
          name: '',
          objetive: '',
          init_date: '',
          finish_date: '',
          image: '',
          finished: '',
          deleted: false,
          community_manager_id: 0
        }
      }
    },
    computed: {
      validate: function () {
        this.errors = []

        // name
        const name = this.campaign.name !== ''
        if (!name) { this.errors.name = "Debe contener algún nombre." }

        // objetive
        const objective_min = 30
        const objective_max = 300
        const objetive =
          this.campaign.objetive !== '' &&
          this.campaign.objetive.length >= objective_min &&
          this.campaign.objetive.length <= objective_max
        if (!objetive) { this.errors.objetive = `El objetivo debe contener entre ${objective_min} y ${objective_max} caracteres, pero tú escribiste ${this.campaign.objetive.length}` }

        // init_date
        const init_date = this.campaign.init_date !== ''
        if (!init_date) { this.errors.init_date = `Debe ser una fecha correcta` }

        // finish_date
        const finish_date = this.campaign.finish_date !== '' && this.$moment(this.campaign.init_date).isBefore(this.$moment(this.campaign.finish_date))
        if (!finish_date) { this.errors.finish_date = `Debe ser una hora correcta y posterior a la fecha inicial` }

        return name && objetive && init_date && finish_date
      }
    },
    watch: {
      id: function () {
        const that = this
        this.$swal({
          title: 'Cargando...',
          onOpen: () => that.$swal.showLoading()
        })
        this.$axios.get(`/admin/companies/${this.id}`)
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
