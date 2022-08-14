<%-- 
    Document   : DoctorControll
    Created on : Jul 18, 2022, 4:52:08 PM
    Author     : Doan
--%>

<%@page import="services.ServiceDTO"%>
<%@page import="patients.PatientDTO"%>
<%@page import="bookingdetail.BookingDetailDTO"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="doctors.DoctorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>Bác sĩ</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">
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
        <link rel="stylesheet" href="css/dentistPage.css">
        <style>
            .app-color-blue-1 {
                color: #346EE1;
            }

            .app-color-blue-3 {
                color: #A0B4D6;
            }

            .app-color-black {
                color: #0d0f13;
            }

            .app-color-gray-1 {
                color: #0f1011;
            }

            .app-color-red {
                color: #949AA7;
            }

            .app-bg-blue-1 {
                background: #346EE1;
            }

            .app-bg-blue-2 {
                background: #F5F9FC;
            }

            .app-button-shadow {
                box-shadow: 0px 5px 10px 0px rgb(145 167 210 / 25%);
            }

            .app-bg-blue-3 {
                background: #4A7AE5;
            }

            .app-bg-blue-4 {
                background: #518AEA;
            }

            .app-bg-white-1 {
                background: #F4F8F9;
            }

            .app-color-yellow-1 {
                color: #D7AC67;
            }

            .app-bg-yellow-2 {
                background: #FFF9EB;
            }

            .app-bg-yellow-3 {
                background: #FFBE4E;
            }

            .app-color-red-1 {
                color: #d3274c;
            }

            .app-bg-red-2 {
                background: #FEF5F6;
            }

            .app-color-green {
                color: #0CBDA8;
            }
            table{
                overflow-y: scroll;
            }
        </style>
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
        <link rel="stylesheet" href="css/product.css">
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
              integrity="sha512-wnea99uKIC3TJF7v4eKk4Y+lMz2Mklv18+r4na2Gn1abDRPPOeef95xTzdwGD9e6zXJBteMIhZ1+68QC5byJZw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/menu.css">
    </head>
    <body>
        <%DoctorDTO login = (DoctorDTO) session.getAttribute("LOGIN_DOCTOR");%>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="home.jsp">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item "><a href="ShowDoctorSchedule" class="nav-link sa" style="font-weight: bold">Thời Gian Biểu</a></li>
                        <li class="nav-item active"><a href="ShowBookingDoctorController" class="nav-link sa" style="font-weight: bold">Quản lý lịch đặt</a></li>
                        <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle "style="font-weight: bold"><%=login.getFullName()%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="ShowProfileDoctorController" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>  
        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');"
                 data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
            </div>
        </section>    
        <!-- Cancel Toast -->
        <%
            String msg = (String) request.getAttribute("CANCEL_SUCCES");
            if (msg == null) {
                msg = "";
            } else {
        %>

        <div id="toast-msg" role="alert" aria-live="assertive" aria-atomic="true">
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
        <!-- Update Toast -->
        <%
            String msg1 = (String) request.getAttribute("UPDATE_SUCCES");
            if (msg1 == null) {
                msg1 = "";
            } else {
        %>

        <div id="toast-msg" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header1">
                <strong class="mr-auto1">Thông báo <i class="fa fa-bell"></i></strong>

                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onClick="toastClose()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body1">
                <%=msg1%>
            </div>
        </div>

        <%}%>

        <!-- Cac bookingDetail của bác si -->                
        <!-- Begin Page Content -->
        <%List<BookingDetailDTO> listBooking = (List<BookingDetailDTO>) request.getAttribute("listBooking");
            List<scheduleDTO> listSchedule = (List<scheduleDTO>) request.getAttribute("listSchedule");
            List<DoctorDTO> listDoctor = (List<DoctorDTO>) request.getAttribute("listDoctor");
            List<PatientDTO> listPatient = (List<PatientDTO>) request.getAttribute("listPatient");
            List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("listService");
        %>    

        <section class="ftco-section">
            <div class="container" style="max-width: 1282px">

                <div class=" app-bg-white-1 pb-5 ">
                    <div class="flex flex-row items-center pt-3">
                        <div class="px-6 py-3">
                            <span class="text-lg text-white font-bold">.</span>
                        </div>

                        <div class="flex flex-row items-center">
                            <div class="h-9 w-9 app-bg-blue-2 flex justify-center items-center rounded-xl">
                                <svg class="w-6 h-6 app-color-blue-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                                </path>
                                </svg>
                            </div>
                            <div class="flex flex-col pl-2">
                                <span class="font-semibold text-lg app-color-black">Danh sách các lịch hẹn</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <table class="table table-bordered table-hover text-align-center">
                            <thead>
                                <tr>
                                    <th class="text-center" style="font-size:0.75rem;line-height: 2rem">STT</th>
                                    <th class="text-center" style="font-size:0.75rem;line-height: 2rem"">BÁC SĨ</th>
                                    <th class="text-center" style="font-size:0.75rem;line-height: 2rem"">DỊCH VỤ</th>
                                    <th class="text-center " style="font-size:0.75rem;line-height: 2rem"">NGÀY HẸN</th>
                                    <th class="text-center " style="font-size:0.75rem;line-height: 2rem"">GIỜ HẸN</th>
                                    <th class="text-center " style="font-size:0.75rem;line-height: 2rem"">KHÁCH HÀNG</th>
                                    <th class="text-center " style="font-size:0.75rem;line-height: 2rem"">CHI PHÍ</th>
                                    <th class="text-center " style="font-size:0.75rem;line-height: 2rem"">TRẠNG THÁI</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%int demm = 0;
                                    for (BookingDetailDTO bk : listBooking) {
                                        for (scheduleDTO schedule : listSchedule) {
                                            if (bk.getScheduleID() == schedule.getScheduleID()) {
                                                for (DoctorDTO doctor : listDoctor) {
                                                    if (schedule.getDoctorID() == doctor.getDoctorID() && schedule.getDoctorID() == login.getDoctorID()) {
                                                        for (PatientDTO patient : listPatient) {
                                                            if (bk.getPatientID() == patient.getPatientID()) {
                                                                for (ServiceDTO service : listService) {
                                                                    if (bk.getServiceID() == service.getServiceID()) {
                                                                        demm++;
                                %> 
                            <div id="f" type="hidden"></div>
                            <form action="UpdateBookingDoctorController">
                                <tr>
                                    <td>
                                        <div
                                            class="flex justify-center items-center rounded-md w-8 h-8 app-bg-yellow-2 app-color-yellow-1 text-lg font-semibold">
                                            <%=demm%></div>
                                    </td>
                                <input type="hidden" name="BookingDetailID" value="<%=bk.getBookingDetailID()%>">
                                <td>
                                    <span class="font-semibold text-sm app-color-black"><%=doctor.getFullName()%></span>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%=service.getServiceName()%></span>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%=schedule.getDay()%></span>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%int slot = schedule.getSlot();
                                        switch (slot) {
                                            case 1:
                                        %>7:00 - 9:00 am<%
                                                break;
                                            case 2:
                                        %>9:00 - 11:00 am<%
                                                break;
                                            case 3:
                                        %>13:00 - 15:00 pm<%
                                                break;
                                            case 4:
                                        %>15:00 - 17:00 pm<%
                                                    break;
                                                default:
                                                    throw new AssertionError();
                                            }
                                        %></span>
                                </td>
                                <td>
                                    <div class="font-semibold text-sm app-color-gray-1">
                                        <%=patient.getFullName()%>
                                    </div>
                                </td>
                                <td>
                                    <div class="font-semibold text-sm app-color-gray-1 ">
                                        <input name="expectedFee" value="<%=bk.getExpectedFee()%>">
                                    </div>
                                </td>
                                <td>
                                    <input class="btn btn-primary" type="submit" value="Đã hoàn thành">
                                </td>
                            </form>
                            <td>
                                <input class="btn btn-danger" onclick="handleSubmit(<%=bk.getScheduleID()%>)"value="Xóa" type="button">
                            </td>
                            </tr>

                            <%
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }%>
                            </tbody>
                        </table>
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
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
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
        <script src="js/scrollax.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/dentistPage.js"></script>
        <script>
                                function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";
                                }
                                function handleSubmit(id) {
                                    if (confirm("Bạn muốn xóa lịch đặt này?")) {
                                        var form = document.createElement("form");
                                        form.action = "DeleteBookingDetailDoctorController";
                                        const BKid = document.createElement("input");
                                        BKid.type = "hidden"
                                        BKid.value = id;
                                        BKid.name = "scheduleID";
                                        form.appendChild(BKid);
                                        var body = document.getElementById('f');
                                        body.appendChild(form)
                                        form.submit()
                                    } else {

                                    }
                                }
        </script>
    </body>
</html>
