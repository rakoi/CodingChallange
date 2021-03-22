import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from './components/Home.vue'
import Suppliers from './components/Suppliers.vue'
import Orders from './components/Orders.vue'
import Login from './components/Login.vue'
import Register from './components/Register.vue'
import Products from './components/products.vue'
Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: "home",
      component: Products
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
    },
    {
      path: '/login',
      name: "login",
      component: Login
    },
    {
      path: '/register',
      name: "register",
      component: Register
    }
  ]
})

export default router;