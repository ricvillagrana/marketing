<template>
  <div>
    <nav class="navbar is-info" role="navigation" aria-label="dropdown navigation">
      <div class="navbar-menu">
        <div class="navbar-start">
          bars
        </div>

        <div class="navbar-end">
          <div class="navbar-item has-dropdown" :class="{ 'is-active' : showDropdown }">
            <a class="navbar-link" @click="showDropdown = !showDropdown">
              User
            </a>

            <div class="navbar-dropdown is-right">
              <a class="navbar-item">
                Overview
              </a>
              <a class="navbar-item">
                Elements
              </a>
              <a class="navbar-item">
                Components
              </a>
              <hr class="navbar-divider">
              <div class="navbar-item">
                Version 0.7.1
              </div>
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
        showDropdown: false
      }
    },
  }
</script>
