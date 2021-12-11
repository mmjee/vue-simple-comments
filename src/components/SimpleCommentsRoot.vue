<template>
  <v-progress-linear v-if="!isLoaded" indeterminate />
  <div v-else style="margin: 0 auto; max-width: 1080px;">
    <SimpleComment v-for="comment in data" @updateCurrent="currentlySelectedComment = $event" :index="0" :data="comment" :key="comment._id" />
    <CommentEditor :currentSelection="currentlySelectedComment" @updateCurrent="currentlySelectedComment = $event" @commentCreated="onCommentCreated" />
  </div>
</template>

<script>
import axios from 'axios'
import SimpleComment from './SimpleComment'
import CommentEditor from './CommentEditor'

export default {
  name: 'SimpleCommentsRoot',
  components: {
    SimpleComment,
    CommentEditor
  },
  data: () => ({
    isLoaded: false,
    data: null,
    currentlySelectedComment: null
  }),
  mounted () {
    return this.loadData()
  },
  methods: {
    async loadData () {
      const { data } = await axios.get('http://localhost:3000/api/v1/comments', {
        params: {
          url: window.location.href
        }
      })
      this.data = data.rootComments
      this.isLoaded = true
    },

    async onCommentCreated (payload) {
      await axios.post('http://localhost:3000/api/v1/comments', {
        pageURL: window.location.href,
        ...payload
      })
      await this.loadData()
    }
  }
}
</script>
