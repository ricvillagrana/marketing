<template>
  <div>
    <top-bar />
    <button class="button is-primary">Hola</button>
    <slot></slot>
  </div>
</template>

<script>
  import TopBar from './TopBar'

  export default {
    name: 'layout',
    components: {
      TopBar
    }
  }
</script>
