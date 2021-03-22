<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class supplier_product extends Model
{
    //
    public function supplier()
    {
        return $this->belongsTo('App\Supplier');
    }

    public function product()
    {
        return $this->belongsTo('App\Product');
    }
}
