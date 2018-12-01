<template>
  <div class="flex flex-col h-100">
    <p class="title flex flex-row">Chat</p>

    <div class="flex flex-col publication-chat-container">
      <div class="chat-scroller" id="chat-box">
        <div class="flex flex-row w-100" :class="$user.id === message.user.id ? 'flex-end' : ''" v-for="(message, index) in messages" :key="index">
          <div class="flex flex-col publication-chat-bubble" :class="$user.id === message.user.id ? 'me' : ''">
            <span class="name font-bold" v-show="$user.id !== message.user.id">
              {{ message.user.name }}
            </span>
            <span>
              {{ message.message.message }}
            </span>
            <span class="date" :title="$moment(message.message.created_at).calendar()">
              {{ $moment(message.message.created_at).fromNow() }}
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="flex flex-row">
      <input @keydown.enter="send" class="publication-chat-input px-10" type="text" name="" v-model="message" placeholder="Escribe un mensaje...">
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
        if (this.message !== '') {
          this.$axios.post('/publication_messages',{
            publication_id: this.publication.id,
            message: this.message
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
