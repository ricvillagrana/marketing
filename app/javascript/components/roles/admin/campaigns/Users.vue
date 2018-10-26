<template>
  <div class="box">
    <p class="title is-4">Usuarios que participan en la campaña.</p>
    <div class="columns">
      <app-card :nested="true" :padding="15" class="column is-4">
        <p class="title is-6">Generadores de contenido</p>
        <p class="title is-6">Diseñadores</p>
      </app-card>
      <app-card :nested="true" :padding="15" class="column is-4">
        <p class="title is-6">Generadores de contenido</p>
      </app-card>
      <app-card :nested="true" :padding="15" class="column is-4 ">
        <p class="title is-6">Diseñadores</p>
        <draggable v-model="designers.server" class="" :options="{group:'people'}">
          <div v-for="(element, key) in designers.server" :key="`designer-server-${key}`">{{element.name}}</div>
        </draggable>
      </app-card>
    </div>
  </div>
</template>

<script>
  import draggable from 'vuedraggable'
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'campaign-users',
    props: ['users'],
    components: { draggable, AppCard },
    data() {
      return {
        content_generators: {
          server: [],
          stored: []
        },
        designers: {
          server: [],
          stored: []
        },
      }
    }
  }
</script>
