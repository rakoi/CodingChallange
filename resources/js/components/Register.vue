<template>
  <div id="register">
    <div class="row">
      <div class="col col-md-2"></div>
      <div class="col col-md-8">
        <div class="card">
          <div class="card-header">Register</div>
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
                <div class="form-group">
                  <label>Confirm Password</label><br />
                  <input type="password" class="form-control" v-model="cpassword" />
                </div>
                <div class="alert alert-error">
                    <ul>
                        <li v-for="(error,index) in errors" :key="index">
                                {{error}}
                         </li>
                    </ul>
                </div>
                <button type="submit" class="btn btn-success">Register</button>
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
      cpassword: "",
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
      if (!this.cpassword) {
        this.errors.push("Confirm Password");
      }
      if (this.password != this.cpassword) {
        this.errors.push("Passwords do not match");
      }

      if (!this.errors.length) {
        const data = {};

        axios
          .post("/api/auth/register", {
            username: this.name,
            password: this.password,
          })
          .then((resp) => {
            console.log(resp);
            //  this.$router.push('/');
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