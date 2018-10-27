<template>
  <div class="box p-25" v-if="node">
    <p class="title">{{ node.name }}</p>
    <p>Tiene {{ node.children.length }} hijos.</p>
    <p v-if="node.campaign_id">Es raiz</p>
  </div>
</template>

<script>
  export default {
    name: 'node',
    props: ['node']
  }  
</script>
