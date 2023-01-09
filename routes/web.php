<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// BEGIN ADMIN
// admin dashboard
Route::get('/admin', 'AdminController@index');
Route::get('/show_dashboard', 'AdminController@showDashBoard');
Route::post('/admin_dashboard', 'AdminController@dashboard');
Route::get('/logout', 'AdminController@logout');

// admin category
Route::get('/add_category', 'CategoryProduct@show_form_add_category');
Route::get('/all_category', 'CategoryProduct@show_all_category');
Route::post('/save_category', 'CategoryProduct@add_category');
Route::get('/delete_category/{categoryid}', 'CategoryProduct@delete_category');
Route::get('/update_category/{categoryid}', 'CategoryProduct@show_form_edit_category');
Route::post('/save_editcategory', 'CategoryProduct@update_category');
