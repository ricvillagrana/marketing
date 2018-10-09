<template>
  <div class="column is-2 is-sidebar-menu is-hidden-mobile">
    <aside class="menu">
      <p class="menu-label">
        Roles
      </p>
      <ul class="menu-list">
        <li v-for="(role, key) in roles" :key="key"><a>{{ role.name }}</a></li>
      </ul>
      <p class="menu-label">
        General
      </p>
      <ul class="menu-list">
        <li><a>Dashboard</a></li>
        <li><a>Customers</a></li>
      </ul>
      <p class="menu-label">
        Transactions
      </p>
      <ul class="menu-list">
        <li><a>Payments</a></li>
        <li><a>Transfers</a></li>
        <li><a>Balance</a></li>
      </ul>
    </aside>
  </div>
</template>

<script>
  export default {
    name: 'sedie-bar',
    props: ['roles']
  }
</script>
