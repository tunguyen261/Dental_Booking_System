<%-- 
    Document   : welcomeService
    Created on : Jul 10, 2022, 10:03:51 PM
    Author     : Doan
--%>


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
        <script src="https://nguyentienthu.net/wp-content/litespeed/localres/aHR0cHM6Ly9tYXBzLmdvb2dsZWFwaXMuY29tL21hcHMvYXBpL2pz?key=326210504580-9jhmvl00cg3sabr664sav1p87gsnf90g.apps.googleusercontent.com&callback=initMap"
    async defer></script>
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
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
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
                            <div class="card card-body mb-4 border-primary" style="border-radius: 10px ; background-color: #85b0e9;">
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
                                    <a class="btn btn-outline-info" style="border-radius: 10px; color: white" href="LoadServiceDetailController?serviceID=<%=service.getServiceID()%>">Chi Tiết</a>

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
                            <div class="card card-body mb-4 border-primary" style="border-radius: 10px ; background-color: #85b0e9;">
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
                                    <a class="btn btn-primary" href="LoadServiceDetailController?serviceID=<%=service.getServiceID()%>">Chi Tiết</a>

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
                <div class="pagination align-content-center">
                    <li class="page-item previous-page"><a class="page-link" href="#">Prev</a></li>
                    <li class="page-item current-page"><a class="page-link" href="#">1</a></li>
                    <li class="page-item dots"><a class="page-link" href="#">2</a></li>
                    <li class="page-item previous-page"><a class="page-link" href="#">3</a></li>
                    <li class="page-item dots"><a class="page-link" href="#">...</a></li>
                    <li class="page-item next-page"><a class="page-link" href="#">Next</a></li>
                </div>
            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">DentaCare.</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
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
                                <li><a href="about.html" class="py-2 d-block">About</a></li>
                                <li><a href="doctors.html" class="py-2 d-block">Doctors</a></li>
                                <li><a href="blog.html" class="py-2 d-block">Blog</a></li>
                                <li><a href="contact.html" class="py-2 d-block">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 pr-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Recent Blog</h2>
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

