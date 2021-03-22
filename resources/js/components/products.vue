<template>

  <div id="products">
    
    <div id="mydeletemodal">
      <div class="modal" tabindex="-1" role="dialog" id="deleteModal">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Confirm</h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <input type="hidden" id="delete_id" v-model="deleteproduct" />

              <p>Are you sure you want to delete?</p>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                data-dismiss="modal"
                @click="deleteProductFunction()"
                class="btn btn-primary"
              >
                Delete
              </button>
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Add Modal  -->
      <div id="addmodaldiv">
      <div class="modal" tabindex="-1" role="dialog" id="addModal">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Add Product</h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <label>Name</label>
                 <input class="form-control" type="text" id="name" v-model="product.name"></input>
                   <label>Description</label>
                    <textarea class="form-control"  type="text" id="description" v-model="product.description"></textarea>
                      <label>Quantity</label>
                       <input class="form-control" type="number" id="quantity" v-model="product.quantity"></input>
              </form>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                data-dismiss="modal"
                @click="addProductFunction()"
                class="btn btn-primary"
              >
                Add
              </button>
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- END OF Add Modal -->
     <div id="showDetailsModal">
      <div class="modal" tabindex="-1" role="dialog" id="showDetails">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title"> Product</h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <label>Name</label>
                 <input class="form-control"  readonly type="text" id="name" v-model="showProduct.name"> </input>
                   <label>Description</label>
                    <textarea class="form-control"  type="text" readonly id="description" v-model="showProduct.description"></textarea>
                      <label>Quantity</label>
                       <input class="form-control" type="number" readonly id="quantity" v-model="showProduct.quantity"></input>
              </form>
            </div>
            <div class="modal-footer">
              
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>


    <br />
    <h5><i>Products</i></h5>
    <div class="row">
      <div class="col col-md-6">
        <form class="form" method="" action="">
          <label>Search For Product</label>
          <input
            type="text"
            class="form-control"
            name="search_field"
            id="search_field"
            v-model="searchProductName"
          />
          <br />
        </form>
        <button class="btn btn-success"
        @click="searchProduct()"
        >
          <span class="fas fa-search"></span> Search
        </button>

        <button
          class="btn btn-warning pull-right"
          data-toggle="modal"
          data-target="#addModal"
        >
          <span class="fas fa-plus"></span> Add Item
        </button>
      </div>
    </div>

    <div class="row">
      <div
        class="col col-md-3 carddiv"
        v-for="product in products"
        v-bind:key="product.id"
      >
        <div class="card h-100" style="width: 18rem">
          <div class="card-body">
            <h5 class="card-title">{{ product.name }}</h5>
            <hr />
            <p class="card-text">{{ product.description.substring(0, 50) }}</p>
            
            <button
              @click="showProductMethod(product)"
              class="btn btn-info"
             d
            >
              <span class="fas fa-trash"></span> Details
            </button>
            <button
              @click="deleteProduct(product.id)"
              class="btn btn-danger"
              data-toggle="modal"
              data-target="#deleteModal"
            >
              <span class="fas fa-trash"></span> Delete
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6"></div>
      <div class="col-md-6">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="#">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item disabled">
              <a class="page-link" href="#">2</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</template>
<style scoped>

.carddiv {
  padding-top: 70px;
}
</style>
<script>
export default {
  created: function () {},
  data() {
    return {
      products: [],
      deleteproduct: "",
      product: {
        id: "",
        name: "",
        description: "",
        quantity: "",
      },
      showProduct: {
        id: "",
        name: "",
        description: "",
        quantity: "",
      },
      searchProductName: "",
    };
  },
  created() {
    this.fetchProducts();
  
  },
  methods: {
    fetchProducts() {
      axios.get("/api/products/all").then((resp) => {
        this.products = resp.data;
      });
    },
    deleteProduct(id) {
      this.deleteproduct = id;
    },
    showProductMethod(product) {
      this.showProduct = product;
    },
    deleteProductFunction() {
      var id = this.deleteproduct;
      var url = "/api/products/delete/" + id;

      axios.get(url).then((resp) => {
        this.$toastr("success", "", "Product Deleted Successfully");
        this.fetchProducts();
      });
    },
    searchProduct() {
      var url = "/api/products/searchProduct/" + this.searchProductName;
      if (this.searchProductName != "") {
        axios.get(url).then((resp) => {
          this.products = resp.data;
        });
      }else{
        this.fetchProducts();
      }
    },
    addProductFunction() {
      var request = this.product;

      axios
        .post("/api/products/create", {
          name: this.product.name,
          description: this.product.description,
          quantity: this.product.quantity,
        })
        .then((resp) => {
          console.log(resp);
           this.$toastr("success", " Done!", "Product Added Successfully");
          this.fetchProducts();
          this.product.name = "";
          this.product.description = "";
          this.product.quantity = "";
         
        });
    },
  },
};
</script>