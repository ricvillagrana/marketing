<template>
  <div v-if="conversation">
    <div class="general-chat-list flex flex-col">
      <div class="flex flex-row justify-between general-chat-content-head flex">
        <span class="flex flex-col py-10 px-15 cursor-pointer w-100" @click="$emit('toggleChatStatus', chat)">{{ chat.user.name }} {{ chat.user.lastname }}</span>
        <span class="flex flex-col justify-center button py-20 is-link cursor-pointer" @click="$emit('removeConversation', chat.user)"><i class="fa fa-times fa-normal"></i></span>
      </div>
      <div class="general-chat-conversation-content p-10 flex-col" :id="`chat-box-general-${conversation.id}`" v-show="chat.opened"
           @click="focusInput">
        <div class="flex flex-row w-100 publication-message animate fadeInRight delay-2s" :class="$user.id === message.user.id ? 'flex-end' : ''"
             v-for="(message, index) in messages"
             :key="index">
          <div class="flex" :class="$user.id === message.user.id ? 'flex-row' : 'flex-row-reverse'">
            <span class="date mt-0 flex flex-row flex-self-end content is-small mx-7 mb-7" :title="$moment(message.message.created_at).fromNow()">
                {{ $moment(message.message.created_at).calendar() }}
              </span>
            <div class="publication-chat-bubble flex flex-col" :class="$user.id === message.user.id ? 'me' : ''">
              <!-- <span class="name font-bold" v-show="$user.id !== message.user.id">
                  {{ message.user.name }}
                </span> -->
              <span>
                  {{ message.message }}
                </span>
            </div>
          </div>
        </div>
      </div>
      <input class="general-chat-input"
             :id="`chat-box-general-input-${conversation.id}`"
             type="text"
             v-model="message"
             @keypress.enter="send"
             placeholder="Escribe un mensaje..."
             v-show="chat.opened">
    </div>

    <action-cable-vue :channel="'ConversationChannel'"
                      :room="conversation.id.toString()"
                      v-if="conversation"
                      @received="appendMessage($event)"></action-cable-vue>
  </div>
</template>

<script>
  import ActionCableVue from '../ActionCableVue'

  export default {
    name: 'general-chat-conversation',
    components: {
      ActionCableVue
    },
    props: {
      chat: Object
    },
    data() {
      return {
        conversation: null,
        messages: [],
        message: ''
      }
    },
    computed: {},
    methods: {
      appendMessage({ message }) {
        this.messages.push(JSON.parse(message))
        this.down()
      },
      send() {
        if (this.message.trim() !== '' && this.message.trim().length !== 0) {
          this.$axios.post('/chat/message', {
            conversation_id: this.conversation.id,
            message: this.message.trim()
          })
          this.message = ''
        }
        this.down()
      },
      focusInput() {
        document.getElementById(`chat-box-general-input-${this.conversation.id}`).focus()
      },
      down() {
        if (this.conversation)
          setTimeout(() => {
            const messagesBox = document.getElementById(`chat-box-general-${this.conversation.id}`)
            messagesBox.scrollTo(0, messagesBox.scrollHeight)
          }, 10)
      },
      fetchConversation() {
        const that = this

        this.$axios
          .post('/chat/conversation', {
            user_id: this.chat.user.id
          })
          .then(({ data }) => {
            that.conversation = data.conversation
            that.messages = data.conversation.messages
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
      this.fetchConversation()
    }
  }
</script>

<style lang='scss' scoped>

</style>
