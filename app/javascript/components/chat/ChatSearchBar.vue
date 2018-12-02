<template>
  <div>
    <p class="control has-icons-left has-icons-right p-0">
      <input class="input" placeholder="Buscar" v-model="words" @keyup="$emit('update-words', words)">
      <span class="icon is-small is-left">
        <i class="fa fa-search"></i>
      </span> 
    </p>
  </div>
</template>

<script>
export default {
  data () {
    return {
      words: ''
    }
  }
}
</script>

