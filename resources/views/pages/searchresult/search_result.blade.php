@extends('welcome')
@section('content')
<style>
    nav {
        height: 80px;
        position: relative;
    }

    .pagination {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>
<link rel="stylesheet" href="{{asset('public/frontend/css/product-item.css')}}">
<!-- thanh "danh muc sach" đã được ẩn bên trong + hotline + ho tro truc tuyen -->
<section class="duoinavbar">
        <div class="container text-white">
            <div class="row justify">
                <div class="col-lg-3 col-md-5">
                    <div class="categoryheader">
                        <div class="noidungheader text-white">
                            <i class="fa fa-bars"></i>
                            <span class="text-uppercase font-weight-bold ml-1">Danh mục sách</span>
                        </div>
                        <!-- CATEGORIES -->
                        <div class="categorycontent">
                        <ul >
                            @foreach($category as $key => $cate)
                            <li> <a href="{{URL::to('/danh-muc-san-pham/'.$cate->categoryid)}}">{{$cate->categoryname}}</a><i class="fa fa-chevron-right float-right"></i>
                              <ul>
                                    <li class="liheader"><a href="#" class="header text-uppercase">{{$cate->categoryname}}</a></li>
                                @foreach($sub_cate as $key => $sub)    
                                    @if($sub->parent == $cate->categoryid)                
                                        <li style="margin-left:50px"><a href="{{URL::to('/danh-muc-san-pham/'.$sub->categoryid)}}">{{$sub->categoryname}}</a></li>
                                    @endif
                                @endforeach    
                                </ul>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                    </div>
                </div>
                <div class="col-md-5 ml-auto contact d-none d-md-block">
                    <div class="benphai float-right">
                        <div class="hotline">
                            <i class="fa fa-phone"></i>
                            <span>Hotline:<b>1900 1999</b> </span>
                        </div>
                        <i class="fas fa-comments-dollar"></i>
                        <a href="#">Hỗ trợ trực tuyến </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <!-- khoi sach moi  -->
   <section class="_1khoi sachmoi bg-white">
        <div class="container">
            <div class="noidung" style=" width: 100%;">
            @if(sizeof($search_results) != 0)
                <div class="row">
                    <!--header-->
                    <div class="col-12 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
                        <h1 class="header" style="font-weight: 400;">
                          Sách liên quan đến "{{$search_key}}"
                        </h1>
                    
                    </div>
                </div>
                <div class="items">
                    <div class="row">
                        @foreach($search_results as $key => $product)
                            <div class="col-lg-3 col-md-4 col-xs-6 item DeanGraziosi">
                                
                                <div class="card ">
                                    <a href="{{URL::to('/chi-tiet-san-pham/'.$product->bookid)}}" class="motsanpham"
                                        style="text-decoration: none; color: black;" data-toggle="tooltip"
                                        data-placement="bottom" title="Lập Kế Hoạch Kinh Doanh Hiệu Quả">
                                        <img class="card-img-top anh" src="{{URL::to('./public/frontend/images/'.$product->bookimageurl)}}"
                                            alt="lap-ke-hoach-kinh-doanh-hieu-qua">
                                        <div class="card-body noidungsp mt-3">
                                            <h6 class="card-title ten">{{$product->bookname}}</h6>
                                            <small class="tacgia text-muted">Brian Finch</small>
                                            <div class="gia d-flex align-items-baseline">
                                                <div class="giamoi">111.200 ₫</div>
                                                <div class="giacu text-muted">139.000 ₫</div>
                                                <div class="sale">-20%</div>
                                            </div>
                                            <div class="danhgia">
                                                <ul class="d-flex" style="list-style: none;">
                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <span class="text-muted">0 nhận xét</span>
                                                </ul>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            
                            </div>
                        @endforeach      
                    </div>
                </div>
                <div class="col-md-12" style="text-align: center; margin-top:30px;">
                    {!!$search_results->links('pagination::bootstrap-4')!!}
                </div>
            @else
                <div class="row">
                    <!--header-->
                    <div class="col-12 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
                        <h1 class="header" style="font-weight: 400;">
                           Không tìm thấy kết quả từ khóa "{{$search_key}}
                        </h1>
                    </div>
                </div>

                <div class="row">
                    <!--header-->
                    <div class="col-3 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
                    </div>
                    <div class="col-6 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
                        <img style="width: 100%;" src="{{asset('public/frontend/images/404image.jpg')}}" alt="">
                    </div>
                    <div class="col-3 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
                    </div>
                </div>
            @endif
            </div>
        </div>
    </section>

@endsection