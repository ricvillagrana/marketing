<template>
  <div class="field">
    <div class="control">
      <div class="select">
        <select id="company-selector" @change="selected">
          <option :company_id="null">Ninguna</option>
          <option :selected="company_id == company.id ? 'selected' : ''" v-for="(company, key) in companies" :key="key" :company_id="company.id">{{ company.name }}</option>
        </select>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'company-selector',
    props: ['company_id'],
    data() {
      return {
        companies: []
      }
    },
    beforeMount() {
      this.fetchCompanies()
    },
    methods: {
      selected: function () {
        const selector = document.getElementById('company-selector')
        const index = selector.options.selectedIndex
        const selected = selector.options[index]
        const company_id = selected.getAttribute('company_id')
        this.$emit('selected', company_id)
      },
      fetchCompanies: function () {
        const that = this
        this.$axios.get(`/superadmin/companies.json`)
        .then(result => {
          that.companies = result.data.companies.filter(company => !company.admin || company.id === that.company_id).sort((a, b) => b.id - a.id)
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'Error al consultar las empresas',
            footer: `Error: ${err}`
          })
        })
      }
    },
    watch: {
      company_id: function () {
        this.fetchCompanies()
      }
    }
  }
</script>

