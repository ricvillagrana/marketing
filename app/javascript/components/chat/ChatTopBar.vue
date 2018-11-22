<template>
  <div class="has-transition-0-2"  @click="$emit('toggle')">
    <nav class="column navbar is-link main-nav-item">
      <span v-if="!name" class="title is-6 has-text-light">Chat</span>
      <div v-else>
        <span  class="title is-6 p-0 has-text-light">{{name}}</span>
        <div class="close-bar" @click="$emit('close', user.id)">
          <i class="fa fa-times m-0 " ></i>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
  export default {
    components: {},
    name: 'chat-top-bar',
    props: ['user', 'name'],
    methods: {
     clouse_chat: function(){
       console.log ("holi");
     }
    }
  }


</script>
