<template>
  <div>
    <top-bar />
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
