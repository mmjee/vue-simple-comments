<template>
  <span>
    Comment left by {{ comment.username }} at {{ timeHuman }}
  </span>
</template>

<script>
const DTF = new Intl.DateTimeFormat('default', {
  day: 'numeric',
  month: 'numeric',
  year: 'numeric',
  hour: 'numeric',
  minute: 'numeric',
  second: 'numeric',
  timeZoneName: 'short'
})

export default {
  name: 'SimpleCommentTitle',
  props: ['comment'],
  computed: {
    timeHuman () {
      return DTF.format(new Date(this.comment.createdAt))
    }
  }
}
</script>
