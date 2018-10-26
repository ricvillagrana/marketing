<template>
  <div v-if="campaign">
    <div class="mb-30">
      <p class="title is-3">
        <a :href="`/admin/companies/${campaign.company.id}`"><i class="fa fa-arrow-left fa-0-8x"></i></a>
        {{ campaign.name }} <span v-if="campaign.finished" class="tag">Finalizada</span>
        <app-dropdown
          :title="dropdown.title"
          :color="dropdown.color"
          :options="dropdown.options"
          @edit="editCampaign"
          @delete="deleteCampaign"></app-dropdown>
      </p>
      <p class="title is-5">Community Manager: {{ campaign.community_manager.name }} {{ campaign.community_manager.lastname }}</p>
      <table class="table is-bordered is-striped is-fullwidth">
        <tbody>
          <tr>
            <th>Objetivo</th>
            <td>{{ campaign.objetive }}</td>
          </tr>
          <tr>
            <th>Fechas</th>
            <td>Desde {{ $date(campaign.init_date) }} hasta {{ $date(campaign.finish_date) }}</td>
          </tr>
          <tr>
            <th>Empresa</th>
            <td>{{ campaign.company.name }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <campaign-users
      :users="campaign.users"
      :community_manager_id="campaign.community_manager.id"
      :campaign_id="campaign.id"
      :company_id="campaign.company_id"></campaign-users>

    <campaign-form v-if="campaign"
      :open="editOptions.open"
      :noChangeAdmin="true"
      :id="editOptions.id"
      :company_id="campaign.company.id"
      @close="editOptions.open = false"
      @update-campaign="fetchCampaign"></campaign-form>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import AppDropdown from '../../../app/AppDropdown'
  import CampaignForm from '../companies/CampaignForm'
  import CampaignUsers from './Users'

  export default {
    name: 'admin-campaigns-show',
    components: {
      AppCard, AppDropdown, CampaignForm, CampaignUsers
    },
    data() {
      return {
        campaign: null,
        editOptions: {
          open: false,
          id: 0
        },
        dropdown: {
          title: '',
          color: 'light',
          options: [
            {
              name: 'Editar',
              icon: 'pencil',
              shouldEmit: 'edit',
              class: 'has-text-link'
            },
            {
              name: 'Eliminar',
              icon: 'times',
              shouldEmit: 'delete',
              class: 'has-text-danger'
            }
          ]
        }
      }
    },
    props: ['campaign_id'],
    beforeMount() {
      this.fetchCampaign()
    },
    methods: {
      editCampaign: function () {
        this.editOptions.open = true
        this.editOptions.id = this.campaign.id
      },
      deleteCampaign: function () {
        const that = this
        this.$swal({
          title: `Se eliminará la campaña ${that.campaign.name}`,
          text: "No se podrá recuprar",
          type: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Eliminar',
          cancelButtonText: 'No, cancelar',
          cancelButtonColor: 'red',
          reverseButtons: true
        }).then((result) => {
          if (result.value) {
            this.$swal({
              title: 'Eliminando...',
              onOpen: () => that.$swal.showLoading()
            })
            this.$axios.delete(`/admin/campaigns/${that.campaign.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$redirect(`/admin/companies/${that.campaign.company.id}`)
                that.$swal({
                  type: 'success',
                  title: 'Elminado',
                  text: 'La campaña se eliminó de manera correcta.',
                })
              } else {
                that.$swal({
                  type: 'error',
                  title: 'Error',
                  text: 'No se pudo eliminar la campaña.',
                  footer: `Error: ${data.message}`
                })
              }
            })
            .catch(err => {
              that.$swal({
                type: 'error',
                title: 'Error',
                text: 'No se pudo eliminar la campaña.',
                footer: `Error: ${err}`
              })
            })
          }
        })
      },
      fetchCampaign: function () {
        const that = this
        this.$axios.get(`/admin/campaigns/${this.campaign_id}.json`)
        .then(({data}) => {
          that.campaign = data.campaign
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo obtener la información.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>