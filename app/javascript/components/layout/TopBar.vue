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
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              Nombre de 
            </a>
            <div class="navbar-dropdown ">
              <a class="navbar-item ">
                Perfil
              </a>
              <hr class="navbar-divider">
              <a class="navbar-item has-text-danger">
                <i class="fa fa-times"></i>Cerrar sesión
              </a>
            </div>
          </div>
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="field is-grouped">
              <p class="control">
              </p>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
  export default {
    name: 'top-bar',
    data() {
      return {
        showNavbar: false
      }
    },
  }
</script>
