<template>
  <app-modal :open='open' @close="$emit('close')">
    <template slot="header">
      <p class="modal-card-title">Crear nueva campaña.</p>
    </template>
    <template slot="content">
      <div>
        <label for="name">Nombre de la campaña:</label>
        <input type="text" class="input " name="name" :class="{ 'is-danger': errors.name }" v-model="campaign.name" />
        <span class="has-text-danger is-small">{{ errors.name }}</span><br />

        <label for="objetive">Objetivo:</label>
        <textarea class="textarea " name="objetive" :class="{ 'is-danger': errors.objetive }" v-model="campaign.objetive"></textarea>
        <span class="has-text-danger is-small">{{ errors.objetive }}</span><br />

        <label for="cm">Community Manager:</label>
        <cm-select
          :user_id="campaign.community_manager_id"
          @user-selected="campaign.community_manager_id = $event"
        ></cm-select>

        <label for="init_date">Fecha de inicio:</label>
        <input type="date" min="2018-01-01" class="input " name="init_date" :class="{ 'is-danger': errors.init_date }" v-model="campaign.init_date" />
        <span class="has-text-danger is-small">{{ errors.init_date }}</span><br />

        <label for="finish_date">Fecha de finalización:</label>
        <input type="date" min="2018-01-01" class="input" name="finish_date" :class="{ 'is-danger': errors.finish_date }" v-model="campaign.finish_date" />
        <span class="has-text-danger is-small">{{ errors.finish_date }}</span><br />

      </div>
    </template>
    <template slot="footer">
      <button class="button is-danger" @click="close()"><i class="fa fa-times"></i>Cancelar</button>
      <button class="button is-link" :class="{ 'is-loading' : saving }" @click="save" :disabled="!validate"><i class="fa fa-save"></i>Guardar</button>
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
        if (!this.id) {
          this.$axios.post(`/admin/companies/${this.company_id}/campaigns`, { campaign: this.campaign })
          .then(({data}) => {
            if(data.status === 200) {
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
        } else {
          this.$axios.put(`/admin/campaigns/${this.campaign.id}`, { campaign: this.campaign })
          .then(({data}) => {
            if(data.status === 200) {
              that.saving = false
              that.close()
              that.$emit('update-campaign')
            } else {
              that.saving = false
              console.log(data)
              that.$swal({
                type: 'error',
                title: 'Error',
                text: `No se pudo modificar la campaña.`,
                footer: `Error: el Community Manager debe existir`
              })
            }
          })
          .catch(err => {
            that.saving = false
            that.$swal({
              type: 'error',
              title: 'Error',
              text: `No se pudo modificar la campaña.`,
              footer: `Error ${err}`
            })
          })
        }
      },
      close: function () {
        this.reset()
        this.$emit('close')
      },
      reset: function () {
        this.campaign = {
          id: '',
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
        this.$axios.get(`/admin/campaigns/${this.id}.json`)
        .then(({data}) => {
          that.campaign.id = data.campaign.id
          that.campaign.name = data.campaign.name
          that.campaign.objetive = data.campaign.objetive
          that.campaign.init_date = data.campaign.init_date
          that.campaign.finish_date = data.campaign.finish_date
          that.campaign.image = data.campaign.image
          that.campaign.finished = data.campaign.finished
          that.campaign.deleted = data.campaign.deleted
          that.campaign.community_manager_id = data.campaign.community_manager_id
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
