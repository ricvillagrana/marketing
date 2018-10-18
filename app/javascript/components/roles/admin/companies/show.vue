<template>
  <div v-if="company">
    <div>
      <p class="title is-2">
        <a href="/admin/companies"><i class="fa fa-arrow-left fa-0-8x"></i></a>
        {{ company.name }}
        <a class="ml-15" @click="editCompany"><i class="fa fa-pencil fa-0-8x"></i></a>
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
      <button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Añadir Campaña</button>
      <p class="title is-4">Campañas</p>
    </div>
    <div class="columns">
      <div class="column is-4" v-for="(campaign, key) in company.campaigns" :key="key">
        <app-card>
          <p class="title is-4">{{ campaign.name }}</p>
          <div slot="footer" class="flex-end">
            <button class="button is-link is-rounded">Ver</button>
          </div>
        </app-card>
      </div>
    </div>

    <company-form v-if="company"
      :open="editOptions.open"
      :company_id="editOptions.company_id"
      :noChangeAdmin="true"
      @close="editOptions.open = false"
      @update-companies="fetchCompany"></company-form>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'
  import CompanyForm from '../../superadmin/companies/CompanyForm'

  export default {
    name: 'admin-companies',
    components: {
      AppCard, CompanyForm
    },
    data() {
      return {
        company: null,
        editOptions: {
          open: false,
          company_id: 0
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