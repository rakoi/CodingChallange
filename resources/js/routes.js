import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from './components/Home.vue'
import Suppliers from './components/Suppliers.vue'
import Orders from './components/Orders.vue'

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: "home",
      component: Home
    },
    {
      path: '/suppliers',
      name: "suppliers",
      component: Suppliers
    },
    {
      path: '/orders',
      name: "orders",
      component: Orders
    }
  ]
})

export default router;