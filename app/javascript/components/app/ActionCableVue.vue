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
    return {}
  },
  computed: {},
  methods: {},
  created() {},
  mounted() {
    const consumer = ActionCable.createConsumer(`wss://${window.location.host}/cable`);
    if (this.channel && this.room) consumer.subscriptions.create({channel: this.channel, room: this.room}, {
      received:       e     => this.$emit('received', e),
      initialized:    ()    => this.$emit('initialized'),
      connected:      ()    => this.$emit('connected'),
      disconnected:   ()    => this.$emit('disconnected'),
      rejected:       ()    => this.$emit('rejected')
    })
  },
}
</script>
