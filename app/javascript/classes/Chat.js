class Chat {
  constructor (user, state = { open: false }) {
    this.user = user
    this.state = state
  //this.messages = []
  }

  toggle() {
    console.log(this)
    this.state.open = !this.state.open
  }

  appendMessage (message) {
    this.messages.push(message)
  }
}

export default Chat
