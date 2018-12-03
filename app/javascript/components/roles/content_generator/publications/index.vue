<template>
  <div>
    <p class="title is-3">Publicaciones</p>
    <div v-if="campaigns">
      <div v-for="(campaign, key) in campaigns" :key="`campaign-${key}`">
        <div class="my-30">
          <!--<button class="button is-link is-rounded is-pulled-right" @click="addOptions.open = true"><i class="fa fa-plus"></i>Añadir Campaña</button>-->
          <p class="title is-4"><a :href="`/community_manager/campaigns/${campaign.data.id}`">{{ campaign.data.name }} <span class="tag">{{ campaign.publications.length }} publicaciones</span></a></p>
          <p
            v-if="campaign.publications.length === 0"
            class="title is-5 has-text-centered has-text-grey">
            Aún no hay publicaciones, pide al Community Manager de ésta campaña que cree una.
          </p>

        </div>
        <div class="columns is-is-fullwidth">
          <div class="column is-4" v-for="(publication, key) in campaign.publications" :key="key">
            <app-card nested="true">
              <div class="mb-15">
                <p class="title is-4 mb-0">{{ publication.name }}</p>
                <!-- <div class="tags has-addons">
                  <span class="tag is-white">Estatus</span>
                  <span class="tag is-success">{{ publication.status.name }}</span>
                </div> -->
              </div>
              <p>
                Nodo: {{ publication.node.name }}
              </p>
              <div slot="footer" class="flex-end">
              <a :href="`/content_generator/publications/${publication.id}`" class="button is-link is-rounded">Ver más</a>
              </div>
            </app-card>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <p
        class="title is-5 has-text-centered has-text-grey">
        Aún tiene hay campañas asignadas aún, ponte en contacto con tu administrador para que te asigne una.
      </p>
    </div>
  </div>
</template>

<script>
  import AppCard from '../../../app/AppCard'

  export default {
    name: 'content-generator-publications',
    components: {
      AppCard
    },
    data() {
      return {
        campaigns: []
      }
    },
    beforeMount() {
      this.fetchCampaigns()
    },
    methods: {
      fetchCampaigns: function () {
        const that = this
        this.$axios.get(`/content_generator/publications.json`)
        .then(({data}) => {
          console.log(data)
          that.campaigns = data.campaigns
        })
        .catch(err => {
          that.$swal({
            type: 'error',
            title: 'Error',
            text: 'No se pudieron obtener las publicaciones.',
            footer: `Error: ${err}`
          })
        })
      }
    }
  }
</script>
