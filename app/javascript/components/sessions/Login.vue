<template>
  <div>
    Hola, Joel
    <input type="text" v-model="text" />
    <button @click="diHola">Di {{ text }}</button>
  </div>
</template>

<script>
  export default {
    name: 'login',
    data() {
      return {
        text: 'Joel'
      }
    },
    methods: {
      diHola: function () {
        alert(this.text)
      }
    }
  }
</script>
