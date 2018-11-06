<template>
  <div class="column is-2 is-fixed p-0 m-0">
    <app-card padding="0" noFooter="true" class="is-2 is-sidebar-menu is-hidden-mobile">
      <chat-top-bar></chat-top-bar>
      <div class="p-20">
        {{ user.name }} {{ user.lastname }}

      </div>
    </app-card>
  </div>
  

</template>


<script>
  import AppCard from '../app/AppCard'
  import ChatTopBar from '../chat/ChatTopBar'

  export default {
    components: {
      AppCard, ChatTopBar},
    name: 'chat',
    props: ['user']
  }
</script>