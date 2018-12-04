<template>
  <div class="flex flex-col h-100">
    <p class="title flex flex-row mb-0">
      Chat
    </p>

    <div class="flex flex-col publication-chat-container">
      <div class="chat-scroller" id="chat-box">
        <div class="flex flex-row w-100 publication-message animate fadeInRight delay-2s" :class="$user.id === message.user.id ? 'flex-end' : ''" v-for="(message, index) in messages" :key="index">
          <div class="flex" :class="$user.id === message.user.id ? 'flex-row' : 'flex-row-reverse'">
            <span class="date mt-0 flex flex-row flex-self-end mx-7 mb-7">
              {{ $moment(message.message.created_at).fromNow() }}, {{ $moment(message.message.created_at).calendar() }}
            </span>
            <div class="publication-chat-bubble flex flex-col" :class="$user.id === message.user.id ? 'me' : ''">
              <span class="name font-bold" v-show="$user.id !== message.user.id">
                {{ message.user.name }}
              </span>
              <span>
                {{ message.message.message }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex flex-row w-50">
      <input @keydown.enter="send" class="publication-chat-input px-10" name="" v-model="message" placeholder="Escribe un mensaje...">
      <button @click="send" class="button is-link publication-chat-button" type="button"><i class="fa fa-normal fa-send"></i></button>
    </div>

    <action-cable-vue :channel="'PublicationChatChannel'"
                      :room="publication.id.toString()"
                      @received="appendMessage($event)"></action-cable-vue>
  </div>
</template>

<script>
  import ActionCableVue from '../ActionCableVue'

  export default {
    name: 'publication-chat',
    components: { ActionCableVue },
    props: {
      publication: Object
    },
    data() {
      return {
        message: '',
        messages: []
      }
    },
    computed: {},
    methods: {
      appendMessage(message) {
        this.messages.push({...message.message})
        this.down()
      },
      send() {
        if (this.message.trim() !== '' && this.message.trim().length !== 0) {
          this.$axios.post('/publication_messages',{
            publication_id: this.publication.id,
            message: this.message.trim()
          })
          this.message = ''
        }
        this.down()
      },
      down() {
        setTimeout(() => {
          const messagesBox = document.getElementById('chat-box')
          messagesBox.scrollTo(0, messagesBox.scrollHeight)
        }, 10)
      },
      fetchMessages() {
        const that = this

        this.$axios.get(`/publication_messages/${this.publication.id}.json`)
        .then(({data}) => {
          that.messages = data.messages
          that.down()
        })
        .catch(err => {
          this.$swal({
            type: 'error',
            title: 'Error',
            text: err
          })
        })
      }
    },
    created() {},
    mounted() {
      this.fetchMessages()
      setInterval(() => {
        const messages = this.messages
        this.messages = []
        this.messages = messages

      }, 1000)
    }
  }
</script>
