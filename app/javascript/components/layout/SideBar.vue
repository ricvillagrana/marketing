<template>
  <div class="column is-2 is-sidebar-menu is-hidden-mobile">
    <aside class="menu">
      <p class="menu-label">
        Roles
      </p>
      <div class="tags">
        <span class="tag is-link" v-for="(role, key) in roles" :key="key">{{ role.name }}</span>
      </div>
      <div v-if="roles.filter(role => role.id == 1).length !== 0">
        <p class="menu-label">
          Súper admin
        </p>
        <ul class="menu-list">
          <li><a href="/superadmin/admins">Gestionar Administradores</a></li>
          <li><a>Gestionar Empresas</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.id == 2).length !== 0">
        <p class="menu-label">
          Administrador
        </p>
        <ul class="menu-list">
          <li><a>Empresas</a></li>
          <li><a>Campañas</a></li>
          <li><a>Publicaciones</a></li>
          <li><a>Usuarios</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.id == 3).length !== 0">
        <p class="menu-label">
          Community Manager
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.id == 4).length !== 0">
        <p class="menu-label">
          Generador de contenido
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.id == 5).length !== 0">
        <p class="menu-label">
          Diseñador
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
        </ul>
      </div>
    </aside>
  </div>
</template>

<script>
  export default {
    name: 'sedie-bar',
    props: ['roles']
  }
</script>
