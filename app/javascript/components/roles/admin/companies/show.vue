<template>
  <div v-if="company">
    <div>
      <p class="title is-3">
        <a href="/admin/companies"><i class="fa fa-arrow-left fa-0-8x"></i></a>
        {{ company.name }}
        <app-dropdown
          :title="dropdown.title"
          :color="dropdown.color"
          :options="dropdown.options"
          @edit="editCompany"
          @delete="deleteCompany"></app-dropdown>
      </p>
      <p class="title is-5">Administrador: {{ company.admin.name }} {{ company.admin.lastname }}</p>
      <table class="table is-bordered is-striped is-fullwidth">
        <tbody>
          <tr>
            <th>Nombre de contacto</th>
            <td>{{ company.contact_name }}</td>
          </tr>
          <tr>
            <th>Teléfono</th>
            <td>{{ company.phone }}</td>
          </tr>
          <tr>
            <th>Correo electrónico</th>
            <td>{{ company.email }}</td>
          </tr>
          <tr>
            <th>Dirección</th>
            <td>{{ company.address }}</td>
          </tr>
          <tr>
            <th>Horarios</th>
            <td>De {{ $time(company.init_hour) }} a {{ $time(company.final_hour) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="my-25">
      <button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Añadir Campaña</button>
      <p class="title is-4">Campañas</p>
    </div>
    <div class="columns is-is-fullwidth">
      <div class="column is-3" v-for="(campaign, key) in company.campaigns" :key="key">
        <app-card nested="true">
          <p class="title is-4">{{ campaign.name }}</p>
          <p class="title is-6">Community manager: {{ campaign.community_manager.name }}</p>
          <p>Objetivo: {{ campaign.objetive }}</p>
          <div slot="footer" class="flex-end">
            <a :href="`/admin/campaigns/${campaign.id}`" class="button is-link is-rounded">Ver más</a>
          </div>
        </app-card>
      </div>
    </div>

    <campaign-form v-if="company"
      :open="addOptions.open"
      :noChangeAdmin="true"
      :company_id="company.id"
      @close="addOptions.open = false"
      @update-company="fetchCompany"></campaign-form>
    
    <company-form v-if="company"
      :open="editOptions.open"
      :company_id="editOptions.company_id"
      :noChangeAdmin="true"
      @close="editOptions.open = false"
      @update-company="fetchCompany"></company-form>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import AppDropdown from '../../../app/AppDropdown'
  import CompanyForm from '../../superadmin/companies/CompanyForm'
  import CampaignForm from './CampaignForm'

  export default {
    name: 'admin-companies',
    components: {
      AppCard, AppDropdown, CompanyForm, CampaignForm
    },
    data() {
      return {
        company: null,
        editOptions: {
          open: false,
          company_id: 0
        },
        addOptions: {
          open: false
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
    props: ['company_id'],
    beforeMount() {
      this.fetchCompany()
    },
    methods: {
      editCompany: function () {
        this.editOptions.open = true
        this.editOptions.company_id = this.company.id
      },
      deleteCompany: function () {
        const that = this
        this.$swal({
          title: `Se eliminará la empresa ${that.company.name}`,
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
            this.$axios.delete(`/admin/companies/${that.company.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$swal({
                  type: 'success',
                  title: 'Elminado',
                  text: 'La empresa se eliminó de manera correcta.',
                })
                that.$redirect('/admin/companies')
              } else {
                that.$swal({
                  type: 'error',
                  title: 'Error',
                  text: 'No se pudo eliminar la empresa.',
                  footer: `Error: ${data.message}`
                })
              }
            })
            .catch(err => {
              that.$swal({
                type: 'error',
                title: 'Error',
                text: 'No se pudo eliminar la empresa.',
                footer: `Error: ${err}`
              })
            })
          }
        })
      },
      fetchCompany: function () {
        const that = this
        this.$axios.get(`/admin/companies/${this.company_id}.json`)
        .then(({data}) => {
          that.company = data.company
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