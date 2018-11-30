import WebSocket from './Websocket';

class PublicationChat {
  constructor() {
  }
  subscribe() {
    this.subscription = WebSocket.getConsumer().subscriptions.create('PublicationChatChannel', {
      connected() {
        console.log('Connected to PublicationChatChannel')
      },
      received(data) {
        console.log(data)
      }
    })
  }
  unsubscribe() {
    if(this.subscription)
      this.subscription.unsubscribe()
  }
}

export default PublicationChat
