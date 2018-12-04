<template>
  <div>

  </div>
</template>

<script>
import ActionCable from 'actioncable'

export default {
  name: 'action-cable-vue',
  props: {
    channel: String,
    room: String
  },
  data() {
    return {
      consumer: null,
      subscription: null
    }
  },
  methods: {
    subscribe() {
      if (this.subscription) this.unsubscribe()
      this.consumer = ActionCable.createConsumer(`ws://${window.location.host}/cable`);
      if (this.channel && this.room) {
        this.subscription = this.consumer.subscriptions.create({channel: this.channel, room: this.room}, {
          received:       e     => this.$emit('received', e),
          initialized:    ()    => this.$emit('initialized'),
          connected:      ()    => this.$emit('connected'),
          disconnected:   ()    => this.$emit('disconnected'),
          rejected:       ()    => this.$emit('rejected')
        })
      }
    },
    unsubscribe() {
      this.consumer.subscriptions.remove(this.subscription)
    }
  },
  mounted() {
      this.subscribe()
  },
  watch: {
    room() {
      this.subscribe()
    }
  }
}
</script>
