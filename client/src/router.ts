import { createRouter, createWebHistory } from 'vue-router'
import HelloWorld from './components/HelloWorld.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/hello',
    name: 'Hello',
    component: HelloWorld
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
