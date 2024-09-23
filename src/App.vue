<template>
  <v-app>
    <v-main>
      <background-viewer />
      <v-card class="ma-3 information" outlined color="rgba(0, 0, 0, 0.5)" theme="dark">
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
        <v-tabs-window v-model="tab">
          <v-tabs-window-item value="text">
            <stories-component class="ma-3"/>
          </v-tabs-window-item>
          <v-tabs-window-item value="chat">
            <chat-box />
          </v-tabs-window-item>
        </v-tabs-window>
      </v-card>
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
    tab: "text"
  }),

  mounted () {
  }
}
</script>

<style>
html {
  height: 100vh;
}

.v-main__wrap{
  display: flex;
  justify-content: right;
}

.information {
  max-height: 90vh;
  width: 30vw;
  min-width: 500px;
}
</style>