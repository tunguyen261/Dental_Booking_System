
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="discounts.DiscountDTO"%>
<%@page import="feedbacks.FeedbackDTO"%>
<%@page import="serviceImage.ServiceImageDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="patients.PatientDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>DentaCare </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/product.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link rel="stylesheet" href="css/menu.css">
    </head>
    <body>

        <%
            String loginPatient = "";
            ArrayList login = (ArrayList) session.getAttribute("LOGIN_USER");
            if (login != null) {
                loginPatient = ((PatientDTO) session.getAttribute("LOGIN_PATIENT")).getFullName();
            } else {
                String loginDefault = (String) session.getAttribute("LOGIN_DEFAULT");
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="HomeController">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="HomeController" class="nav-link sa">Trang chủ</a></li>
                        <li class="nav-item "><a href="ShowTeamController" class="nav-link sa">Nhóm phát triển</a></li>
                        <li class="nav-item dropdown"><a href="MainController?action=Load" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Dịch vụ</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%
                                    List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                    if (listServiceType != null) {
                                        for (ServiceTypeDTO svType : listServiceType) {
                                %>	
                                <a class="dropdown-item nav-link text-primary" href="ServiceTypeHomeController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </li>
                        <li class="nav-item"><a href="LoadDoctorController" class="nav-link sa">Bác sĩ</a></li>

                        <%if (!loginPatient.equals("")) {%>
                        <li class="nav-item"><a href="ShowBookingPatientController" class="nav-link sa">Lịch sử lịch đặt</a></li>
                        <li class="nav-item dropdown"><a href="LogoutController" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=loginPatient%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="ShowProfileAccountController" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                        <%} else {%>
                        <li class="nav-item"><a href="LoginController" class="nav-link sa" ><span>Đăng nhập</span></a></li>
                            <%}%>
                        <li class="nav-item cta"><a href="ShowBookingController" class="nav-link" ><span>Đặt lịch khám</span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container" data-scrollax-parent="true">
                    <div class="row slider-text align-items-end">
                        <div class="col-md-7 col-sm-12 ftco-animate mb-5">
                            <p class="breadcrumbs" data-scrollax=" properties: { translateY: '70%', opacity: 1.6}"><span class="mr-2"><a href="HomeController">Trang chủ</a></span> <span class="mr-2"><a href="LoadController">Dịch vụ</a></span> <span class="mr-2"><a href="LoadServiceDetailController">Chi tiết dịch vụ</a></span>
                            <h1 class="mb-3" data-scrollax=" properties: { translateY: '70%', opacity: .9}">Đội ngũ bác sĩ giàu kinh nghiệm</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">

            <div class="container">
                <div class="heading-section">
                    <h2>Chi Tiết Dịch Vụ</h2>
                </div>
                <div class="row">
                    <%
                        ServiceDTO service = (ServiceDTO) request.getAttribute("SERVICE_DETAIL_BY_ID");
                    %>
                    <div class="col-md-6">
                        <div id="slider" class="owl-carousel product-slider">
                            <%
                                List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) request.getAttribute("SERVICE_IMAGE_BY_ID");
                                if (!listServiceImage.equals("")) {
                                    for (ServiceImageDTO Image : listServiceImage) {
                            %>
                            <div class="item">
                                <img style="height: 300px; width: 540px" src="<%=Image.getImage()%>" />
                            </div>
                            <%
                                }
                            } else {%>
                            <div class="item">
                                <h2>Không có ảnh nào cả</h2>
                            </div>
                            <%}%>
                        </div>
                        <div id="thumb" class="owl-carousel product-thumb">
                            <%
                                for (ServiceImageDTO Image : listServiceImage) {
                            %>
                            <div class="item">
                                <img  src="<%=Image.getImage()%>" />
                            </div>
                            <%}%>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="product-dtl ml-5">
                            <div class="product-info">
                                <h1 class="animate-charcter" style="font-size: 30px"><%=service.getServiceName()%></h1>
                                <!--lay ratestar cua feedback-->
                                <div class="reviews-counter">
                                    <div class="rate">
                                        <div class="rate">
                                            <%  int average = 0;
                                                int count = 0;
                                                List<FeedbackDTO> ListfeedbackService = (List<FeedbackDTO>) request.getAttribute("SERVICE_FEEDBACK_BY_ID");
                                                String check1;
                                                if (ListfeedbackService.get(0).getServiceID() == service.getServiceID()) {
                                                    for (FeedbackDTO feedback : ListfeedbackService) {
                                                        average += feedback.getRateStar();
                                                        count++;
                                                    }
                                                    average = average / count;
                                                }
                                                if (average > 0) {
                                            %>
                                            <input type="radio" id="star5" name="rate" value="5" <%if (average == 5) {%>checked=""<%}%>/>
                                            <label for="star5" title="text">5 stars</label>
                                            <input type="radio" id="star4" name="rate" value="4" <%if (average == 4) {%>checked=""<%}%>/>
                                            <label for="star4" title="text">4 stars</label>
                                            <input type="radio" id="star3" name="rate" value="3" <%if (average == 3) {%>checked=""<%}%>/>
                                            <label for="star3" title="text">3 stars</label>
                                            <input type="radio" id="star2" name="rate" value="2" <%if (average == 2) {%>checked=""<%}%>/>
                                            <label for="star2" title="text">2 stars</label>
                                            <input type="radio" id="    star1" name="rate" value="1" <%if (average == 1) {%>checked=""<%}%>/>
                                            <label for="star1" title="text">1 star</label>
                                            <%} else {%>
                                            <label>0 đánh giá</label>
                                            <%}%>
                                        </div>
                                    </div>

                                </div>
                                <%if (ListfeedbackService.get(0).getServiceID() == service.getServiceID()) {%>
                                <span><%=ListfeedbackService.size()%> reviewer</span>
                                <%} else { %>
                                <span>0 reviewer</span>
                                <%}%>
                                <%
                                    int discountOfService = (int) request.getAttribute("DISCOUNT_OF_SERVICE");
                                    DiscountDTO discount = (DiscountDTO) request.getAttribute("DISCOUNT_BY_ID");
                                    if (discount.getServiceID() != service.getServiceID()) {%>
                                <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                <div class="product-price-discount"><span class="line-through"><%=formatter.format(service.getServicePrice())%> VND</span></div>
                                <div class="product-price-discount"><span>Giá Dịch Vụ:  <%=formatter.format(service.getServicePrice())%>VND</span></div>
                                <p style="font-size:20px;font-weight: bolder">Nhanh tay đặt </p>
                                <div class="row col-12 pl-0">
                                </div>
                                <%} else if (discount.getServiceID() == service.getServiceID()) {
                                %>              
                                <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                <div class="product-price-discount"><span class="line-through"><%=formatter.format(service.getServicePrice())%> VND</span></div>
                                <div class="product-price-discount"><span>Giá Dịch Vụ:  <%=formatter.format(discountOfService)%>VND</span></div>
                                <p style="font-size:20px;font-weight: bolder"><%=discount.getDescription()%></p>
                                <div class="row col-12 pl-0">
                                    <div class="col-md-6">
                                        <p style="font-size:18px;font-weight: 200">Từ Ngày: <%=discount.getCreateDate()%></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p style="font-size:18px;font-weight: 200">Đến Ngày: <%=discount.getExpiredDate()%></p>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-info-tabs">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">MÔ TẢ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">ĐÁNH GIÁ (<%=count%>)</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                            <%=service.getDescription()%>
                        </div>
                        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                            <div class="review-heading">ĐÁNH GIÁ DỊCH VỤ</div>
                            <%
                                for (FeedbackDTO feedbackService : ListfeedbackService) {
                                    if (feedbackService.getServiceID() != service.getServiceID()) {
                            %>
                            <div><h3>Không có bình luận nào cả</h3></div>
                        </div>
                        <%} else if (feedbackService.getStatus() == 1) {%>
                        <div class="row" style="overflow-y: scroll; max-height:150px; padding-top: 10px">
                            <div class="form-group col-md-4 border-primary">
                                <div >
                                    <label for="user-name-feedback" style="color: #40407a;align-content: center;text-align: center"><strong><%=feedbackService.getPatientName()%></strong>
                                        <h6 style="color: gray;align-content: center;text-align: center">(<%=feedbackService.getDateFeedback()%>)</h6></label>

                                </div>
                            </div>
                            <div class="form-group col-md-8 border-primary">
                                <label for="user-feedback"><%=feedbackService.getContent()%></label>
                            </div>
                        </div>
                        <%}
                            }%>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="ftco-footer ftco-bg-dark ftco-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-3">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">DentaCare</h2>
                        <p>Nha Khoa DentalCare cung cấp đầy đủ các loại hình điều trị như: Tổng quát, Phục hình răng sứ, Cấy ghép implant, Chỉnh nha - niềng răng, Thẩm mỹ nướu.</p>
                    </div>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft ">
                        <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                    </ul>
                </div>
                <div class="col-md-2">
                    <div class="ftco-footer-widget mb-4 ml-md-5">
                        <h2 class="ftco-heading-2">Quick Links</h2>
                        <ul class="list-unstyled">
                            <li><a href="#" class="py-2 d-block">Thông tin</a></li>
                            <li><a href="#" class="py-2 d-block">Tính năng</a></li>
                            <li><a href="#" class="py-2 d-block">Dự án</a></li>
                            <li><a href="#" class="py-2 d-block">Blog</a></li>
                            <li><a href="#" class="py-2 d-block">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 pr-md-4">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Blog gần đây</h2>
                        <div class="block-21 mb-4 d-flex">
                            <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                            <div class="text">
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                <div class="meta">
                                    <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-21 mb-4 d-flex">
                            <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                            <div class="text">
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                <div class="meta">
                                    <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Office</h2>
                        <div class="block-23 mb-3">
                            <ul>
                                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">

                    <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved </a></p>
                </div>
            </div>
        </div>
    </footer>



    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
                        $(document).ready(function () {
                            var slider = $("#slider");
                            var thumb = $("#thumb");
                            var slidesPerPage = 3; //globaly define number of elements per page
                            var syncedSecondary = true;
                            slider.owlCarousel({
                                items: 1,
                                slideSpeed: 2000,
                                nav: false,
                                autoplay: false,
                                dots: false,
                                loop: true,
                                responsiveRefreshRate: 200
                            }).on('changed.owl.carousel', syncPosition);
                            thumb
                                    .on('initialized.owl.carousel', function () {
                                        thumb.find(".owl-item").eq(0).addClass("current");
                                    })
                                    .owlCarousel({
                                        items: slidesPerPage,
                                        dots: false,
                                        nav: true,
                                        item: 3,
                                        smartSpeed: 200,
                                        slideSpeed: 500,
                                        slideBy: slidesPerPage,
                                        navText: ['<svg width="18px" height="18px" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>', '<svg width="25px" height="25px" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'],
                                        responsiveRefreshRate: 100
                                    }).on('changed.owl.carousel', syncPosition2);
                            function syncPosition(el) {
                                var count = el.item.count - 1;
                                var current = Math.round(el.item.index - (el.item.count / 2) - .5);
                                if (current < 0) {
                                    current = count;
                                }
                                if (current > count) {
                                    current = 0;
                                }
                                thumb
                                        .find(".owl-item")
                                        .removeClass("current")
                                        .eq(current)
                                        .addClass("current");
                                var onscreen = thumb.find('.owl-item.active').length - 1;
                                var start = thumb.find('.owl-item.active').first().index();
                                var end = thumb.find('.owl-item.active').last().index();
                                if (current > end) {
                                    thumb.data('owl.carousel').to(current, 100, true);
                                }
                                if (current < start) {
                                    thumb.data('owl.carousel').to(current - onscreen, 100, true);
                                }
                            }
                            function syncPosition2(el) {
                                if (syncedSecondary) {
                                    var number = el.item.index;
                                    slider.data('owl.carousel').to(number, 100, true);
                                }
                            }
                            thumb.on("click", ".owl-item", function (e) {
                                e.preventDefault();
                                var number = $(this).index();
                                slider.data('owl.carousel').to(number, 300, true);
                            });


                            $(".qtyminus").on("click", function () {
                                var now = $(".qty").val();
                                if ($.isNumeric(now)) {
                                    if (parseInt(now) - 1 > 0)
                                    {
                                        now--;
                                    }
                                    $(".qty").val(now);
                                }
                            })
                            $(".qtyplus").on("click", function () {
                                var now = $(".qty").val();
                                if ($.isNumeric(now)) {
                                    $(".qty").val(parseInt(now) + 1);
                                }
                            });
                        });
    </script>
</body>
</html>
