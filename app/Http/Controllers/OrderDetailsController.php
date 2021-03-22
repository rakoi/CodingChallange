<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order_detail;
use App\Order;
use Carbon\Carbon;
class OrderDetailsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Order_detail::whereNull('deleted_at')->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
        $order=new Order();
        $orderDetail =new Order_detail();
        $order_id=Order::max('id')+1;

        $orderDetail->order_id=$order_id;
        $orderDetail->product_id=$request->productid;
        $orderDetail=$orderDetail->save();
        $saveOrder=new Order();
        $saveOrder->order_number=Order_detail::max('id')+1;
        $saveOrder->save();
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
        return Order_detail::where('id',$id)->get();
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
         Order_detail::where('id',$id)->update(['deleted_at'=>Carbon::now()]);
         Order::where('order_number',$id)->update([
             'deleted_at'=>Carbon::now()]);
    }
}
