<template>
  <div>
    <top-bar />
    <div class="columns h-100 side-bar">
      <side-bar />
      <div class="column is-main-content">
        <slot></slot>
      </div>
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
