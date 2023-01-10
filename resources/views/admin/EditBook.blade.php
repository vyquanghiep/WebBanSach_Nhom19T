@extends('AdminLayout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                           Cập nhật sản phẩm
                        </header>
                         <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>


                        <div class="panel-body">

                            <div class="position-center">
                                @foreach($edit_book as $key => $book)
                                <form role="form" action="{{URL::to('/update_book/'.$book->bookid)}}" method="post" enctype="multipart/form-data">
                                    {{ csrf_field() }}
                                <div class="form-group">
                                    <label for="bookname">Tên sách</label>
                                    <input type="text" class="form-control" name="bookname" value="{{$book->bookname}}">
                                </div>

                                <div class="form-group">
                                    <label for="">Số trang</label>
                                    <input type="text" class="form-control" name="bookpages" value="{{$book->bookpages}}">
                                </div>

                                <div class="form-group">
                                    <label for="">Cân nặng</label>
                                    <input type="text" class="form-control" name="bookweight" value="{{$book->bookweight}}">
                                </div>

                                <div class="form-group">
                                    <label for="">Số lượng</label>
                                    <input type="text" class="form-control" name="quantity" value="{{$book->quantity}}">
                                </div>

                                <div class="form-group">
                                    <label for="">Ngày xuất bản</label>
                                    <input type="date" class="form-control" name="releasedate" value="{{$book->releasedate}}">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Giá sản phẩm</label>
                                    <input type="text" value="{{$book->price}}" name="price" class="form-control" id="exampleInputEmail1" >
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mô tả sản phẩm</label>
                                    <textarea style="resize: none" rows="8" class="form-control" name="bookdescription" id="exampleInputPassword1">{{$book->bookdescription}}</textarea>
                                </div>

                                 {{-- <div class="form-group">
                                    <label for="exampleInputPassword1">Danh mục sản phẩm</label>
                                      <select name="product_cate" class="form-control input-sm m-bot15">
                                        @foreach($cate_product as $key => $cate)
                                            @if($cate->category_id==$pro->category_id)
                                            <option selected value="{{$cate->category_id}}">{{$cate->category_name}}</option>
                                            @else
                                            <option value="{{$cate->category_id}}">{{$cate->category_name}}</option>
                                            @endif
                                        @endforeach

                                    </select>
                                </div> --}}

                                 <div class="form-group">
                                <label for="">Nhà xuất bảng</label>
                                <select name="nxb">
                                    @foreach($list_nxb as $key => $nxb)
                                        <option value="{{$nxb->nxbid}}">{{$nxb->nxb}}</option>
                                    @endforeach
                                </select>
                                </div>

                                <div class="form-group">
                                <label for="">Danh mục</label>
                                <select name="category">
                                    @foreach($list_danhmuc as $key => $danhmuc)
                                        <option value="{{$danhmuc->categoryid}}">{{$danhmuc->categoryname}}</option>
                                    @endforeach
                                </select>
                                </div>



                                <button type="submit" name="add_product" class="btn btn-info">Cập nhật sản phẩm</button>
                                </form>
                                @endforeach
                            </div>

                        </div>
                    </section>

            </div>
@endsection
