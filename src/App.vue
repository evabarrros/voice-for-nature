<template>
  <v-app>
    <v-main>
      <background-viewer />
      <v-card class="ma-3 information" :height="folded? '300px' : '100%'" outlined color="rgba(0, 0, 0, 0.5)" theme="dark">
        <v-tabs
          v-model="tab"
          align-tabs="title"
        >
          <v-tab
            v-for="item in tabs"
            :key="item"
            :text="item"
            :value="item"
            :to="`./${item}`"
          ></v-tab>
        </v-tabs>
        <v-tabs-window class="rel-height">
            <router-view></router-view>
        </v-tabs-window>
      </v-card>
      <v-btn class="ma-3" :icon="folded ? 'mdi-chevron-down' : 'mdi-chevron-up'" @click="folded= !folded"></v-btn>
    </v-main>
  </v-app>
</template>

<script>
import BackgroundViewer from '@/components/BackgroundViewer.vue'

export default {
  name: 'App',

  components: {
    BackgroundViewer
  },

  data: () => ({
    tabs: ["stories", "chat"],
    tab: "stories",
    folded: true
  }),

  mounted () {
  }
}
</script>

<style>
html {
  height: 100vh;
  overflow-y: hidden;
}

.information {
  width: 30vw;
  min-width: 500px;
  max-height: 90vh;
}

.rel-height {
  height: 100%;
}
</style>