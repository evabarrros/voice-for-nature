<template>
  <v-card class="pa-3 ma-3 text" outlined color="rgba(0, 0, 0, 0.5)" theme="dark">
    <h2>
      Deltapond
    </h2>
    <div class="history" md="12" color="white">
      <div v-html="story" />
    </div>
  </v-card>
</template>

<script>
import _ from 'lodash'
// let files = require.context('../components/stories', true, /.md$/)
// const filenames = files.keys()
// const chapters = []
// filenames.forEach(file => {
//   const name = /(?<=\/)(.*?)(?=\.)/g.exec(file)
//   chapters.push({ name: name, text: files(file).default })
// })
export default {
  name: 'StoriesView',
  computed: {
    story () {
      console.log(this.$router)
      const story = _.get(this.$route, 'params.storyName', 'fallback')
      return require(`../components/stories/${story}.md`).default
    }
  }
}
</script>

<style>
.stories {
   position: sticky;
   top: 0;
   z-index: 2;
   display: block;
   justify-content: right;
   height: 100%;
   max-height: 100vh;
}

.text {
  height: 100%;
  overflow-y: scroll;
}

.video-wrap video{
  width: 100%;
}
</style>