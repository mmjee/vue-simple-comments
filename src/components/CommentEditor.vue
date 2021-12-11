<template>
  <span>
    <v-alert color="orange lighten-4" class="ma-0 mt-2" dense dismissible @input="$emit('updateCurrent', null)" v-if="currentSelection">
      Currently replying to
      <simple-comment-title :comment="currentSelection" />
    </v-alert>
    <mavon-editor language="en" v-model="markdown" />
    <v-row class="my-2" align="center">
      <v-col md="4">
        <v-text-field full-width label="Username" dense v-model="username" />
      </v-col>
      <v-col md="2">
        <v-btn width="100%" color="primary" @click="onSubmit">Submit</v-btn>
      </v-col>
    </v-row>
  </span>
</template>

<script>
import { mavonEditor } from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'

import SimpleCommentTitle from './SimpleCommentTitle'

export default {
  name: 'CommentEditor',
  components: {
    mavonEditor,
    SimpleCommentTitle
  },
  props: ['currentSelection'],
  data: () => ({
    username: '',
    markdown: ''
  }),
  methods: {
    onSubmit () {
      const x = {
        username: this.username,
        commentText: this.markdown
      }

      if (this.currentSelection != null) {
        x.parent = this.currentSelection._id
      }

      this.$emit('commentCreated', x)
    }
  }
}
</script>
