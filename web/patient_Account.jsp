<%-- 
    Document   : patient_Account.jsp
    Created on : Jul 18, 2022, 11:35:29 PM
    Author     : quang
--%>

<%@page import="patients.PatientDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>Tài khoản</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/account.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/menu.css">
        <!-- hiện thị password  -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
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
                            <%if (!loginPatient.equals("")) {%>
                        <li class="nav-item dropdown"><a href="LogoutController" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=loginPatient%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="ShowProfileAccountController" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                        <%} else {%>
                        <li class="nav-item cta"><a href="LoginController" class="nav-link" ><span>Đăng nhập</span></a></li>
                            <%}%>
                        <li class="nav-item cta"><a href="ShowBookingController" class="nav-link" ><span>Đặt lịch khám</span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <%
            String error = (String) session.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>

        <!<!-- Toast thông báo succeed update -->

        <%
            String msg = (String) request.getAttribute("SSMSG");
            if (msg == null) {
                msg = "";
            } else {
        %>
        <div id="toast-msg" role="alert" aria-live="assertive" aria-atomic="true"">
            <div class="toast-header1">
                <strong class="mr-auto1">Thông báo <i class="fa fa-bell"></i></strong>

                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onClick="toastClose()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body1">
                <%=msg%>
            </div>
        </div>

        <%}%>

        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg') ;max-height: 250px;"
                 data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
            </div>
        </section>

        <section class="ftco-section" style="height: 1500px; background-color: #2e9be4">
            <div class='container-fluid container1'>
                <div class='flip_box'>
                    <div class='front'>
                        <div class="wrapper bg-white mt-sm-5">
                            <h4 class="pb-4 border-bottom">Tài Khoản Cá Nhân</h4>
                            <%
                                PatientDTO patient = (PatientDTO) request.getAttribute("PATIENT_PROFILE");
                            %>
                            <div class="py-2 ml-3">
                                <div class="row py-2">
                                    <div class=" col-md-7">
                                        <label for="fullName" class="text-primary">Họ Tên: </label>
                                        <label class="m-1"><%=patient.getFullName()%></label>
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">Email: </label>
                                        <label class="m-1"><%=patient.getGmail()%></label>
                                    </div>

                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">Phone </label>
                                        <label class="m-1">0<%=patient.getPhone()%></label>
                                    </div>

                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">Address: </label>
                                        <label class="m-1"><%=patient.getAddress()%></label>
                                    </div>

                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">Gender </label>
                                        <label class="m-1"><%=patient.getGender()%></label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='back'>
                        <div class="wrapper bg-white mt-sm-5 border-success">
                            <form action="UpdateProfilePatientController" method="POST">
                                <h4 class="pb-4 border-bottom">Account settings</h4>
                                <div class="py-2">
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label class="text-primary">Họ Tên:</label>
                                            <input type="text" class="bg-light form-control" name="fullName" value="<%=patient.getFullName()%>" placeholder="Họ và tên">
                                        </div>
                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label class="text-primary">Email:</label>
                                            <input type="text" class="bg-light form-control" name="gmail" value="<%=patient.getGmail()%>" placeholder="detacare@gmail.com">
                                        </div>

                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label class="text-primary">Phone</label>
                                            <input type="number" class="bg-light form-control" name="phone" value="0<%=patient.getPhone()%>" placeholder="Điện thoại di động">
                                        </div>

                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label class="text-primary">Address</label>
                                            <input type="text" class="bg-light form-control" name="address" value="<%=patient.getAddress()%>" placeholder="Địa chỉ">
                                        </div>

                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label class="text-primary">Gender</label>
                                            <select name="gender">
                                                <option value="Nam">Nam</option>
                                                <option value="Nữ">Nữ</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label  class="text-primary">Mật Khẩu:</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                                                </div>
                                                <input name="password" type="password" value="<%=patient.getPassword()%>" class="input form-control" id="password" placeholder="password" required="true" aria-label="password" aria-describedby="basic-addon1" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text" onclick="password_show_hide();">
                                                        <i class="fas fa-eye" id="show_eye"></i>
                                                        <i class="fas fa-eye-slash d-none" id="hide_eye"></i>
                                                    </span>
                                                </div>
                                            </div>

                                            <label class="text-primary">Nhập Lại Mật Khẩu:</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                                                </div>
                                                <input name="confirmPassword" type="password" value="<%=patient.getPassword()%>" class="input form-control" id="confirmPassword" placeholder="password" required="true" aria-label="confirmPassword" aria-describedby="basic-addon1" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text" onclick="confirm_password_show_hide();">
                                                        <i class="fas fa-eye" id="show_eye"></i>
                                                        <i class="fas fa-eye-slash d-none" id="hide_eye"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <input type="hidden" name="patientID" value="<%=patient.getPatientID()%>">
                                    <div class="py-3 pb-4 border-bottom">
                                        <input type="submit" class="btn btn-primary mr-3" name="action" value="Lưu Thay Đổi">
                                    </div>

                                </div>
                            </form>

                        </div>
                    </div>

                </div>

                <div class='r_wrap'>

                    <div class='b_round'></div>
                    <div class='s_round'>
                        <div class='s_arrow'></div>
                    </div>
                </div>

            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p>Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> All rights reserved </a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- loader --> 
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>

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
        <script>
                                //hiện thị password
                                function password_show_hide() {
                                    var x = document.getElementById("password");
                                    var show_eye = document.getElementById("show_eye");
                                    var hide_eye = document.getElementById("hide_eye");
                                    hide_eye.classList.remove("d-none");
                                    if (x.type === "password") {
                                        x.type = "text";
                                        show_eye.style.display = "none";
                                        hide_eye.style.display = "block";
                                    } else {
                                        x.type = "password";
                                        show_eye.style.display = "block";
                                        hide_eye.style.display = "none";
                                    }
                                }

                                function confirm_password_show_hide() {
                                    var x = document.getElementById("confirmPassword");
                                    var show_eye = document.getElementById("show_eye");
                                    var hide_eye = document.getElementById("hide_eye");
                                    hide_eye.classList.remove("d-none");
                                    if (x.type === "password") {
                                        x.type = "text";
                                        show_eye.style.display = "none";
                                        hide_eye.style.display = "block";
                                    } else {
                                        x.type = "password";
                                        show_eye.style.display = "block";
                                        hide_eye.style.display = "none";
                                    }
                                }
        </script>
        <script>
            $(document).ready(function () {

                var s_round = '.s_round';

                $(s_round).hover(function () {
                    $('.b_round').toggleClass('b_round_hover');
                    return false;
                });

                $(s_round).click(function () {
                    $('.flip_box').toggleClass('flipped');
                    $(this).addClass('s_round_click');
                    $('.s_arrow').toggleClass('s_arrow_rotate');
                    $('.b_round').toggleClass('b_round_back_hover');
                    return false;
                });

                $(s_round).on('transitionend', function () {
                    $(this).removeClass('s_round_click');
                    $(this).addClass('s_round_back');
                    return false;
                });
            });


        </script>

        <script>
            function toastClose() {
                var toast1 = document.getElementById("toast-msg");
                toast1.style.display = "none";
            }
        </script>
    </body>
</html>
