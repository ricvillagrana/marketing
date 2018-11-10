<template>
  <app-card class="column is-2 is-sidebar-menu">
    <div class="menu">
      <p class="menu-label">
        Rol
      </p>
      <div class="tags">
        <span class="tag is-link">{{ role.name }}</span>
      </div>
      <div v-if="role.keyword === 'superadmin'">
        <p class="menu-label">
          Súper admin
        </p>
        <ul class="menu-list">
          <li><a href="/">Inicio</a></li>
          <li><a href="/superadmin/admins">Administradores</a></li>
          <li><a href="/superadmin/companies">Empresas</a></li>
        </ul>
      </div>
      <div v-if="role.keyword === 'admin'">
        <p class="menu-label">
          Administrador
        </p>
        <ul class="menu-list">
          <li><a href="/">Inicio</a></li>
          <li><a href="/admin/company">Empresa</a></li>
          <li><a href="/admin/users">Usuarios</a></li>
        </ul>
      </div>
      <div v-if="role.keyword === 'cm'">
        <p class="menu-label">
          Community Manager
        </p>
        <ul class="menu-list">
          <li><a href="/">Inicio</a></li>
          <li><a href="/community_manager/publications">Publicaciones</a></li>
          <li><a href="/community_manager/campaigns">Campañas</a></li>
        </ul>
      </div>
      <div v-if="role.keyword === 'cg'">
        <p class="menu-label">
          Generador de contenido
        </p>
        <ul class="menu-list">
          <li><a href="/">Inicio</a></li>
          <li><a>Publicaciones</a></li>
        </ul>
      </div>
      <div v-if="role.keyword === 'designer'">
        <p class="menu-label">
          Diseñador
        </p>
        <ul class="menu-list">
          <li><a href="/">Inicio</a></li>
          <li><a href="/designer/publications">Publicaciones</a></li>
        </ul>
      </div>
      <div v-if="role.keyword === 'client'">
        <p class="menu-label">
          Revisión
        </p>
        <ul class="menu-list">
          <li><a href="/">Inicio</a></li>
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
    props: ['role']
  }
</script>
