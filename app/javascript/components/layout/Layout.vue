<template>
  <div>
    <top-bar />
    <side-bar />
    <div class="column is-main-content">
      <slot></slot>
    </div>
  </div>
</template>

<script>
  import TopBar from './TopBar'
  import SideBar from './SideBar'

  export default {
    name: 'layout',
    components: {
      TopBar, SideBar
    }
  }
</script>
