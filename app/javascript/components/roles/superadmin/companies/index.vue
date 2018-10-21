<template>
  <div>
    <button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Añadir Empresa</button>
    <p class="title is-3">Empresas</p>
    <div v-if="companies.length === 0">
      <p class="title is-3">No hay empresas registrades.</p>
    </div>
    <table v-else class="table is-bordered is-striped is-hoverable is-fullwidth">
      <thead>
        <tr class="has-text-weight-bold">
          <td>Nombre</td>
          <td>Administrador</td>
          <td>Nombre de contacto</td>
          <td>Teléfono</td>
          <td>Correo electrónico</td>
          <td>Dirección</td>
          <td>Horarios</td>
          <td style="width: 150px;">Opciones</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(company, key) in companies" :key="key">
          <td>{{ company.name }}</td>
          <td>{{ company.admin ? company.admin.name : '[Sin asignar]' }}</td>
          <td>{{ company.contact_name }}</td>
          <td>{{ company.phone }}</td>
          <td>{{ company.email }}</td>
          <td>{{ company.address }}</td>
          <td>De {{ $time(company.init_hour) }} a {{ $time(company.final_hour) }}</td>
          <td>
            <div class="buttons has-addons">
              <!--<a class="button is-link"><i class="fa fa-eye"></i></a>-->
              <a class="button is-warning" @click="editCompany(company)"><i class="fa fa-edit"></i></a>
              <a class="button is-danger" @click="deleteCompany(company)"><i class="fa fa-times"></i></a>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <company-form
      :open="editOptions.open"
      :company_id="editOptions.company_id"
      @close="editOptions.open = false"
      @update-company="fetchCompanies"></company-form>
    <company-form
      :open="addOptions.open"
      @close="addOptions.open = false"
      @update-company="fetchCompanies"></company-form>
  </div>
</template>

<script>
  import CompanyForm from './CompanyForm'

  export default {
    name: 'superadmin-companies',
    data() {
      return {
        companies: [],
        editOptions: {
          open: false,
          company_id: 0
        },
        addOptions: {
          open: false
        },
        base_url: window.location.origin
      }
    },
    props: ['users'],
    mounted() {
      this.fetchCompanies()
    },
    components: {
      CompanyForm
    },
    methods: {
      addCompany: function () {
        const that = this
        this.addOptions.open = true
      },
      editCompany: function ({id}) {
        this.editOptions.company_id = id
        this.editOptions.open = true
      },
      deleteCompany: function (company) {
        const that = this
        this.$swal({
          title: `Se eliminará la empresa ${company.name}`,
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
            this.$axios.delete(`/superadmin/companies/${company.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$swal({
                  type: 'success',
                  title: 'Elminado',
                  text: 'La empresa se eliminó de manera correcta.',
                })
              }
              that.fetchCompanies()
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
      fetchCompanies: function () {
        const that = this
        this.$axios.get('/superadmin/companies.json')
        .then(({data}) => {
          that.companies = data.companies
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo actualizar la lista de usiarios.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>
