<template>
  <div>
    <app-card nested="true" v-if="node">
      <button class="button is-warning is-rounded is-pulled-right is-small" @click="$emit('add-child', node)"><i class="fa fa-plus"></i>Nuevo hijo</button>
      <div class="title">
        {{ node.name }}
        <span class="tag is-warning" v-if="node.campaign_id">Es raíz</span>
        <app-dropdown
          :title="dropdown.title"
          :color="dropdown.color"
          :options="dropdown.options"
          @edit="editNode"
          @delete="deleteNode"></app-dropdown>
      </div>
      <div>
        <table class="table is-striped is-bordered">
          <thead>
            <tr>
              <th>Propiedad</th>
              <th>Dato</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Hijo de </td>
              <td>{{ node.father ? node.father.name : 'No tiene padre, es raíz' }}</td>
            </tr>
            <tr>
              <td>Hijos</td>
              <td>{{ node.children.length }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </app-card>
    <app-card nested="true" v-else>
      <div class="title is-5 has-text-centered has-text-grey">
        Selecciona un nodo para obtener información
      </div>
    </app-card>
  </div>
</template>

<script>
  import AppDropdown from '../../../app/AppDropdown'
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'node',
    props: ['node_id'],
    components: { AppDropdown, AppCard },
    data() {
      return {
        node: null,
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
    methods: {
      editNode: function () {
        const that = this
        this.$swal({
          title: 'Nombre del nodo',
          input: 'text',
          inputValue: that.node.name,
          preConfirm: (value) => {
            this.$axios.put(`/community_manager/nodes/${that.node.id}`, {
              id: that.node.id,
              name: value
            }).then(({data}) => {
              that.$emit('should-refresh')
              that.fetchNode()
            })
            .catch(err => {
              console.log(err)
            })
          }
        })
      },
      deleteNode: function () {
        const that = this
        this.$swal({
          title: `Se eliminará el nodo ${that.node.name}`,
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
            this.$axios.delete(`/community_manager/nodes/${that.node.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$emit('should-refresh')
                that.$emit('select', that.node.father.id)
                that.$swal.close()
              } else {
                that.$swal({
                  type: 'error',
                  title: 'Error',
                  text: 'No se pudo eliminar al nodo.',
                  footer: `Error: ${data.message}`
                })
              }
            })
            .catch(err => {
              that.$swal({
                type: 'error',
                title: 'Error',
                text: 'No se pudo eliminar al nodo.',
                footer: `Error: ${err}`
              })
            })
          }
        })
      },
      fetchNode: function () {
        const that = this
        if (this.node_id) this.$axios.get(`/community_manager/nodes/${this.node_id}.json`)
        .then(({data}) => {
          that.node = data.node
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
    },
    watch: {
      node_id: function () {
        this.fetchNode()
      }
    }
  }  
</script>
