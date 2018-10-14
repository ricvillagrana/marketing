<template>
  <div class="px-10">
    <div class="app-card p-35" :class="{ 'app-card-shadowless' : shadowless }">
      <slot></slot>
      <div class="mt-25">
        <slot name="footer"></slot>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'app-card',
    props: ['shadowless']
  }
</script>
