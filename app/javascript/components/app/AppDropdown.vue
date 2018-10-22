<template>
  <div class="dropdown" :class="{ 'is-active' : dropdownActive }">
    <div class="dropdown-trigger">
      <button class="button" :class="`is-${color}`" aria-haspopup="true" aria-controls="dropdown-menu" @click="dropdownActive = !dropdownActive">
        <span v-if="title">{{ title }}</span>
        <span class="icon is-small">
          <i class="fa fa-normal fa-angle-down" aria-hidden="true"></i>
        </span>
      </button>
    </div>
    <div class="dropdown-menu" id="dropdown-menu" role="menu">
      <div class="dropdown-content">
        <a class="dropdown-item" v-for="(option, key) in options" :class="option.class" :key="key" @click="$emit(option.shouldEmit)">
          <i class="fa" :class="`fa-${option.icon}`"></i>{{ option.name }}
        </a>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name:'app-dropdown',
    props: ['title', 'color', 'options'],
    data() {
      return {
        dropdownActive: false,
      }
    }
  }
</script>
