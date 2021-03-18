<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class OrderDetails extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('order_details', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedBigInteger('order_id')->unsigned();;
            $table->unsignedBigInteger('product_id')->unsigned();;
            $table->timestamps();
            $table->timestamp('deleted_at')->nullable();;
            
   //         $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');

        });
        // Schema::table('order_details', function (Blueprint $table) {
           
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('order_details');
    }
}
