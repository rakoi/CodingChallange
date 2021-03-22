<template>
  <div id="header">
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
      <router-link class="navbar-brand" to="/">Solutech</router-link>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="nav navbar-nav ml-auto float-right">
          <li class="nav-item" v-for="menuitem in menuitems">
            <router-link class="nav-link" v-bind:to="menuitem.href">{{
              menuitem.title
            }}</router-link>
          </li>

          <!-- <li class="nav-item">
            <a  class="nav-link" to="/logout" @click="logout()">
              {{ this.user ? this.user.username : "Account" }}</a 
            >
          </li> -->
          <div v-if="!this.user">
           
            <li class="nav-item">
              <router-link class="nav-link" to="/Login"> Login</router-link>
            </li>
          </div>
        </ul>
      </div>
    </nav>
    <div></div>
    <br /><br />
    <div class="sidebar">
      <ul>
        <router-link
          class="nav-link"
          v-for="menuitem in menuitems"
          v-bind:to="menuitem.href"
          >{{ menuitem.title }}</router-link
        >
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      menuitems: [
        {
          href: "/",
          title: "Products",
        },
        {
          href: "/suppliers",
          title: "Suppliers",
        },

        {
          href: "/orders",
          title: "Orders",
        },
      ],
      user: null,
      loading: false,
      initiated: false,
    };
  },
  methods: {
    init() {
      this.loading = true;

      axios.get("/api/auth/init").then((resp) => {
        this.user = resp.data.user;
        this.loading = false;
        this.initiated = true;
        console.log(this.user);
      });
    },
    logout(){
          console.log('called');
          axios.get("/api/auth/logout").then((resp) => {
          
        this.loading = false;
        this.initiated = true;
      });
    }
  },
  mounted(){
    this.init();
  }
};
</script>
