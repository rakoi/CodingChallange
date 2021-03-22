<template>

  <div id="supplier">
    <!-- Start of Edit Modal -->
  <div id="mydeletemodal">
      <div class="modal" tabindex="-1" role="dialog" id="editModal">
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
                <label>Name</label>
                 <input class="form-control" type="text" v-model="edit_name" id="name">
                  <input class="form-control" type="hidden" v-model="edit_id" id="supplier_id">
                 
              </div>
            <div class="modal-footer">
              <button
                type="button"
                data-dismiss="modal"
                @click="editSupplierFunction()"
                class="btn btn-primary"
              >
                Update
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
<!-- End of Edit Modal -->
        <h5><i>Suppliers</i></h5>
    <div class="row">
      <div class="col-md-6">
        <form >
           <input v-model="newSupplierName" class="form-control" id="supplier_name" placeholder="Eg John Doe"></br>
        </form>
        <button @click="addSupplier()" class="btn btn-success"><span class="fa fa-plus" >Add</span></button>
      </div>
    
    </div>
    <br>
     <b-row class="mb-3">
      <b-col md="3">
        <b-form-input v-model="filter" type="search" id="filterInput" placeholder="Type to Search"></b-form-input>
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
          :items="suppliers"
             :fields="fields"
        >
           <template v-slot:cell(edit)="data">
            <b-button 
            class="btn btn-info"
             data-toggle="modal"
              data-target="#editModal"
             @click="editItem(data.item)">Edit</b-button>
          </template>
           <template v-slot:cell(actions)="data">
            <b-button 
            class="btn btn-danger"
            variant="danger" @click="deleteItem(data.item.id)">Delete</b-button>
          </template>
        </b-table>
         <b-pagination
        
          aria-controls="my-table"
        ></b-pagination>
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
    this.getAllSuppliers();
  },
  data() {
    return {
      newSupplierName: "",
      suppliers: [],
      edit_id: "",
      edit_name: "",
      fields: ["id", "name", "created_at", "edit", "actions"],
      filter: "",
    };
  },
  methods: {
    getAllSuppliers() {
      axios.get("/api/supplier/all").then((resp) => {
        var suppliers = resp.data.data;
        this.suppliers = suppliers;
        console.log(suppliers);
      });
    },
    editItem(item) {
   
      this.edit_id = item.id;
      this.edit_name = item.name;
    },
    addSupplier() {
      axios
        .post("/api/supplier/create", {
          name: this.newSupplierName,
        })
        .then((resp) => {
          this.newSupplierName = "";
        
          this.$toastr("success", " Done!", "Supplier Added Successfully");
            this.getAllSuppliers();
        });
    },
    deleteItem(id) {
      var url = "/api/supplier/delete/" + id;

      axios.get(url).then((resp) => {
        this.$toastr("success", "", "Supplier Deleted Successfully");
        this.getAllSuppliers();
      });
    },
    editSupplierFunction() {
      var name = this.edit_name;
      var id = this.edit_id;
      var url = "/api/supplier/update/" + id;
      axios.post(url, {
        id: id,
        name: name,
      }).then((data)=>{
           this.$toastr("success", "", "Supplier Updated Successfully");
           this.getAllSuppliers();
        console.log(data);
      });
    },
  },
};
</script>
