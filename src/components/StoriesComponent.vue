<template>
  <Scrollama
    class="stories"
    :debug="true"
    :offset="0.5"
  >
  <v-card class="pa-3 text" outlined color="rgba(0, 0, 0, 0.5)" theme="dark">
    <h2>
      Deltapond
    </h2>
    <div class="history" md="12" color="white">
      <div v-for="chapter in chapters" :key="chapter.name" v-html="chapter.text" />
    </div>
  </v-card>
  </Scrollama>
</template>
<script>
let files = require.context('./stories', true, /.md$/)
const filenames = files.keys()
const chapters = []
filenames.forEach(file => {
  const name = /(?<=\/)(.*?)(?=\.)/g.exec(file)
  chapters.push({ name: name, text: files(file).default })
})
export default {
  name: 'BackgroundViewer',
  data () {
    return {
      chapters
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