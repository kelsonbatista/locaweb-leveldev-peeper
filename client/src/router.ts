import { createRouter, createWebHistory } from 'vue-router'
import HelloWorld from './components/HelloWorld.vue'
import MyHello from './components/MyHello.vue'

const routes: Array<RouteRecordRaw> = [
  { path: '/hello', name: 'Hello', component: HelloWorld },
  { path: '/myhello', name: 'My Hello', component: MyHello }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
