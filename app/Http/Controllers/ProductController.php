<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;

class ProductController extends Controller
{
    //ADMIN
    public function AuthLogin()
    {
        $admin_id = Session::get('admin_id');
        if ($admin_id) {
            return Redirect::to('dashboard');
        } else {
            return Redirect::to('admin')->send();
        }
    }

    public function save_product(Request $request)
    {
        $this->AuthLogin();

        $data = array();
        $data['bookname'] = $request->bookname;
        $data['bookpages'] = $request->bookpages;
        $data['bookweight'] = $request->bookweight;
        $data['bookweight'] = $request->bookweight;
        $data['releasedate'] = $request->releasedate;
        $data['price'] = $request->price;
        $data['nxbid'] = $request->nxb;
        $data['categoryid'] = $request->category;
        $data['type'] = 1;
        DB::table('books')->insert($data);
        Session::put('message', 'Thêm sản phẩm thành công');
        return Redirect::to('show_books');
    }




    // User
    public function details_product($bookid)
    {
        $cate_product = DB::table('categories')->where('categories.parent', 1)->get();
        $sub_cate = DB::table('categories')->where('categories.parent', '!=', 1)->get();
        $detai_product = DB::table('books')
            ->join('nxb', 'nxb.nxbid', '=', 'books.nxbid')
            ->where('bookid', '=', $bookid)->get();
        $product_summary = DB::table('noidungsach')->where('idsach', $bookid)->get();
        return view('pages.product.show_details')->with('category', $cate_product)
            ->with('product_details', $detai_product)
            ->with('sub_cate', $sub_cate)
            ->with('product_summary', $product_summary);
    }
}
