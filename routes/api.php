<?php

use Illuminate\Http\Request;


Route::prefix('products')->group(function(){
   
    Route::post('/create',[
        'uses'=>'ProductController@create'
    ]);
    Route::get('/all',[
        'uses'=>'ProductController@index'
    ]);
    Route::get('/get/{id}',[
        'uses'=>'ProductController@show'
    ]);
    Route::post('/update/{id}',[
        'uses'=>'ProductController@update'
    ]);
    Route::get('/delete/{id}',[
        'uses'=>'ProductController@destroy'
    ]);
});


Route::prefix('orders')->group(function(){
   
    Route::post('/create',[
        'uses'=>'OrdersController@create'
    ]);
    Route::get('/all',[
        'uses'=>'OrdersController@index'
    ]);
    Route::get('/get/{id}',[
        'uses'=>'OrdersController@show'
    ]);
    Route::post('/update/{id}',[
        'uses'=>'OrdersController@update'
    ]);
    Route::get('/delete/{id}',[
        'uses'=>'OrdersController@destroy'
    ]);
});


Route::prefix('supplier')->group(function(){
   
    Route::post('/create',[
        'uses'=>'SupplierController@create'
    ]);
    Route::get('/all',[
        'uses'=>'SupplierController@index'
    ]);
    Route::get('/get/{id}',[
        'uses'=>'SupplierController@show'
    ]);
    Route::post('/update/{id}',[
        'uses'=>'SupplierController@update'
    ]);
    Route::get('/delete/{id}',[
        'uses'=>'SupplierController@destroy'
    ]);
});

Route::prefix('orders_detail')->group(function(){
   
    Route::get('/all',[
        'uses'=>'OrderDetailsController@index'
    ]);
    Route::get('/get/{id}',[
        'uses'=>'OrderDetailsController@show'
    ]);
    Route::post('/create',[
        'uses'=>'OrderDetailsController@store'
    ]);
});

Route::prefix('supplier_products')->group(function(){
   
    Route::get('/all',[
        'uses'=>'SupplierProductsController@index'
    ]);
    Route::get('/get/{id}',[
        'uses'=>'SupplierProductsController@show'
    ]);
    Route::post('/create',[
        'uses'=>'SupplierProductsController@store'
    ]);
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
