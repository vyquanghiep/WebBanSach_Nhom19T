@extends('AdminLayout')
@section('admin_content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading"
                    style="font-size: 2rem;">
                    Thêm Sản phẩm
                </div>
                <div class="panel-body">
                    <div class="position-center">
                        <form
                            role="form"
                            method="post"
                            action="{{URL::to('/save_product')}}"
                        > {{ csrf_field() }}
                            <div class="form-group">
                                <label for="bookname">Tên sách</label>
                                <input type="text" class="form-control" name="bookname">
                            </div>

                            <div class="form-group">
                                <label for="">Số trang</label>
                                <input type="text" class="form-control" name="bookpages">
                            </div>

                            <div class="form-group">
                                <label for="">Cân nặng</label>
                                <input type="text" class="form-control" name="bookweight">
                            </div>

                            <div class="form-group">
                                <label for="">Số lượng</label>
                                <input type="text" class="form-control" name="quantity">
                            </div>

                            <div class="form-group">
                                <label for="">Ngày xuất bản</label>
                                <input type="date" class="form-control" name="releasedate">
                            </div>

                            <div class="form-group">
                                <label for="">Giá</label>
                                <input type="text" class="form-control" name="price">
                            </div>

                            <div class="form-group">
                                    <label for="exampleInputPassword1">Mô tả sản phẩm</label>
                                    <textarea style="resize: none" rows="8" class="form-control" name="bookdescription" id="exampleInputPassword1">
                                    </textarea>
                                </div>

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

                            <button type="submit" class="btn btn-info">Thêm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
@endsection
