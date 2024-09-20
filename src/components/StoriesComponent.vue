<template>
  <Scrollama
    class="stories"
    :debug="true"
    :offset="0.5"
  >
  <v-card class="pa-3 ma-3" outlined color="rgba(0, 0, 0, 0.5)">
    <h2>
      Deltapond
    </h2>
    <div class="history" md="12">
      <div class="history-markdown" v-html="content" />
    </div>
    <div class="video-wrap">
    <video controls="true">
      <source src="https://github.com/openearth/voice-for-nature/raw/refs/heads/main/src/components/stories/history/timelapse.mp4" type="video/mp4">
    </video>
  </div>
    <div class="history" md="12">
      <div class="history-markdown" v-html="content2" />
    </div>


  </v-card>
  </Scrollama>
</template>
<script>
import content from './stories/history/text.md'
import content2 from './stories/history/text2.md'

export default {
  name: 'BackgroundViewer',
  data () {
    return {
      content,
      content2,
    }
  }
}
</script>

<style>
.stories {
   position: sticky;
   top: 0;
   z-index: 2;
   width: 30vw;
   min-width: 150px;
   display: block;
   justify-content: right;
}
</style>