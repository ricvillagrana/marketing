import Cable from 'es6-actioncable';

class Websocket {
  constructor() {
  }

  connect() {
    const url = 'ws://localhost:3000/cable'
    this.consumer = Cable.createConsumer(url);
  }

  getConsumer() {
    if(!this.consumer) {
      this.connect();
    }
    return this.consumer;
  }

  closeConnection() {
    if(this.consumer) {
      Cable.endConsumer(this.consumer);
    }
    delete this.consumer;
  }
}

export default new Websocket
