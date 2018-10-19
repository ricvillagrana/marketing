<template>
  <div class="modal" :class="{ 'is-active' : open}">
    <div class="modal-background"  @click="$emit('close')"></div>
    <div class="modal-card"  :style="size ? `width: ${size}% !important;` : ''">
      <header class="modal-card-head">
        <p class="modal-card-title"><slot name="header"></slot></p>
        <button class="delete" aria-label="close" @click="$emit('close')"></button>
      </header>
      <section class="modal-card-body">
        <slot name="content"></slot>
      </section>
      <footer class="modal-card-foot">
        <slot name="footer"></slot>
      </footer>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'app-modal',
    props: ['open', 'size']
  }
</script>
