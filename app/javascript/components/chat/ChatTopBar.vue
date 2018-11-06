<template>
  <div style="padding: 10 10 0 10;">
    <nav class="column navbar is-success ">
      <a @click="active" >chat</a>
    </nav>
  </div>
</template>

<script>
    export default {
    components: {},
    name: 'chat-top-bar',
     data: {
      open: false
    },
    props: ['user', 'data'],
      methods: {
        active: function(){
          if(open == false){
            open = true
              }else{
            open = false
          }
          }
        }
      }

</script>
