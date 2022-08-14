<%-- 
    Document   : DB_DoctorDetail
    Created on : Jun 30, 2022, 3:11:04 PM
    Author     : Doan
--%>

<%@page import="schedule.scheduleDTO"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="admins.AdminDTO"%>
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
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/DB_DoctorDetail.css" rel="stylesheet">
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
                            <h6 class="collapse-header">Các Loại Dịch Vụ</h6>
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
                        <i class="fas fa-fw fa-user-doctor"></i>
                        <span>Bác Sĩ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowPatientController">
                        <i class="fas fa-fw fa-bed-pulse"></i>
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
                <li class="nav-item">
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

                    <!<!-- Toast thông báo hủy lịch thành công -->

        <%
            String msg = (String) request.getAttribute("SUCCESS_CANCEL");
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
                    <!-- Begin Page Content -->
                    <%DoctorDTO doctor = (DoctorDTO) request.getAttribute("DOCTOR_INFOR");%>
                    <div class="row ">
                        <form action="UpdateDoctor_Admin" class="col-12"> 
                            <div class="col-md-6 text-center float-md-left">
                                <div class="text-align-center">
                                    <img style="height:250px;width: 250px; object-fit: contain" src="<%=doctor.getImage()%>" alt=""/>
                                </div>
                                <div class="">
                                    <%=doctor.getFullName()%>
                                </div>
                                <div type="hidden" class="a" id="doctorID"><%=doctor.getDoctorID()%></div>

                                <div class="">
                                    <%=doctor.getServiceTypeName()%>
                                </div>
                                <select id="status" name="status" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                    <option selected value="<%=doctor.getStatus()%>"><%if (doctor.getStatus() == 1) {%>Đang làm việc<%} else {%>Đã nghỉ việc<%}%></option>
                                    <option value="<%=Math.abs(doctor.getStatus() - 1)%>"><%if (doctor.getStatus() == 1) {%>Đã nghỉ việc<%} else {%>Đang làm việc<%}%></option>
                                </select>
                            </div>
                            <input type="hidden" name="doctorID" value="<%=doctor.getDoctorID()%>">
                            <input type="hidden" name="serviceTypeName" value="<%=doctor.getServiceTypeName()%>">
                            <input type="hidden" name="fullName" value="<%=doctor.getFullName()%>">
                            <input type="hidden" name="gmail" value="<%=doctor.getGmail()%>">
                            <input type="hidden" name="image" value="<%=doctor.getImage()%>">
                            <input type="hidden" name="gender" value="<%=doctor.getGender()%>">
                            <div class="col-md-6 float-md-right">
                                <div class="p-2" >
                                    <label>Thành Tựu :</label>
                                    <textarea class="form-control" name="achievement" cols="6" rows="6" id="description"> <%=doctor.getAchievement()%></textarea>
                                </div>
                                <input type="submit" value="Chỉnh sửa">
                            </div>
                        </form>
                    </div>
                    <div class="text-center" style="margin-top: 15px"><a style="color: orange" href="ScheduleDoctorMonthBeforeController?doctorID=<%=doctor.getDoctorID()%>">Lịch làm việc tháng trước của bác sĩ <%=doctor.getFullName()%></a></div>
                    <div class="text-center" style="margin-top: 15px"><a style="color: orange" href="ScheduleDoctorMonthCurrentController?doctorID=<%=doctor.getDoctorID()%>">Lịch làm việc tháng này của bác sĩ <%=doctor.getFullName()%></a></div>
                    <div class="text-center" style="margin-top: 15px">Lịch làm việc của bác sĩ</div>
                    <!-- Hien lich cua bac si -->


                    <%List<scheduleDTO> listScheduleDTO = (List<scheduleDTO>) request.getAttribute("listScheduleDTO");%>
                    <!-- Get schedule of doctor -->
                    <div class="schedule-doctor none">
                        <%
                            int dem = 0;
                            for (scheduleDTO schedule : listScheduleDTO) {
                                if (schedule.getStatus() == 1) {
                                    dem++;
                        %>
                        <div id="schedule-day<%=dem%>"><%=schedule.getDay()%></div>       
                        <div id="schedule-slot<%=dem%>"><%=schedule.getSlot()%></div>     
                        <%
                                }
                            }
                        %>

                        <div id="size-schedule"><%=dem%></div>
                    </div>

                    <%       List<scheduleDTO> listBookingDetail = (List<scheduleDTO>) request.getAttribute("listBookingDetail");

                    %>
                    <div class="combo-booked none " >
                        <%                            int lam = 0;
                            for (scheduleDTO BookingDetail : listBookingDetail) {
                                lam++;
                        %>

                        <div id="booked-day<%=lam%>"><%=BookingDetail.getDay()%></div>    
                        <div id="booked-slot<%=lam%>"><%=BookingDetail.getSlot()%></div>    
                        <%
                            }
                        %>
                        <div id="size-booked"><%=lam%></div>
                    </div> 

                    <!-- Modal -->
                    <div id="f"></div>
                    <div class="table-wrapper">
                        <table class="fl-table table">
                            <thead>
                                <tr >
                                    <th></th>
                                    <th>MON</th>
                                    <th>TUE</th>
                                    <th>WED</th>
                                    <th>THU</th>
                                    <th>FRI</th>
                                    <th>SAT</th>
                                    <th>SUN</th>
                                </tr>
                                <tr id="day" >
                                    <th class="day"></th>
                                    <th class="day"></th>
                                    <th class="day"></th>
                                    <th class="day"></th>
                                    <th class="day"></th>
                                    <th class="day"></th>
                                    <th class="day"></th>
                                    <th class="day"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        7:00 - 9:00 am
                                    </td>
                                    <td class="ngay1 slot1" ></td>
                                    <td class="ngay2 slot1"></td>
                                    <td class="ngay3 slot1" ></td>
                                    <td class="ngay4 slot1"></td>
                                    <td class="ngay5 slot1"></td>
                                    <td class="ngay6 slot1"></td>
                                    <td class="ngay7 slot1"></td>
                                </tr>
                                <tr>
                                    <td>
                                        9:00 - 11:00 am
                                    </td>
                                    <td class="ngay1 slot2" ></td>
                                    <td class="ngay2 slot2"></td>
                                    <td class="ngay3 slot2" ></td>
                                    <td class="ngay4 slot2"></td>
                                    <td class="ngay5 slot2"></td>
                                    <td class="ngay6 slot2"></td>
                                    <td class="ngay7 slot2"></td>
                                </tr>
                                <tr >
                                    <td>
                                        13:00 - 15:00 am
                                    </td>
                                    <td class="ngay1 slot3" ></td>
                                    <td class="ngay2 slot3"></td>
                                    <td class="ngay3 slot3"></td>
                                    <td class="ngay4 slot3"></td>
                                    <td class="ngay5 slot3"></td>
                                    <td class="ngay6 slot3"></td>
                                    <td class="ngay7 slot3"></td>
                                </tr>
                                <tr >
                                    <td>
                                        15:00 - 17:00 am
                                    </td>
                                    <td class="ngay1 slot4"></td>
                                    <td class="ngay2 slot4"></td>
                                    <td class="ngay3 slot4" ></td>
                                    <td class="ngay4 slot4"></td>
                                    <td class="ngay5 slot4"></td>
                                    <td class="ngay6 slot4"></td>
                                    <td class="ngay7 slot4"></td>
                                </tr>                                      
                            </tbody>
                        </table>
                    </div>


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


            <script src="ckeditor/ckeditor.js"></script>
            <script>
                var editor = CKEDITOR.replace('achievement');
                CKFinder.setupCKEditor(editor, 'ckfinder/');
                data["achievement"] = editor.getData();
            </script>    
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
            <script src="js/DB_DoctorDetail.js"></script>
            <script>
                 function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";
                                }
            </script>
    </body>

</html>

