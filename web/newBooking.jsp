<%-- 
    Document   : newBooking
    Created on : Jun 26, 2022, 10:31:23 AM
    Author     : Doan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="booking.BookingDTO"%>
<%@page import="patients.PatientDTO"%>
<%@page import="discounts.DiscountDTO"%>
<%@page import="bookingdetail.BookingDetailDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>Booking Page</title>
        <link rel="stylesheet" href="css/booking.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="css/booking.css">
        <meta name="viewport" content="width=device-width">  
    </head>
    <body style="background-color: #DFF6FF">
        <%
                               PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
                               List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) session.getAttribute("LIST_SERVICE_TYPE");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="HomeController">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="HomeController" class="nav-link sa">Trang chủ</a></li>
                        <li class="nav-item"><a href="ShowBookingPatientController" class="nav-link sa">Lịch sử lịch đặt</a></li>
                        <li class="nav-item dropdown"><a href="LogoutController" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=loginPatient.getFullName()%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="ShowProfileAccountController" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                        <li class="nav-item active cta"><a href="ShowBookingController" class="nav-link" ><span>Đặt lịch khám</span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <div>
            <div class="card-body " style="">
                <%
   
                    List<doctors.DoctorDTO> listDoctor = (List<DoctorDTO>) session.getAttribute("LIST_DOCTOR");
                    List<ServiceDTO> listService = (List<ServiceDTO>) session.getAttribute("LIST_SERVICE_BY_SVTYPE");
                    DoctorDTO doctorBk = (DoctorDTO) request.getAttribute("doctorBk");
                    ServiceDTO serviceBk = (ServiceDTO) request.getAttribute("serviceBk");
                    DiscountDTO discount = (DiscountDTO) request.getAttribute("discount");
                    scheduleDTO check = (scheduleDTO) request.getAttribute("add_green");

                %>

                <div class="container-fluid">
                    <div class="progress-bar1">
                        <ul class="progressbar1">
                            <li class="active serviceTitle">Chọn Loại Dịch Vụ</li>
                            <li class="doctorTitle <%=(listService != null) ? "active" : ""%>">Chọn Nha Sĩ</li>
                            <li class="dateTitle <%=(doctorBk != null || check != null) ? "active" : ""%>" >Chọn Ngày& Giờ</li>
                            <li class="comfirmTitle <%=(check != null) ? "active" : ""%>">Đặt lịch</li>
                            <li class="checkoutTitle <%=(check != null) ? "active" : ""%>">Hoàn Thành Đặt Lịch</li>
                        </ul>

                    </div>

                    <!<!-- Toast thông báo đặt lịch thành công -->

                    <%
                        String msg = (String) request.getAttribute("SUCCESS_ADD_BOOKING");
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

                    <div class="container">

                        <div  style="padding-top:20px">
                            <div class="booking-service" style="padding-bottom: 80px; ">
                                <div class="btn-group dropright">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Chọn Loại Dịch Vụ</button>
                                    <div class="dropdown-menu" >
                                        <%
                                            if (listServiceType != null) {
                                                for (ServiceTypeDTO svType : listServiceType) {
                                        %>
                                        <a class="dropdown-item" href="SearchService_BookingController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>

                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <%
                            if (listService != null) {

                        %>  
                        <%       List<scheduleDTO> listBookingDetail = (List<scheduleDTO>) request.getAttribute("listBookingDetail");

                        %>
                        <form action="HandleServiceDoctorController">
                            <label style="display: block;text-align: center; padding-bottom: 20px" class="text-primary"><strong>CHỌN BÁC SĨ VÀ DỊCH VỤ</strong></label>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="serviceDoctor" >

                                        <%                  String svTypeid = String.valueOf(listService.get(0).getServiceTypeID());


                                        %>

                                        <div class="doctor" style="padding-right: 50px;">
                                            <table class="table table-bordered fl-table" >
                                                <thead>
                                                    <tr>
                                                        <th>BÁC SĨ</th>
                                                        <th>ĐẶT LỊCH</th>
                                                    </tr>
                                                </thead>

                                                <%                int count = 0;
                                                    for (DoctorDTO doctor1 : listDoctor) {
                                                        if (doctor1.getServiceTypeName().equals(svTypeid)) {
                                                            count++;
                                                %>
                                                <tbody>
                                                    <tr>
                                                        <td><strong><%=doctor1.getFullName()%></strong></td>                             
                                                                   <td><input type="radio" name="doctorID" <% if (doctorBk != null && doctor1.getDoctorID() == doctorBk.getDoctorID()) {%>checked<%} else {
                                                                       if (count == 1) {%> checked <%}
                                                                                      }%>    value="<%=doctor1.getDoctorID()%>"> </td>                     
                                                    </tr>
                                                </tbody>
                                                <%
                                                        } else {
                                                        }
                                                    }
                                                %>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="service <%=(listService == null) ? "none" : ""%>" style="padding-right: 50px;">
                                        <table class="table table-bordered fl-table">
                                            <thead>
                                                <tr>
                                                    <th>DỊCH VỤ</th>
                                                    <th>GIÁ</th>
                                                    <th>CHỌN</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% int demm = 0;
                                                    for (ServiceDTO sv : listService) {
                                                        demm++;%>
                                                <tr>
                                                    <td><strong><%=sv.getServiceName()%></strong></td>   
                                                    <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                                    <td><%=formatter.format(sv.getServicePrice())%><span> VND</span></td>
                                                               <td><input type="radio" name="svID" <%if (serviceBk != null && sv.getServiceID() == serviceBk.getServiceID()) {%>checked<%} else {
                                                                   if (demm == 1) {%> checked <%}
                                                                                  }%> value="<%=sv.getServiceID()%>"> </td>                     
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <input class="btn btn-success showCalender" style="display: block;margin-left: auto;margin-right: auto;  " type="submit" value="Xem lịch của bác sĩ">

                        </form>
                        <%if (doctorBk != null) {%>        
                        <div class="calendar-tb <%=(listBookingDetail != null) ? "" : "none"%>" style="padding-top: 50px">
                            <div>
                                <div class="day-time">
                                    <div class="titleday">
                                        <label for="dateDetail" style="display: block;text-align: center; padding-bottom: 20px"class="text-primary"><strong>Chọn Ngày Giờ Khám</strong></label>
                                    </div>
                                </div>                 
                            </div>


                            <!<!-- Get booked of doctor // to take booked slot  by scheduleID -->
                            <div class="combo-booked none " >
                                <%

                                    int lam = 0;
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
                            <%List<scheduleDTO> listScheduleDTO = (List<scheduleDTO>) request.getAttribute("listScheduleDTO");%>
                            <!-- Get schedule of doctor -->
                            <div class="schedule-doctor none">
                                <%
                                    int dem = 0;
                                    for (scheduleDTO schedule : listScheduleDTO) {
                                        dem++;
                                %>
                                <div id="schedule-day<%=dem%>"><%=schedule.getDay()%> </div>       
                                <div id="schedule-slot<%=dem%>"><%=schedule.getSlot()%> </div>     
                                <%
                                    }
                                %>

                                <div id="size-schedule"><%=dem%></div>
                            </div>
                            <!<!-- Schedule of next week of doctor  -->

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


                        </div>

                        <%
                                }
                            } else {
                            }%>
                    </div>
                    <div style="padding: 45px">
                        <a class="btn btn-primary" style="display: block;margin-left: auto;margin-right: auto;width: 200px" href="HomeController">Quay Lại Trang Chủ</a>
                    </div>

                    <%if (doctorBk != null && serviceBk != null) {
                    %>

                    <div id="myModal" class="modal">
                        <div class="modal-dialog " role="document">
                            <!-- Modal content -->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Thông tin lịch khám</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="SubmitBooking" id="form-submit">
                                    <div class="modal-body">
                                        <p>THÔNG TIN DỊCH VỤ SẼ ĐẶT</p>
                                        <div class="doctor-booking">
                                            <label for="doctor">Bác sĩ: </label>
                                            <%=doctorBk.getFullName()%>
                                            <input name="doctorID" type ="hidden" value="<%=doctorBk.getDoctorID()%>" readonly> 
                                            <input name="doctorName" type ="hidden" value="<%=doctorBk.getFullName()%>" readonly> 
                                        </div>
                                        <div class="service-booking"> 
                                            <label for ="sv">Dịch vụ: </label>
                                            <%=serviceBk.getServiceName()%>
                                            <input name="serviceID" type="hidden" value="<%=serviceBk.getServiceID()%>"></br>
                                            <input name="serviceName" type="hidden" value="<%=serviceBk.getServiceName()%>"></br>
                                            <%if (discount != null) {%>
                                            <label for="discount">Hiện đang có chương trình giảm giá: </label>
                                            <input name="discount" type="hidden" value="<%=discount.getDiscountID()%>">
                                            <%=discount.getDescription()%>
                                            <%}%>
                                            </br>
                                            <input name="expectedFee" readonly type="hidden" value="<%=serviceBk.getServicePrice() - (serviceBk.getServicePrice() * discount.getPercentDiscount()) / 100%>">
                                            <label for="gia tien">Mức phí dự định: </label>
                                            <%=serviceBk.getServicePrice() - (serviceBk.getServicePrice() * discount.getPercentDiscount()) / 100%><span> VND</span>
                                            <input type="hidden" name="patientID" value="<%=loginPatient.getPatientID()%>">
                                        </div>
                                    </div>  
                                    <div class="modal-footer">
                                        <input class="btn btn-primary" type="submit" value="Đăng kí đặt lịch" onclick="">
                                        <input class="btn btn-danger" type="button" value="Hủy" onclick="cancel()">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <%
                        }


                    %>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="js/booking.js"></script>
        <script>
             function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";
                                }
        </script>

    </body>
</html>
