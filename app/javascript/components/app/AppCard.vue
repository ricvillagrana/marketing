<template>
  <div class="px-10">
    <div class="app-card" :class="[padding ? `p-${padding}` : 'p-35', { 'app-card-nested' : nested }]">
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
    props: ['nested', 'padding']
  }
</script>
