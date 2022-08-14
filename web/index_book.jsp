<%-- 
    Document   : index_admin
    Created on : Jun 23, 2022, 4:39:03 PM
    Author     : Doan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="services.ServiceDTO"%>
<%@page import="patients.PatientDTO"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="bookingdetail.BookingDetailDTO"%>
<%@page import="admins.AdminDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>DentaCare-Admin</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
              integrity="sha512-wnea99uKIC3TJF7v4eKk4Y+lMz2Mklv18+r4na2Gn1abDRPPOeef95xTzdwGD9e6zXJBteMIhZ1+68QC5byJZw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .ftco-section {
                padding: 0;
            }
        </style>
    </head>

    <body id="page-top">
        <%AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");%>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-tooth"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Denta <strong>care</strong></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item ">
                    <a class="nav-link" href="LoadAdminController">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">

                    <a class="nav-link collapsed" href="index_service.jsp" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Dịch Vụ</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <div class="row">
                                <h6 class="collapse-header">Các loại dịch vụ</h6>
                            </div>
                            <%
                                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>


                            <div class="row service-item">
                                <a class="collapse-item col-sm float-left" href="LoadServiceController?serviceTypeName=<%=svType.getServiceTypeName()%>&serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowDoctorController">
                        <i class="fa-solid fa-user-doctor"></i>
                        <span>Bác Sĩ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowPatientController">
                        <i class="fa-solid fa-bed-pulse"></i>
                        <span>Bệnh nhân</span>
                    </a>
                </li>



                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowFeedBackAdminController">
                        <i class="fas fa-fw fa-bell"></i>
                        <span>Đánh Giá</span>
                    </a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item active">
                    <a class="nav-link" href="ShowBookingAdminController">
                        <i class="fas fa-fw fa-calendar-check"></i>
                        <span>Lịch Hẹn</span></a>
                </li>
                <!-- Nav Item - Tables -->
                <li class="nav-item">

                    <a class="nav-link collapsed" href="index_service.jsp" data-toggle="collapse" data-target="#collapseThree"
                       aria-expanded="true" aria-controls="collapseThree">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Mã giảm giá</span>
                    </a>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <div class="row">
                                <h6 class="collapse-header">Các loại giảm giá</h6>
                            </div>
                            <%
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>

                            <div class="row service-item">
                                <a class="collapse-item col-sm float-left" href="LoadDiscountController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>

                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>



                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">




                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=loginAdmin.getFullName()%></span>
                                    <img class="img-profile rounded-circle"
                                         src="https://www.kindpng.com/picc/m/699-6997452_administrator-network-icons-system-avatar-computer-transparent-admin.png">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="LogoutController" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <%List<BookingDetailDTO> listBooking = (List<BookingDetailDTO>) request.getAttribute("listBooking");
                        List<scheduleDTO> listSchedule = (List<scheduleDTO>) request.getAttribute("listSchedule");
                        List<DoctorDTO> listDoctor = (List<DoctorDTO>) request.getAttribute("listDoctor");
                        List<PatientDTO> listPatient = (List<PatientDTO>) request.getAttribute("listPatient");
                        List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("listService");
                    %>
                    <div class="container">
                        <section class="ftco-section">
                            <div class="container overflow-hidden rounded-2xl">
                                <div class="flex flex-row bg-white items-center">
                                    <div class="app-bg-blue-1 px-6 py-3">
                                        <span class="text-lg text-white font-bold">.</span>
                                    </div>

                                    <div class="flex flex-row pl-5 items-center mr-auto">
                                        <div class="h-9 w-9 app-bg-blue-2 flex justify-center items-center rounded-xl">
                                            <svg class="w-6 h-6 app-color-blue-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                                            </path>
                                            </svg>
                                        </div>
                                        <div class="flex flex-col pl-5">
                                            <span class="font-semibold text-lg app-color-black">Danh sách các lịch hẹn</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex flex-col app-bg-white-1 px-12 pb-10">
                                    <div class="flex flex-row py-5">
                                        <span class="text-lg font-bold app-color-black">Danh Sách:</span>
                                    </div>

                                    <div class="flex flex-row bg-white p-10 relative">
                                        <div class="absolute app-bg-yellow-3 text-xs font-semibold px-3 py-0.5 rounded-br-md rounded-tl-md text-white"
                                             style="top: 76px;"></div>
                                        <table class="w-full table-striped ">
                                            <thead>
                                                <tr>
                                                    <th class="text-left text-xs app-color-black pb-5">STT</th>
                                                    <th class="text-left text-xs app-color-black pb-5">BÁC SĨ</th>
                                                    <th class="text-left text-xs app-color-black pb-5">DỊCH VỤ</th>
                                                    <th class="text-left text-xs app-color-black pb-5">NGÀY HẸN</th>
                                                    <th class="text-left text-xs app-color-black pb-5">GIỜ HẸN</th>
                                                    <th class="text-left text-xs app-color-black pb-5">KHÁCH HÀNG</th>
                                                    <th class="text-left text-xs app-color-black pb-5">CHI PHÍ</th>
                                                    <th class="text-left text-xs app-color-black pb-5">TRẠNG THÁI</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%int demm = 0;
                                                    for (BookingDetailDTO bk : listBooking) {
                                                        for (scheduleDTO schedule : listSchedule) {
                                                            if (bk.getScheduleID() == schedule.getScheduleID()) {
                                                                for (DoctorDTO doctor : listDoctor) {
                                                                    if (schedule.getDoctorID() == doctor.getDoctorID()) {
                                                                        for (PatientDTO patient : listPatient) {
                                                                            if (bk.getPatientID() == patient.getPatientID()) {
                                                                                for (ServiceDTO service : listService) {
                                                                                    if (bk.getServiceID() == service.getServiceID()) {
                                                                                        demm++;
                                                %> 
                                            <div id="f" type="hidden"></div>
                                            <form action="UpdateBookingAdminController">
                                                <tr>
                                                    <td>
                                                        <div
                                                            class="flex justify-center items-center rounded-md w-8 h-8 app-bg-yellow-2 app-color-yellow-1 text-lg font-semibold">
                                                            <%=demm%></div>
                                                    </td>
                                                <input type="hidden" name="BookingDetailID" value="<%=bk.getBookingDetailID()%>">
                                                <td>
                                                    <div class="flex flex-row py-3">
                                                        <div class="flex flex-col">
                                                            <span class="font-semibold text-sm app-color-black"><%=doctor.getFullName()%></span>
                                                        </div>
                                                    </div>
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
                                                    <div
                                                        class="app-bg-red-2 h-8 w-28 font-semibold text-sm flex justify-center items-center app-color-red-1 rounded-md">
                                                        <%=patient.getFullName()%>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="app-bg-red-2 h-8 w-28 font-semibold text-sm flex justify-center items-center app-color-red-1 rounded-md">
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
                    </div>            
















                    <!-- Footer -->

                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="LogoutController">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

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
            <script>
                                                    function handleSubmit(id) {
                                                        if (confirm("Bạn muốn xóa lịch đặt này?")) {
                                                            var form = document.createElement("form");
                                                            form.action = "DeleteBookingDetail";
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

