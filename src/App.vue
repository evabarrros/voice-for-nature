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
          ></v-tab>
        </v-tabs>
        <v-tabs-window class="rel-height" v-model="tab">
          <v-tabs-window-item class="rel-height" value="text">
            <stories-component class="ma-3"/>
          </v-tabs-window-item>
          <v-tabs-window-item value="chat">
            <chat-box />
          </v-tabs-window-item>
        </v-tabs-window>
      </v-card>
      <v-btn class="ma-3" :icon="folded ? 'mdi-chevron-down' : 'mdi-chevron-up'" @click="folded= !folded"></v-btn>

    </v-main>
  </v-app>
</template>

<script>
import StoriesComponent from '@/components/StoriesComponent.vue'
import BackgroundViewer from '@/components/BackgroundViewer.vue'
import ChatBox from '@/components/ChatBox.vue'

export default {
  name: 'App',

  components: {
    StoriesComponent,
    BackgroundViewer,
    ChatBox
  },

  data: () => ({
    tabs: ["text", "chat"],
    tab: "text",
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