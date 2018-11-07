import WebSocket from './Websocket';

class Test {
  constructor() {
  }
  subscribe() {
    this.subscription = WebSocket.getConsumer().subscriptions.create('TestChannel', {
      connected: function () {
        console.log('Connected to TestChannel')
      },
      received: function (data) {
        console.log(data)
      }
    })
  }
  unsubscribe() {
    if(this.subscription)
      this.subscription.unsubscribe()
  }
}

export default Test
