<template>
  <app-card class="column is-2 is-sidebar-menu is-hidden-mobile">
    <div class="menu">
      <p class="menu-label">
        Roles
      </p>
      <div class="tags">
        <span class="tag is-link" v-for="(role, key) in roles" :key="key">{{ role.name }}</span>
      </div>
      <div v-if="roles.filter(role => role.keyword === 'superadmin').length !== 0">
        <p class="menu-label">
          Súper admin
        </p>
        <ul class="menu-list">
          <li><a href="/superadmin/admins">Gestionar Administradores</a></li>
          <li><a href="/superadmin/companies">Gestionar Empresas</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.keyword === 'admin').length !== 0">
        <p class="menu-label">
          Administrador
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
          <li><a href="/admin/companies">Empresas</a></li>
          <li><a href="/admin/users">Usuarios</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.keyword === 'cm').length !== 0">
        <p class="menu-label">
          Community Manager
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.keyword === 'cg').length !== 0">
        <p class="menu-label">
          Generador de contenido
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.keyword === 'designer').length !== 0">
        <p class="menu-label">
          Diseñador
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
        </ul>
      </div>
      <div v-if="roles.filter(role => role.keyword === 'client').length !== 0">
        <p class="menu-label">
          Revisión
        </p>
        <ul class="menu-list">
          <li><a>Publicaciones</a></li>
          <li><a>Campañas</a></li>
        </ul>
      </div>
    </div>
  </app-card>
</template>

<script>
  import AppCard from '../app/AppCard'

  export default {
    components: {AppCard},
    name: 'sedie-bar',
    props: ['roles']
  }
</script>
