<template>
  <div class="box p-25" v-if="node">
    <button class="button is-warning is-rounded is-pulled-right is-small" @click="$emit('add-child', node)"><i class="fa fa-plus"></i>Nuevo hijo</button>
    <p class="title">{{ node.name }} <span class="tag is-warning" v-if="node.campaign_id">Es raíz</span></p>
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
            <td>{{ node.father ? node.father.name : 'No tiene padre, es raíz' }}</td>
          </tr>
          <tr>
            <td>Hijos</td>
            <td>{{ node.children.length }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'node',
    props: ['node']
  }  
</script>
