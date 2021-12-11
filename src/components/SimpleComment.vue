<template>
  <v-card class="my-1" elevation="1">
    <v-card-title class="text-h6" style="font-weight: normal">
      <SimpleCommentTitle :comment="data" />
    </v-card-title>
    <v-card-text>
      <span v-html="sanitizedHTML" />
      <v-btn color="primary" @click="$emit('updateCurrent', data)">Reply</v-btn>
      <div :style="childDivStyle" class="mt-1" v-if="data.childComments.length !== 0">
        <simple-comment :index="index + 1" v-for="comment in data.childComments" :key="comment._id" :data="comment" class="ml-2" @updateCurrent="$emit('updateCurrent', $event)" />
      </div>
    </v-card-text>
  </v-card>
</template>

<script>
import dompurify from 'dompurify'
import SimpleCommentTitle from './SimpleCommentTitle'

const borderColors = [
  '#03A9F4',
  '#3F51B5',
  '#D500F9',
  '#E91E63',
  '#6D4C41',
  '#FF5722'
]

export default {
  name: 'SimpleComment',
  components: { SimpleCommentTitle },
  props: ['data', 'index'],
  computed: {
    sanitizedHTML () {
      return dompurify.sanitize(this.data.commentText)
    },

    childDivStyle () {
      return {
        borderLeftWidth: '2px',
        borderLeftColor: borderColors[this.index % borderColors.length],
        borderLeftStyle: 'solid'
      }
    }
  }
}
</script>
