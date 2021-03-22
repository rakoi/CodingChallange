
import Vue from 'vue'
import VueToastr from '@deveodk/vue-toastr'
import routes from './routes.js'
import VueRouter from 'vue-router'
require('./bootstrap');
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import { TablePlugin,BootstrapVue} from 'bootstrap-vue'

import VueSidebarMenu from 'vue-sidebar-menu'
Vue.use(TablePlugin)
Vue.use(BootstrapVue)


window.Vue = require('vue');
Vue.use(VueRouter)

Vue.use(VueSidebarMenu)

Vue.use(VueToastr, {
    defaultPosition: 'toast-top-right',
    defaultType: 'info',
    defaultTimeout: 1000
});

Vue.component('products', require('./components/products.vue').default);
Vue.component('top', require('./components/Layout/myHeader.vue').default);
Vue.component('deletemodal', require('./components/DeleteModal.vue').default);
Vue.component('home', require('./components/Home.vue').default);

const app = new Vue({
    el: '#app',
    router:routes,
});
