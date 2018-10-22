<template>
  <div>
    <p class="title is-3">Empresas</p>
    <div class="columns">
      <div class="column is-6" v-for="(company, key) in companies" :key="key">
        <app-card nested="true">
          <p class="title is-4">{{ company.name }}</p>
          <span class="">{{ company.description }}</span>
          <div slot="footer" class="flex-end">
            <a class="button is-link is-rounded" :href="`/admin/companies/${company.id}`">Ver más</a>
          </div>
        </app-card>
      </div>
    </div>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'admin-companies',
    components: {AppCard},
    data() {
      return {
        companies: []
      }
    },
    beforeMount() {
      this.fetchCompanies()
    },
    methods: {
      fetchCompanies: function () {
        const that = this
        this.$axios.get('/admin/companies.json')
        .then(({data}) => {
          that.companies = data.companies
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudo actualizar la lista de empresas.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>