
<%@page import="java.text.DecimalFormat"%>
<%@page import="discounts.DiscountDTO"%>
<%@page import="feedbacks.FeedbackDTO"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="serviceImage.ServiceImageDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="admins.AdminDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="patients.PatientDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>DentaCare</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link rel="stylesheet" href="css/menu.css">
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="HomeController">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="HomeController" class="nav-link sa">Trang chủ</a></li>
                        <li class="nav-item "><a href="team.jsp" class="nav-link sa">Nhóm phát triển</a></li>
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
                        <li class="nav-item"><a href="ShowBookingPatientController" class="nav-link sa">Lịch sử lịch đặt</a></li>
                        <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a>
                           
                        </li>
                        <li class="nav-item cta"><a href="login.jsp" class="nav-link" ><span>Đặt lịch khám</span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel">
            <div class="slider-item" style="background-image: url('images/bg_1.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center" data-scrollax-parent="true">
                        <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hệ thống nha khoa hiện đại trong một môi trường thoải mái và an toàn</h1>
                            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Trang thiết bị hiện đại và đội ngũ nhân viên chuyên nghiệp</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url('images/bg_2.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center" data-scrollax-parent="true">
                        <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Đảm bảo nụ cười đẹp của bạn </h1>
                            <p class="mb-4">Chúng tôi cam kết sẽ đem lại cho bạn một trải nghiệm thoải mái và đạt được kết quả tốt nhất.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-intro">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-6 color-1 p-4">
                        <h3 class="mb-4">Tình huống <strong>khẩn cấp</strong></h3>
                        <p>Hãy liên hệ nhanh chóng với đường dây để được tư vấn trực tiếp</p>
                        <span class="phone-number">+ (123) 456 7890</span>
                    </div>
                    <div class="col-md-6 color-2 p-4">
                        <h3 class="mb-4">Giờ mở cửa</h3>
                        <p class="openinghours d-flex">
                            <span>Thứ Hai - Thứ Bảy</span>
                            <span>8:00 - 19:00</span>
                        </p>
                       
                    </div>

                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row d-md-flex">
                    <div class="col-md-6 ftco-animate img about-image order-md-last" style="background-image: url(images/about.jpg);">
                    </div>
                    <div class="col-md-6 ftco-animate pr-md-5 order-md-first">
                        <div class="row">
                            <div class="col-md-12 nav-link-wrap mb-5">
                                <div class="nav ftco-animate nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link active" id="v-pills-whatwedo-tab" data-toggle="pill" href="#v-pills-whatwedo" role="tab" aria-controls="v-pills-whatwedo" aria-selected="true">Chúng tôi làm</a>

                                    <a class="nav-link" id="v-pills-mission-tab" data-toggle="pill" href="#v-pills-mission" role="tab" aria-controls="v-pills-mission" aria-selected="false">Nhiệm vụ</a>

                                    <a class="nav-link" id="v-pills-goal-tab" data-toggle="pill" href="#v-pills-goal" role="tab" aria-controls="v-pills-goal" aria-selected="false">Mục tiêu</a>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex align-items-center">

                                <div class="tab-content ftco-animate" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
                                        <div>
                                            <h2 class="mb-4">Chúng tôi cung cấp chất lượng cao</h2>
                                            <p>Với nguyên tắc “Mang đến những giá trị bền vững cho khách hàng” </p>
                                            <p>Nha khoa Quốc tế DentaCare ngay từ những ngày đầu thành lập cho đến nay vẫn luôn không ngừng nâng cao chất lượng dịch vụ, đem đến cho Quý khách hàng sự hài lòng tối cao cả về dịch vụ và chất lượng.</p>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-mission" role="tabpanel" aria-labelledby="v-pills-mission-tab">
                                        <div>
                                            <h2 class="mb-4">Tạo kết quả chất lượng nhất cho người dùng</h2>
                                            <p>Quý khách có cơ hội trải nghiệm điều trị nha khoa hoàn toàn khác biệt với dịch vụ “Nha khoa không đau”.</p>
                                            <p>Chúng tôi áp dụng triệt để quan niệm mới của ngành Y tế: “Can thiệp tối thiểu – Hiệu quả tối đa”, cam kết tạo cho Quý khách hàng cảm giác nhẹ nhàng và thoải mái nhất.</p>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-goal" role="tabpanel" aria-labelledby="v-pills-goal-tab">
                                        <div>
                                            <h2 class="mb-4">Giúp đỡ và hỗ trợ cho mọi trường hợp</h2>
                                            <p>Chúng tôi luôn đề cao Y đức, nâng cao trình độ chuyên môn, tận tâm trong công việc để mang lại hiệu quả và sự hài lòng cho từng khách hàng.</p>
                                            <p>Sứ mệnh của Nha khoa Nhân Tâm là mang lại nụ cười hoàn hảo, là nơi khơi nguồn niềm hạnh phúc cho mọi người.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section ftco-services">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-2">Our Service Keeps you Smile</h2>
                    </div>
                </div>
                <!--List service -->
                <%
                    List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                %>

                <div class="row">
                    <!--khai bao de dua service ra-->
                    <%
                        int count = 0;
                        if (listService != null) {
                            for (ServiceDTO service : listService) {
                    %>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="staff media block-6 services d-block text-center">
                            <div class="justify-content-center align-items-center">

                                <section>
                                    <div class="container">
                                        <div class="row justify-content-center ">
                                            <div class="carousel-testimony owl-carousel ">
                                                <!--thong bao de dua image ra-->
                                                <%
                                                    List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) request.getAttribute("LIST_SERVICE_IMAGE");
                                                    for (ServiceImageDTO Image : listServiceImage) {
                                                        if (service.getServiceID() != Image.getServiceID()) {
                                                            continue;
                                                        }
                                                %>
                                                <div>
                                                    <div class="testimony-wrap p-1 pb-3">
                                                        <div class="user-img mb-5" style="background-image: url(<%=Image.getImage()%>)">
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <div class="media-body p-2 mt-3">
                                    <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                    <div style="padding-bottom:10px"><h3 class="heading" style="color: #85b0e9" ><%=service.getServiceName()%></h3></div>
                                    
                                    <div class="border-success"><span style="color:red" class="icon-thumb-tack "></span><%=formatter.format(service.getServicePrice())%><span> VND</span></div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <%
                                count++;
                                if (count == 4) {
                                    break;
                                }
                            }
                        }
                    %>
                </div>
            </div>

            <div class="container-wrap mt-5">
                <div class="row d-flex no-gutters">
                    <div class="col-md-6 img" style="background-image: url(images/about-2.jpg);">
                    </div>
                    <div class="col-md-6 d-flex">
                        <div class="about-wrap">
                            <div class="heading-section heading-section-white mb-5 ftco-animate">
                                <h2 class="mb-2">Dentacare with a personal touch</h2>
                                <p>Sứ mệnh mang đến những giá trị cốt lõi cho khách hàng là làm đẹp nụ cười – thay đổi cuộc sống. Đây là hệ thống chuỗi nha khoa tiêu chuẩn Pháp đầu tiên tại Việt Nam quy tụ đội ngũ bác sĩ – chuyên gia nha khoa hàng đầu.</p>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Gặp gỡ các bác sĩ chất lượng cao</h3>
                                    <p>Đội ngũ bác sĩ chuyên môn cao – với hơn 20 bác sĩ đã tốt nghiệp loại giỏi , luôn không ngừng học các khóa học chuyên sâu, cập nhật các công nghệ nha khoa mới nhất trên thế giới để có thể đem đến kết quả điều trị tốt nhất cho khách hàng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Trang thiết bị hiện đại</h3>
                                    <p>Trang thiết bị máy móc là một trong những điểm mạnh vượt trội của Nha khoa Nhân Tâm mà rất ít địa chỉ nào có thể vượt qua được. Để chăm sóc sức khỏe răng miệng, điều trị và phục hình răng hàm mặt tốt nhất cho khách hàng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Phòng khám tiện nghi</h3>
                                    <p>Ứng dụng công nghệ hiện đại vào trong việc điều trị.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-3">Đội Ngũ Bác Sĩ Chất Lượng Cao</h2>
                        
                    </div>
                </div>

                <%
                    List<DoctorDTO> listDoctor = (List<DoctorDTO>) request.getAttribute("LIST_DOCTOR");
                    List<scheduleDTO> listSchedule = (List<scheduleDTO>) request.getAttribute("LIST_SCHEDULE_DOCTOR");
                %>
                <div class="row">
                    <%
                        int countDoctor = 0;
                        List<String> dayOfWeek = null;
                        if (listService
                                != null) {
                            for (DoctorDTO doctor : listDoctor) {
                                countDoctor++;
                                if (countDoctor == 5) {
                                    break;
                                }
                    %>
                    <div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
                        <div class="staff">
                            <div class="img mb-4" style="background-image: url(<%=doctor.getImage()%>);"></div>
                            <div class="info text-center">
                                <h3><%=doctor.getFullName()%></h3>
                                <span class="position"><%=doctor.getServiceTypeName()%></span>
                              
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-md-3 aside-stretch py-5">
                        <div class=" heading-section heading-section-white ftco-animate pr-md-4">
                            <h2 class="mb-3">THÀNH TỰU</h2>
                            <p>DentaCare luôn là địa chỉ được khách hàng tin tưởng và tìm đến trong suốt thời gian qua. Chúng tôi cam kết sẽ không ngừng nâng cao chất lượng dịch vụ để mang đến những kết quả tốt nhất cho khách hàng.</p>
                        </div>
                    </div>
                    <div class="col-md-9 py-5 pl-md-5">
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="11">0</strong>
                                        <span>Năm Kinh Nghiệm</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="<%=listDoctor.size()%>">0</strong>
                                        <span>Nha Sĩ Chất Lượng Cao</span>
                                    </div>
                                </div>
                            </div>
                            <%
                                int countPatient = (int) request.getAttribute("COUNT_PATIENT");
                            %>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="<%=countPatient%>">0</strong>
                                        <span>Số Lượng Bệnh Nhân Đã Đăng Kí</span>
                                    </div>
                                </div>
                            </div>
                            <%
                                int countService = (int) request.getAttribute("COUNT_SERVICE");
                            %>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="<%=countService%>">0</strong>
                                        <span>Số Lượng Dịch Vụ Hỗ Trợ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        

        <%List<DiscountDTO> listDiscount = (List<DiscountDTO>) request.getAttribute("LIST_DISCOUNT");%>
        <section class="ftco-section testimony-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-2 pb-2">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-2">Đại Giảm Giá</h2>
                        <span class="subheading">KHÁCH HÀNG LÀ NIỀM HẠNH PHÚC CỦA CHÚNG TÔI</span>
                    </div>
                </div>
                <div class="row justify-content-center ftco-animate">
                    <div class="col-md-8">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <%for (DiscountDTO discount : listDiscount) {
                            %>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(<%=discount.getImage()%>)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text text-center">
                                        <h4 class="mb-5 animate-charcter"><%=discount.getDescription()%></h4>
                                        <p class="name" style="color:#85b0e9"><%=discount.getTitle()%></p>
<!--                                        <span class="pt-2"><h4>Khuyến mãi tới:<%=discount.getPercentDiscount()%>%</h4> </span>-->
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <section class="ftco-gallery">
            <div class="container-wrap">
                <div class="row no-gutters">
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-1.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-2.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-3.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-4.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-quote">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 pr-md-5 aside-stretch py-5 choose">
                        <div class="heading-section heading-section-white mb-5 ftco-animate">
                            <h2 class="mb-2">DentaCare &amp; Dịch Vụ Chất Lượng Cao</h2>
                        </div>
                        <div class="ftco-animate">
                            <p>Chúng tôi luôn đề cao Y đức, nâng cao trình độ chuyên môn, tận tâm trong công việc để mang lại hiệu quả và sự hài lòng cho từng khách hàng. DentaCare luôn là địa chỉ được khách hàng tin tưởng và tìm đến trong suốt thời gian qua. Chúng tôi cam kết sẽ không ngừng nâng cao chất lượng dịch vụ để mang đến những kết quả tốt nhất cho khách hàng.</p>
                            <ul class="un-styled my-5">
                                <li><span class="icon-check"></span>Cơ sở hiện đại </li>
                                <li><span class="icon-check"></span>Đội ngũ chuyên môn cao</li>
                                <li><span class="icon-check"></span>Dịch vụ đa dạng</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 py-5 pl-md-5">
                        <div class="heading-section mb-5 ftco-animate">
                            <h2 class="mb-2">Tư vấn miễn phí</h2>
                        </div>
                        <form action="#" class="ftco-animate">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Họ tên">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Số điện thoại">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Lời nhắn"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="submit" value="Tư vấn miễn phí" class="btn btn-primary py-3 px-5">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <div id="map"></div>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-4">
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
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Quick Links</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Thông Tin</a></li>
                                <li><a href="#" class="py-2 d-block">Dịch Vụ</a></li>
                                <li><a href="#" class="py-2 d-block">Bác Sĩ</a></li>
                                <li><a href="#" class="py-2 d-block">Liên Hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Thông Tin Cơ Sở Phòng Tư</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> DentaCare </a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
