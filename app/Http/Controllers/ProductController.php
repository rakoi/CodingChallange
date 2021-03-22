<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use Carbon\Carbon;
class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       
        return Product::whereNull('deleted_at')->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        //
          $product=new Product;
        $product->name=$request->name;
        $product->description=$request->description;
        $product->quantity=$request->quantity;
        $product->save();

        return $product;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
         //
         $product=new Product;
         $product->name=$request->name;
         $product->description=$request->description;
         $product->quantity=$request->quantity;
        
          $product->save();

          return $product;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
      return  Product::where('id',$id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        Product::where('id',$id)->get();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $product =Product::where('id',$id)->first();
        $product->name=$request->name;
        $product->description=$request->description;
        $product->quantity=$request->quantity;
        $product->save();
        return $product;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $product =Product::where('id',$id)->first();
        $product->deleted_at=Carbon::now();
        $product->save();
        return $product;
    }
    public function search(Request $request){
      
        $wildcard="%$request->name%";
        return Product::where('name','like',$wildcard)->get();
    }
}
