<template>
  <div :class="[{ 'h-100' : fullHeight }, margin ? `px-${margin}` : 'px-10']">
    <div class="app-card" :class="[padding ? `p-${padding}` : 'p-35', { 'app-card-nested' : nested }, { 'app-card-shadowless' : shadowless }, { 'h-100' : fullHeight }]">
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
    props: ['nested', 'padding', 'margin', 'fullHeight', 'shadowless']
  }
</script>
