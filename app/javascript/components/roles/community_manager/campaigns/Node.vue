<template>
  <div class="box p-25" v-if="currentNode">
    <button class="button is-warning is-rounded is-pulled-right is-small" @click="$emit('add-child', currentNode)"><i class="fa fa-plus"></i>Nuevo hijo</button>
    <div class="title">
      {{ currentNode.name }}
      <span class="tag is-warning" v-if="currentNode.campaign_id">Es raíz</span>
      <app-dropdown
        :title="dropdown.title"
        :color="dropdown.color"
        :options="dropdown.options"
        @edit="editNode"
        @delete="deleteNode"></app-dropdown>
    </div>
    <div>
      <table class="table">
        <thead>
          <tr>
            <th>Propiedad</th>
            <th>Dato</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Hijo de </td>
            <td>{{ currentNode.father ? currentNode.father.name : 'No tiene padre, es raíz' }}</td>
          </tr>
          <tr>
            <td>Hijos</td>
            <td>{{ currentNode.children.length }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
  import AppDropdown from '../../../app/AppDropdown'

  export default {
    name: 'node',
    props: ['node'],
    components: { AppDropdown },
    data() {
      return {
        currentNode: null,
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
          inputValue: that.currentNode.name,
          preConfirm: (value) => {
            this.$axios.put(`/community_manager/nodes/${that.currentNode.id}`, {
              id: that.currentNode.id,
              name: value
            }).then(({data}) => {
              that.$emit('should-refresh')
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
          title: `Se eliminará el nodo ${that.currentNode.name}`,
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
            this.$axios.delete(`/community_manager/nodes/${that.currentNode.id}`)
            .then(({data}) => {
              if (data.status == 200) {
                that.$emit('should-refresh')
                that.$emit('select', that.currentNode.father.id)
                that.$swal({
                  type: 'success',
                  title: 'Elminado',
                  text: 'El nodo se eliminó de manera correcta.',
                })
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
      }
    },
    watch: {
      node: function () {
        this.currentNode = this.node
      }
    }
  }  
</script>
