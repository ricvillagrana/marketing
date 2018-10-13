<template>
  <div>
   <nav class="navbar is-link">
      <div class="navbar-brand">
        <a class="navbar-item" href="/">
          <p class="title is-4 has-text-light">Marketing</p>
        </a>

        <div class="navbar-burger burger" data-target="navMenubd-example" :class="{ 'is-active':showNavbar }" @click="showNavbar = !showNavbar">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>

      <div class="navbar-menu" :class="{ 'is-active':showNavbar }">
        <div class="navbar-start">
          
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="field is-grouped">
              <span class="button is-link is-rounded">
                <i class="fa fa-comment fa-normal"></i>
                <span class="tag is-warning is-rounded is-notification-counter" v-if="messages > 0">{{ messages }}</span>
              </span>
              <span class="button is-link is-rounded">
                <i class="fa fa-bell fa-normal"></i>
                <span class="tag is-warning is-rounded is-notification-counter" v-if="notifications > 0">{{ notifications }}</span>
              </span>
            </div>
          </div>
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link menu-name">
              {{ user.name }} {{ user.lastname }}
            </a>
            <div class="navbar-dropdown ">
              <a class="navbar-item ">
                Perfil
              </a>
              <hr class="navbar-divider">
              <a class="navbar-item has-text-danger" data-method="delete" href="/users/sign_out">
                <i class="fa fa-times"></i>Cerrar sesión
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
    name: 'top-bar',
    data() {
      return {
        showNavbar: false,
        notifications: 0,
        messages: 0
      }
    },
    props: ['user']
  }
</script>
