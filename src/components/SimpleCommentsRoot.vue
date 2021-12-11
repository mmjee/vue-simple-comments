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
  props: ['APIURL', 'currentURL'],
  data: () => ({
    isLoaded: false,
    data: null,
    currentlySelectedComment: null
  }),
  mounted () {
    return this.loadData()
  },
  computed: {
    url () {
      return this.currentURL || window.location.href
    }
  },
  methods: {
    resolveURL (path) {
      const url = new URL(path, this.APIURL)
      return url.href
    },

    async loadData () {
      const { data } = await axios.get(this.resolveURL('api/v1/comments'), {
        params: {
          url: this.url
        }
      })
      this.data = data.rootComments
      this.isLoaded = true
    },

    async onCommentCreated (payload) {
      await axios.post(this.resolveURL('api/v1/comments'), {
        pageURL: this.url,
        ...payload
      })
      await this.loadData()
    }
  }
}
</script>
