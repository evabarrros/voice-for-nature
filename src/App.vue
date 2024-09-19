<template>
  <v-app>
    <v-main>
      <background-viewer />
      <stories-component class="ma-3"/>
    </v-main>
  </v-app>
</template>

<script>
import StoriesComponent from '@/components/StoriesComponent.vue'
import BackgroundViewer from '@/components/BackgroundViewer.vue'

export default {
  name: 'App',

  components: {
    StoriesComponent,
    BackgroundViewer
  },

  data: () => ({
  }),

  mounted () {
  }
}
</script>

<style>
.v-main__wrap{
  display: flex;
  justify-content: right;
}
</style>