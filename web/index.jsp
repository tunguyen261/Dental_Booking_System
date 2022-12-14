
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
                        <li class="nav-item active"><a href="HomeController" class="nav-link sa">Trang ch???</a></li>
                        <li class="nav-item "><a href="team.jsp" class="nav-link sa">Nh??m ph??t tri???n</a></li>
                        <li class="nav-item dropdown"><a href="MainController?action=Load" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">D???ch v???</a>
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
                        <li class="nav-item"><a href="LoadDoctorController" class="nav-link sa">B??c s??</a></li>
                        <li class="nav-item"><a href="ShowBookingPatientController" class="nav-link sa">L???ch s??? l???ch ?????t</a></li>
                        <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a>
                           
                        </li>
                        <li class="nav-item cta"><a href="login.jsp" class="nav-link" ><span>?????t l???ch kh??m</span></a></li>

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
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">H??? th???ng nha khoa hi???n ?????i trong m???t m??i tr?????ng tho???i m??i v?? an to??n</h1>
                            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Trang thi???t b??? hi???n ?????i v?? ?????i ng?? nh??n vi??n chuy??n nghi???p</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url('images/bg_2.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center" data-scrollax-parent="true">
                        <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">?????m b???o n??? c?????i ?????p c???a b???n </h1>
                            <p class="mb-4">Ch??ng t??i cam k???t s??? ??em l???i cho b???n m???t tr???i nghi???m tho???i m??i v?? ?????t ???????c k???t qu??? t???t nh???t.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-intro">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-6 color-1 p-4">
                        <h3 class="mb-4">T??nh hu???ng <strong>kh???n c???p</strong></h3>
                        <p>H??y li??n h??? nhanh ch??ng v???i ???????ng d??y ????? ???????c t?? v???n tr???c ti???p</p>
                        <span class="phone-number">+ (123) 456 7890</span>
                    </div>
                    <div class="col-md-6 color-2 p-4">
                        <h3 class="mb-4">Gi??? m??? c???a</h3>
                        <p class="openinghours d-flex">
                            <span>Th??? Hai - Th??? B???y</span>
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
                                    <a class="nav-link active" id="v-pills-whatwedo-tab" data-toggle="pill" href="#v-pills-whatwedo" role="tab" aria-controls="v-pills-whatwedo" aria-selected="true">Ch??ng t??i l??m</a>

                                    <a class="nav-link" id="v-pills-mission-tab" data-toggle="pill" href="#v-pills-mission" role="tab" aria-controls="v-pills-mission" aria-selected="false">Nhi???m v???</a>

                                    <a class="nav-link" id="v-pills-goal-tab" data-toggle="pill" href="#v-pills-goal" role="tab" aria-controls="v-pills-goal" aria-selected="false">M???c ti??u</a>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex align-items-center">

                                <div class="tab-content ftco-animate" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
                                        <div>
                                            <h2 class="mb-4">Ch??ng t??i cung c???p ch???t l?????ng cao</h2>
                                            <p>V???i nguy??n t???c ???Mang ?????n nh???ng gi?? tr??? b???n v???ng cho kh??ch h??ng??? </p>
                                            <p>Nha khoa Qu???c t??? DentaCare ngay t??? nh???ng ng??y ?????u th??nh l???p cho ?????n nay v???n lu??n kh??ng ng???ng n??ng cao ch???t l?????ng d???ch v???, ??em ?????n cho Qu?? kh??ch h??ng s??? h??i l??ng t???i cao c??? v??? d???ch v??? v?? ch???t l?????ng.</p>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-mission" role="tabpanel" aria-labelledby="v-pills-mission-tab">
                                        <div>
                                            <h2 class="mb-4">T???o k???t qu??? ch???t l?????ng nh???t cho ng?????i d??ng</h2>
                                            <p>Qu?? kh??ch c?? c?? h???i tr???i nghi???m ??i???u tr??? nha khoa ho??n to??n kh??c bi???t v???i d???ch v??? ???Nha khoa kh??ng ??au???.</p>
                                            <p>Ch??ng t??i ??p d???ng tri???t ????? quan ni???m m???i c???a ng??nh Y t???: ???Can thi???p t???i thi???u ??? Hi???u qu??? t???i ??a???, cam k???t t???o cho Qu?? kh??ch h??ng c???m gi??c nh??? nh??ng v?? tho???i m??i nh???t.</p>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-goal" role="tabpanel" aria-labelledby="v-pills-goal-tab">
                                        <div>
                                            <h2 class="mb-4">Gi??p ????? v?? h??? tr??? cho m???i tr?????ng h???p</h2>
                                            <p>Ch??ng t??i lu??n ????? cao Y ?????c, n??ng cao tr??nh ????? chuy??n m??n, t???n t??m trong c??ng vi???c ????? mang l???i hi???u qu??? v?? s??? h??i l??ng cho t???ng kh??ch h??ng.</p>
                                            <p>S??? m???nh c???a Nha khoa Nh??n T??m l?? mang l???i n??? c?????i ho??n h???o, l?? n??i kh??i ngu???n ni???m h???nh ph??c cho m???i ng?????i.</p>
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
                                <p>S???? m????nh mang ??????n nh???ng gi?? tr??? c????t lo??i cho kh??ch h??ng l?? l??m ?????p n??? c?????i ??? thay ??????i cu????c s????ng. ????y la?? h???? th????ng chu????i nha khoa ti??u chu????n Pha??p ??????u ti??n ta??i Vi????t Nam quy tu?? ??????i ngu?? ba??c si?? ??? chuy??n gia nha khoa ha??ng ??????u.</p>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>G???p g??? c??c b??c s?? ch???t l?????ng cao</h3>
                                    <p>?????i ng?? b??c s?? chuy??n m??n cao ??? v???i h??n 20 b??c s?? ???? t???t nghi???p lo???i gi???i , lu??n kh??ng ng???ng h???c c??c kh??a h???c chuy??n s??u, c???p nh???t c??c c??ng ngh??? nha khoa m???i nh???t tr??n th??? gi???i ????? c?? th??? ??em ?????n k???t qu??? ??i???u tr??? t???t nh???t cho kh??ch h??ng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Trang thi???t b??? hi???n ?????i</h3>
                                    <p>Trang thi???t b??? m??y m??c l?? m???t trong nh???ng ??i???m m???nh v?????t tr???i c???a Nha khoa Nh??n T??m m?? r???t ??t ?????a ch??? n??o c?? th??? v?????t qua ???????c. ????? ch??m s??c s???c kh???e r??ng mi???ng, ??i???u tr??? v?? ph???c h??nh r??ng h??m m???t t???t nh???t cho kh??ch h??ng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Ph??ng kh??m ti???n nghi</h3>
                                    <p>???ng d???ng c??ng ngh??? hi???n ?????i v??o trong vi???c ??i???u tr???.</p>
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
                        <h2 class="mb-3">?????i Ng?? B??c S?? Ch???t L?????ng Cao</h2>
                        
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
                            <h2 class="mb-3">TH??NH T???U</h2>
                            <p>DentaCare lu??n l?? ?????a ch??? ???????c kh??ch h??ng tin t?????ng v?? t??m ?????n trong su???t th???i gian qua. Ch??ng t??i cam k???t s??? kh??ng ng???ng n??ng cao ch???t l?????ng d???ch v??? ????? mang ?????n nh???ng k???t qu??? t???t nh???t cho kh??ch h??ng.</p>
                        </div>
                    </div>
                    <div class="col-md-9 py-5 pl-md-5">
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="11">0</strong>
                                        <span>N??m Kinh Nghi???m</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="<%=listDoctor.size()%>">0</strong>
                                        <span>Nha S?? Ch???t L?????ng Cao</span>
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
                                        <span>S??? L?????ng B???nh Nh??n ???? ????ng K??</span>
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
                                        <span>S??? L?????ng D???ch V??? H??? Tr???</span>
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
                        <h2 class="mb-2">?????i Gi???m Gi??</h2>
                        <span class="subheading">KH??CH H??NG L?? NI???M H???NH PH??C C???A CH??NG T??I</span>
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
<!--                                        <span class="pt-2"><h4>Khuy???n m??i t???i:<%=discount.getPercentDiscount()%>%</h4> </span>-->
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
                            <h2 class="mb-2">DentaCare &amp; D???ch V??? Ch???t L?????ng Cao</h2>
                        </div>
                        <div class="ftco-animate">
                            <p>Ch??ng t??i lu??n ????? cao Y ?????c, n??ng cao tr??nh ????? chuy??n m??n, t???n t??m trong c??ng vi???c ????? mang l???i hi???u qu??? v?? s??? h??i l??ng cho t???ng kh??ch h??ng. DentaCare lu??n l?? ?????a ch??? ???????c kh??ch h??ng tin t?????ng v?? t??m ?????n trong su???t th???i gian qua. Ch??ng t??i cam k???t s??? kh??ng ng???ng n??ng cao ch???t l?????ng d???ch v??? ????? mang ?????n nh???ng k???t qu??? t???t nh???t cho kh??ch h??ng.</p>
                            <ul class="un-styled my-5">
                                <li><span class="icon-check"></span>C?? s??? hi???n ?????i </li>
                                <li><span class="icon-check"></span>?????i ng?? chuy??n m??n cao</li>
                                <li><span class="icon-check"></span>D???ch v??? ??a d???ng</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 py-5 pl-md-5">
                        <div class="heading-section mb-5 ftco-animate">
                            <h2 class="mb-2">T?? v???n mi???n ph??</h2>
                        </div>
                        <form action="#" class="ftco-animate">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="H??? t??n">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="S??? ??i???n tho???i">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="L???i nh???n"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="submit" value="T?? v???n mi???n ph??" class="btn btn-primary py-3 px-5">
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
                            <p>Nha Khoa DentalCare cung c???p ?????y ????? c??c lo???i h??nh ??i???u tr??? nh??: T???ng qu??t, Ph???c h??nh r??ng s???, C???y gh??p implant, Ch???nh nha - ni???ng r??ng, Th???m m??? n?????u.</p>
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
                                <li><a href="#" class="py-2 d-block">Th??ng Tin</a></li>
                                <li><a href="#" class="py-2 d-block">D???ch V???</a></li>
                                <li><a href="#" class="py-2 d-block">B??c S??</a></li>
                                <li><a href="#" class="py-2 d-block">Li??n H???</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Th??ng Tin C?? S??? Ph??ng T??</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">L?? E2a-7, ???????ng D1, ??. D1, Long Th???nh M???, Th??nh Ph??? Th??? ?????c, Th??nh ph??? H??? Ch?? Minh, Vi???t Nam</span></li>
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
