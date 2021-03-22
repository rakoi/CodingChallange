<template>
  <div id="register">
    <div class="row">
      <div class="col col-md-2"></div>
      <div class="col col-md-8">
        <div class="card">
          <div class="card-header">Login</div>
          <div class="card-body">
            <div class="">
              <form v-on:submit.prevent="onsubmit">
                <div class="form-group">
                  <label>Email</label><br />
                  <input
                    type="text"
                    class="form-control"
                    placeholder="name"
                    v-model="name"
                  />
                </div>
                <div class="form-group">
                  <label>Password</label><br />
                  <input type="password" class="form-control" v-model="password" />
                </div>
            
                <div class="alert alert-error">
                    <ul>
                        <li v-for="(error,index) in errors" :key="index">
                                {{error}}
                         </li>
                    </ul>
                </div>
                <button type="submit" class="btn btn-success">Login</button>
                 <a href="/register"  class="btn btn-info float-right">Register</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      name: "",
      password: "",
      errors: [],
    };
  },
  methods: {
    onsubmit() {
      this.errors = [];
      if (!this.name) {
        this.errors.push("Name is required");
      }
      if (!this.password) {
        this.errors.push("Password is required");
      }
     

      if (!this.errors.length) {
        const data = {};

        axios
          .post("/api/auth/login", {
            username: this.name,
            password: this.password,
          })
          .then((resp) => {
            console.log(resp);
              this.$router.push('/');
          })
          .catch((error) => {
            this.errors.push(error.response.data.error);
          });
      }
    },
  },
};
</script>


<style scoped>
#register {
  padding-top: 60px;
}
</style>