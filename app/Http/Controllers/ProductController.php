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

    public function show_all_books()
    {
        // $this->auth_login_admin();
        // SELECT * from books INNER JOIN nxb on books.nxbid = nxb.nxbid
        $list_books = DB::table('books')->join('nxb', 'books.nxbid', '=', 'nxb.nxbid')->get();
        $books = view('admin.AllBook')
            ->with('list_books', $list_books);
        // return view('AdminLayout')->with('admin.all_category', $manager_category);
        return $books;
    }

    public function show_add_books()
    {
        $list_nxb = DB::table('nxb')->get();
        $list_danhmuc = DB::table('categories')->limit(5)->get();
        $books = view('admin.AddBook')
            ->with('list_nxb', $list_nxb)
            ->with('list_danhmuc', $list_danhmuc);
        // return view('AdminLayout')->with('admin.all_category', $manager_category);
        return $books;
    }

    public function save_product(Request $request)
    {
        $this->AuthLogin();
        $data = array();
        $data['bookname'] = $request->bookname;
        $data['bookpages'] = $request->bookpages;
        $data['bookimageurl'] = "null";
        $data['bookdescription'] = "null";
        $data['bookweight'] = $request->bookweight;
        $data['bookweight'] = $request->bookweight;
        $data['releasedate'] = $request->releasedate;
        $data['price'] = $request->price;
        $data['nxbid'] = $request->nxb;
        $data['categoryid'] = $request->category;
        $data['type'] = 1;
        if ($request->category_name) {
            DB::table('books')->insert($data);
            Session::put('message', 'Thêm sản phẩm thành công');
            return Redirect::to('show_books');
        } else {
            return Redirect::to('show_add_books');
        }
    }

    public function delete_book($id)
    {
        $this->auth_login_admin();
        DB::table('books')->where('bookid', $id)->delete();
        Session::put('message', 'Xóa sách thành công');
        return Redirect::to('show_books');
    }

    public function update_book(Request $request)
    {
        $this->auth_login_admin();
        if ($request->bookid) {
            $book = array();
            $book['bookname'] = trim($request->bookname);
            // $category['parentId'] = trim($request->category_pid);
            DB::table('books')
                ->where('bookid', $request->bookid)
                ->update($book);
            Session::put('message', 'Update sách thành công');
            return Redirect::to('show_books');
        }
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
