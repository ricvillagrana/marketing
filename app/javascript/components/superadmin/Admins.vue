<template>
  <div>
    <p class="title is-2">Administradores</p>
    <table class="table is-bordered is-striped is-hoverable is-fullwidth">
      <thead>
        <tr class="has-text-weight-bold">
          <!--<td>Imagen</td>-->
          <td>Nombre</td>
          <td>Apellido</td>
          <td>Usuario</td>
          <td>Correo electŕonico</td>
          <td>Se unió</td>
          <td>Opciones</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(admin, key) in admins" :key="key">
          <!--<td>
            <figure>
              <img :src="admin.image" :alt="admin.name" class="image is-32x32" />
            </figure>
          </td>-->
          <td>{{ admin.name }}</td>
          <td>{{ admin.lastname }}</td>
          <td>{{ admin.username }}</td>
          <td>{{ admin.email }}</td>
          <td>{{ admin.created_at }}</td>
          <td>
            <div class="buttons has-addons">
              <!--<a class="button is-link"><i class="fa fa-eye"></i></a>-->
              <a class="button is-warning" @click="edit(admin.id)"><i class="fa fa-edit"></i></a>
              <a class="button is-danger"><i class="fa fa-times"></i></a>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <admin-editor :open="editor.open" :id="editor.user_id" @close="editor.open = false"></admin-editor>
  </div>
</template>

<script>
  import AdminEditor from './admins/Editor'
  export default {
    name: 'superadmin-admins',
    data() {
      return {
        editor: {
          open: false,
          user_id: 0
        }
      }
    },
    props: ['admins'],
    components: {
      AdminEditor
    },
    methods: {
      edit: function (user_id) {
        this.editor.user_id = user_id
        this.editor.open = true
      },
      delete: function (user_id) {
        
      }
    }
  }
</script>
