<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Order_detail;
use App\supplier_products;

class Product extends Model
{
 
    public function order_detail()
    {
        return $this->belongsToMany('App\Order_detail');
    }

    public function supplier_products()
    {
        return $this->belongsToMany('App\supplier_products');
    }
}
