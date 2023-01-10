<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class AdminController extends Controller
{
    public function index() {
        return view('AdminLogin');
    }

    public function AuthLogin(){
        $admin_id = Session::get('user')->isadmin;
        if($admin_id == 1){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }

    public function showDashBoard() {
        $this->AuthLogin();
        return view('admin.dashboard');
    }

    public function dashboard(Request $request) {

        $admin_email =trim($request->email);
        $admin_password = trim($request->password);
        $result = DB::table('users')
            ->where('email',$admin_email)
            ->where ('password',$admin_password)
            ->where('isadmin', 1)
            ->first();
        if($result){
            Session::put('id',$result->userid);
            Session::put('admin_name', $result->fullname);
            return view('admin.dashboard');
        }else{
            Session::put('message','mat khau hoac email khong dung, nhap lai nhe');
            return Redirect::to('/admin');
        }
    }

    public function logout() {
        Session::remove('id');
        return  Redirect::to('/admin');
    }

}
