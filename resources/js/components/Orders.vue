<template>
  <div id="supplier">
    <h5><i>Orders</i></h5>
    <div class="row">
      <div class="col-md-6">
        <form>
          <label>Product</label>
          <select class="form-control" v-model="addproductid">
            <option v-for="product in products" v-bind:value="product.id" v-bind:key="product.id">
              {{ product.name }}
            </option>
          </select>
        </form>
        <br>
        <button class="btn btn-success" @click="addOrder()">Add Order</button>
         <br>
      </div>
    </div>
    <br />
    <b-row class="mb-3">
      <b-col md="3">
        <b-form-input
          v-model="filter"
          type="search"
          id="filterInput"
          placeholder="Type to Search"
        ></b-form-input>
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <b-table
          id="addform"
          striped
          hover
          outlined
          :per-page="15"
          :items="orders"
          :fields="fields"
        >
          <template v-slot:cell(actions)="data">
            <b-button
              class="btn btn-danger"
              variant="danger"
              @click="deleteItem(data.item.id)"
              >Delete</b-button
            >
          </template>
        </b-table>
        <b-pagination aria-controls="my-table"></b-pagination>
      </b-col>
    </b-row>
  </div>
</template>

<style scoped>
#addform {
  padding-bottom: 3%;
}
#supplier {
  
  padding-top: 3%;
}
</style>
<script>
export default {
  created() {
    this.getAllOrders();
    this.popultateDropdown();
  },
  data() {
    return {
      newSupplierName: "",
      suppliers: [],
      addproductid:"",
      fields: ["id", "Product Name", "created_at", "actions"],
      filter: "",
      products: [],
       orders: []
    };
  },
  methods: {
    popultateDropdown() {
      axios.get("/api/products/all").then((resp) => {
        this.products = resp.data;
      });
     
    },
    getAllOrders() {
      axios.get("/api/orders_detail/all").then((resp) => {
        this.orders=resp.data;
        console.log(this.orders);
      });
    },
  
    addOrder() {
    
      axios
        .post("/api/orders_detail/create", {
          productid: this.addproductid,
        })
        .then((resp) => {
          this.productid = "";
          this.getAllOrders();
          this.$toastr("success", " Done!", "Order Added Successfully");
        });
    },
    deleteItem(id) {
    
      var url = "/api/orders_detail/delete/" + id;
 
      axios.get(url).then((resp) => {
        console.log(resp)
        this.$toastr("success", "", "Orders Deleted Successfully");
        this.getAllOrders();
      });
    },
  },
};
</script>