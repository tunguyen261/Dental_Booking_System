
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="serviceImage.ServiceImageDTO"%>
<%@page import="patients.PatientDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>Service</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
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
                        <li class="nav-item"><a href="login.jsp" class="nav-link sa" ><span>Đăng nhập</span></a></li>
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
                            <p class="breadcrumbs" data-scrollax=" properties: { translateY: '70%', opacity: 1.6}"><a href="HomeController">Trang chủ</a></span> <span class="mr-2"><a href="LoadController">Dịch vụ</a></span></p>
                            <h1 class="mb-3" data-scrollax=" properties: { translateY: '70%', opacity: .9}">Our Service Keeps you Smile</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="col-md-10 offset-3 mb-3">
                    <div class="btn-group align-content-center">
                        <form action="SearchServiceHomeController">
                            <input type="search" style="width: 350px; height: 50px; border-radius: 20px" class="form" name="serviceName">
                            <input class="btn btn-info" style="background: #227093; color: white; height: 60px; margin-right: 5px;border-radius: 20px " type="submit" value="Tìm kiếm dịch vụ">
                        </form>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-2">Our Service Keeps you Smile</h2>
                        <p>Nổ lực để mang tới dịch vụ tốt nhất cho bạn.</p>
                    </div>
                </div>
            </div>
            <div class="container">
                <%

                    List<ServiceDTO> listsvbySVType = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE_TYPE");
                    if (listsvbySVType != null) {
                        List<ServiceDTO> listService = listsvbySVType;
                %>
                <form>
                    <div class="row">
                        <%
                            if (listService != null) {
                                for (ServiceDTO service : listService) {
                        %>
                        <div class="col-md-3">
                            <div class="card card-body mb-4 border-primary bg-primary" style="border-radius: 20px">
                                <div class="services text-center ">
                                    <h5 style="height: 50px ; color: white; font-family: Arial, Helvetica, sans-serif;"><%=service.getServiceName()%></h5>
                                    <%
                                        List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) request.getAttribute("LIST_SERVICE_IMAGE");
                                        for (ServiceImageDTO Image : listServiceImage) {
                                            if (service.getServiceID() != Image.getServiceID()) {
                                                continue;
                                            }
                                    %>
                                    <div>
                                        <img style="width: 200px;height:150px; vertical-align: middle;margin-bottom: 12px; border-radius: 10px ; " src="<%=Image.getImage()%>">
                                    </div>
                                    <%break;
                                        }%>
                                    <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                    <p style="color: white"><%=formatter.format(service.getServicePrice())%>VND/ 1 Liệu Trình</p>
                                    <a class="btn btn-light Bold" style="border-radius: 20px; " href="LoadServiceDetailController?serviceID=<%=service.getServiceID()%>">Chi Tiết</a>

                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </form>
                <%
                } else {
                    List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                %>
                <form>
                    <div class="row">
                        <%
                            if (listService != null) {
                                for (ServiceDTO service : listService) {
                                    if (service.getStatus() == 1) {
                        %>
                        <div class="col-md-3">
                            <div class="card card-body mb-4 border-primary bg-primary" style="border-radius: 20px ; ">
                                <div class="services text-center ">
                                    <h5 style="height: 50px ; color: white; font-family: Arial, Helvetica, sans-serif;"><%=service.getServiceName()%></h5>
                                    <%
                                        List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) request.getAttribute("LIST_SERVICE_IMAGE");
                                        for (ServiceImageDTO Image : listServiceImage) {
                                            if (service.getServiceID() != Image.getServiceID()) {
                                                continue;
                                            }
                                    %>
                                    <div>
                                        <img style="width: 200px;height:150px; vertical-align: middle;margin-bottom: 12px; border-radius: 10px ; " src="<%=Image.getImage()%>">
                                    </div>
                                    <%break;
                                        }%>
                                    <p style="color: white"><%=service.getServicePrice()%> VND/1 Liệu Trình</p>
                                    <a class="btn btn-light Bold" style="border-radius: 20px" href="LoadServiceDetailController?serviceID=<%=service.getServiceID()%>"><strong>Chi Tiết</strong></a>
                                </div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                    </div>
                </form>
                <%
                    }
                %>

            </div>
        </section>

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
                                <li><a href="HomeController" class="py-2 d-block">Thông Tin</a></li>
                                <li><a href="LoadController" class="py-2 d-block">Dịch Vụ</a></li>
                                <li><a href="LoadDoctorController" class="py-2 d-block">Bác Sĩ</a></li>
                                <li><a href="ShowTeamController" class="py-2 d-block">Liên Hệ</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Thông Tin Cơ Sở Phòng Tư</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">0393626592</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">dentacare.noti@gmail.com</span></a></li>
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

    </body>
</html>
