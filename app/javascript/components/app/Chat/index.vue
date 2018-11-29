<template>
  <div class="flex flex-col h-100">
    <p class="title flex flex-row">Chat</p>

    <div class="flex flex-col publication-chat-container">
      <div class="chat-scroller" id="chat-box">
        <div class="flex flex-row w-100" :class="7 === message.user.id ? 'flex-end' : ''" v-for="(message, index) in messages" :key="index">
          <span class="flex flex-col publication-chat-bubble" :class="7 === message.user.id ? 'me' : ''">
            <span class="name">{{ 7 === message.user.id ? 'Tú' : message.user.name }} a las {{ $time(message.time) }}</span>
            {{ message.message }}
          </span>
        </div>
      </div>
    </div>
    <div class="flex flex-row">
      <input @keydown.enter="send" class="publication-chat-input px-10" type="text" name="" v-model="message" placeholder="Escribe un mensaje...">
      <button @click="send" class="button is-link publication-chat-button" type="button"><i class="fa fa-normal fa-send"></i></button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'publication-chat',
  components: {},
  props: {},
  data() {
    return {
      message: '',
      messages: [
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: 'Hola',
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: `Cómo estás?
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
          time: new Date()
        },

        {
          user: {
            id: 7,
            name: 'Ricardo'
          },
          message: 'Bien',
          time: new Date()
        },
        {
          user: {
            id: 1,
            name: 'Joel'
          },
          message: 'Excelente!!!',
          time: new Date()
        },

      ]
    }
  },
  computed: {},
  methods: {
    send() {
      if (this.message !== '') {
        this.messages.push({
          user: {
            id: 7,
            name: 'Ricardo'
          },
          message: this.message,
          time: new Date()
        })
        this.message = ''
      }
      this.down()
    },
    down() {
			setTimeout(() => {
				const messagesBox = document.getElementById("chat-box");
				messagesBox.scrollTo(0, messagesBox.scrollHeight)
			}, 10);
		}

  },
  created() {},
  mounted() {
    this.down()
  },
}
</script>
