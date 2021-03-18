<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SupplierProducts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('supplier_products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('supply_id')->unsigned();;
            $table->unsignedBigInteger('product_id')->unsigned();;
            $table->timestamps();
            $table->timestamp('deleted_at')->nullable();;
            
          
        });
        Schema::table('supplier_products', function (Blueprint $table) {
            $table->foreign('supply_id')->references('id')->on('suppliers');
            $table->foreign('product_id')->references('id')->on('products');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('supplier_products');
    }
}
