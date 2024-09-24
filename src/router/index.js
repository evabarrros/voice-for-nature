import { createRouter, createWebHistory } from 'vue-router'
import StoriesView from '../views/StoriesView.vue'
import ChatBox from '../views/ChatBox.vue'

const routes = [
  {
    path: '/stories/:storyName',
    name: 'stories',
    component: StoriesView
  },
  {
    path: '/chat',
    name: 'chat',
    component: ChatBox
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
