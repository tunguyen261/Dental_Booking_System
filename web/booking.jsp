<%-- 
    Document   : Booking.jsp
    Created on : Jun 14, 2022, 10:40:54 PM
    Author     : Doan
--%>

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
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <meta charset="utf-8">
        <title>Booking Page</title>
        <link rel="stylesheet" href="css/booking.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <meta name="viewport" content="width=device-width">  
    </head>
    <body>
        <%
            List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) session.getAttribute("LIST_SERVICE_TYPE");
            List<ServiceDTO> listService = (List<ServiceDTO>) session.getAttribute("LIST_SERVICE_BY_SVTYPE");
            List<doctors.DoctorDTO> listDoctor = (List<DoctorDTO>) session.getAttribute("LIST_DOCTOR");
            DoctorDTO doctorBk = (DoctorDTO) session.getAttribute("doctorBk");
            ServiceDTO serviceBk = (ServiceDTO) session.getAttribute("serviceBk");
            DiscountDTO discount = (DiscountDTO) session.getAttribute("discount");
            PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            BookingDTO check = (BookingDTO) request.getAttribute("add-green");
        %>

        <div class="container-fluid">
            <div class="progress-bar1">
                <ul class="progressbar1">
                    <li class="active serviceTitle">Chọn Loại Dịch Vụ</li>
                    <li class="doctorTitle <%=(listService != null) ? "active" : ""%>">Chọn Nha Sĩ</li>
                    <li class="dateTitle <%=(doctorBk != null) ? "active" : ""%>" >Chọn Ngày& Giờ</li>
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
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Chon loại dich vu</button>
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
                <%       List<BookingDetailDTO> listBookingDetail = (List<BookingDetailDTO>) session.getAttribute("listBookingDetail");

                %>
                <form action="HandleServiceDoctorController">
                    <label style="padding-right: 20px"><strong>Chọn Bác Sĩ & Dịch Vụ</strong></label>
                    <div class="row">

                        <div class="col-md-6">
                            <div class="serviceDoctor" >

                                <%                  String svTypeid = String.valueOf(listService.get(0).getServiceTypeID());


                                %>

                                <div class="doctor" style="padding-right: 50px;">
                                    <table class="table table-bordered fl-table">
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
                                                <td><%=doctor1.getFullName()%></td>                             
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
                                            <td><%=sv.getServiceName()%></td>    
                                            <td><%=sv.getServicePrice()%></td>
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
                    <input class="btn btn-success showCalender" style="display: block;margin-left: auto;margin-right: auto;" type="submit" value="Xem lịch của bác sĩ">

                </form>
                <%if (doctorBk != null) {%>        
                <div class="calendar-tb <%=(listBookingDetail != null) ? "" : "none"%>" style="padding-top: 50px">
                    <div>
                        <div class="day-time">
                            <div class="day">
                                <label for="dateDetail"><strong>Chon Ngày & Giờ</strong></label>
                            </div>
                        </div>
                            <div class="dateTitle<%=doctorBk.getWorkDayID()%>"> <%int wkDay = doctorBk.getWorkDayID();
                            if (wkDay == 1) {%>Bác Sĩ <%=doctorBk.getFullName()%> làm việc vào thứ 2, 4, 6 <%} else {%>Bác Sĩ <%=doctorBk.getFullName()%> làm việc vào thứ 3, 5, 7 <%}%>
                        </div>
                    </div>


                    <!<!-- Get booked of doctor // to take booked slot   -->
                    <div class="combo-booked none" >
                        <%

                            int lam = 0;
                            for (BookingDetailDTO BookingDetail : listBookingDetail) {
                                lam++;
                                int slotBooked = BookingDetail.getSlotID();
                                String wkBookedDay = BookingDetail.getDateBooking();
                        %>


                        <div id="booked-slot<%=lam%>"><%=slotBooked%></div> 
                        <div id="booked-day<%=lam%>"><%=wkBookedDay%></div>    

                        <%
                            }
                        %>
                        <div id="size-booked"><%=lam%></div>
                    </div> 
                    <!<!-- Schedule of next week of doctor  -->
                    <div>
                        <div class="table-wrapper">
                            <table class="fl-table table">
                                <thead>
                                    <tr >
                                        <th></th>
                                            <%

                                                Date d = new Date();
                                                long tmp = d.getTime();
                                                SimpleDateFormat formatter = new SimpleDateFormat("E, dd/MM/yyyy");

                                                for (int i = 0; i < 7; i++) {
                                                    tmp = tmp + 1000 * 60 * 60 * 24;
                                            %>
                                        <th class="day"><%=formatter.format(new Date(tmp))%></th>
                                            <%
                                                }
                                            %>
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

                </div>

                <%
                        }
                    } else {
                    }%>
            </div>
            <div style="padding-bottom: 50px">
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
                            </div>
                            <div class="service-booking"> 
                                <label for ="sv">Dịch vụ: </label>
                                <%=serviceBk.getServiceName()%>
                                <input name="serviceID" type="hidden" value="<%=serviceBk.getServiceID()%>"></br>
                                <%if (discount != null) {%>
                                <label for="discount">Hiện đang có chương trình giảm giá: </label>
                                <input name="discount" type="hidden" value="<%=discount.getDiscountID()%>">
                                <%=discount.getTitle()%>
                                <%}%>
                                </br>
                                <input name="expectedFee" readonly type="hidden" value="<%=serviceBk.getServicePrice()-(serviceBk.getServicePrice() * discount.getPercentDiscount())/100%>">
                                <label for="gia tien">Mức phí dự định: </label>
                                <%=serviceBk.getServicePrice()-(serviceBk.getServicePrice() * discount.getPercentDiscount())/100%>
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
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            <script src="js/booking.js"></script>
            <script type="text/javascript">

                                function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";
                                }

                                ////
                                var dateTitle1 = document.getElementsByClassName("dateTitle1");
                                var dateTitle2 = document.getElementsByClassName("dateTitle2");
                                var days = document.getElementsByClassName("day");
                                var listDay = "";

                                //// Bac si lam thu 2, 4, 6


                                if (dateTitle1[0]) {

                                    /// Get day & slot booked 
                                    var size = document.getElementById("size-booked").innerHTML;
                                    size = +size;
                                    var dayDoctor = [];
                                    for (let a = 1; a <= size; a++) {
                                        var day = "booked-day" + a;
                                        var slot = "booked-slot" + a;
                                        var xx = document.getElementById(day);
                                        var yy = document.getElementById(slot);
                                        const d = new Date(xx.innerHTML);
                                        let mm = d.getMonth() + 1; // Months start at 0!
                                        let dd = d.getDate();
                                        if (dd < 10)
                                            dd = '0' + dd;
                                        if (mm < 10)
                                            mm = '0' + mm;

                                        var m = [dd, mm, d.getFullYear()].join('/');
                                        var k = yy.innerHTML;
                                        //tao object gom ngay` va slot da duoc booked
                                        var n = {day: m, slot: k};
                                        dayDoctor[a] = n;
                                    }


                                    ///So sánh ngày nào trong tuần trùng với lịch đã được booked của bác sĩ
                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        for (let k = 1; k < days.length; k++) {
                                            if (days[k].innerHTML.includes(dayDoctor[i].day)) {
                                                dayDoctor[i].day = "ngay" + k;
                                            }

                                        }
                                    }

                                    /// Xác định ngày làm việc của bác sĩ theo thứ

                                    for (let i = 0; i < days.length; i++) {
                                        if (days[i].innerHTML.includes("Mon") || days[i].innerHTML.includes("Wed") || days[i].innerHTML.includes("Fri")) {
                                            listDay = listDay + i;
                                        }
                                    }
                                    var size = document.getElementById("size-booked").innerHTML;
                                    console.log(size);
                                    listDay.trim();
                                    var da1 = listDay.slice(0, 1);
                                    var da2 = listDay.slice(1, 2);
                                    var da3 = listDay.slice(2, 3);
                                    var d1 = "ngay" + da1;
                                    var d2 = "ngay" + da2;
                                    var d3 = "ngay" + da3;
                                    var ngay1 = document.getElementsByClassName(d1);
                                    var ngay2 = document.getElementsByClassName(d2);
                                    var ngay3 = document.getElementsByClassName(d3);
                                    for (let i = 0; i < 4; i++) {
                                        ngay1[i].classList.add("shift");
                                        ngay2[i].classList.add("shift");
                                        ngay3[i].classList.add("shift");
                                        ngay1[i].innerHTML = "Đặt";
                                        ngay2[i].innerHTML = "Đặt";
                                        ngay3[i].innerHTML = "Đặt";
                                    }


                                    ///Đặt work shift vao calender;


                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        var work = document.getElementsByClassName(dayDoctor[i].day + " slot" + dayDoctor[i].slot);
                                        work[0].classList.add("working");
                                        work[0].innerHTML = "Đã được đặt";
                                    }


                                    const showModal = function () {
                                        if (!this.className.includes("working")) {

                                            const split = this.className.split(' ');

                                            const valueDay = days[split[0][4]].innerHTML.slice(5, 15);
                                            console.log(valueDay);
                                            const [day, month, year] = valueDay.split('/');
                                            const result = [year, month, day].join('-');
                                            console.log(result);
                                            const slot = split[1];
                                            console.log(slot);
                                            let time = "";
                                            switch (slot) {
                                                case 'slot1':
                                                    time = "7:00 - 9:00 am";
                                                    break;
                                                case 'slot2':
                                                    time = "9:00 - 11:00 am";
                                                    break;
                                                case 'slot3':
                                                    time = "13:00 - 15:00 pm";
                                                    break;
                                                case 'slot4':
                                                    time = "15:00 - 17:00 pm";
                                                    break;
                                            }
                                            modal.style.display = "block";
                                            var form = document.getElementById('form-submit');
                                            const input = document.createElement("input");
                                            input.id = "dayBookingNext";
                                            input.type = "hidden"
                                            input.value = result
                                            input.name = "dateBooking"
                                            form.appendChild(input);
                                            console.log(time)
                                            const dayDiv = document.createElement("div");
                                            dayDiv.id = "ngay-gio";
                                            dayDiv.innerHTML = "Vào ngày: " + valueDay + " vào lúc: " + time;
                                            var serbooking = document.getElementsByClassName('service-booking');
                                            serbooking[0].appendChild(dayDiv)
                                            const slotID = document.createElement("input");
                                            slotID.id = "slotBookingNext";
                                            slotID.type = "hidden"
                                            slotID.value = slot[4]
                                            slotID.name = "slotID"
                                            form.appendChild(slotID);

                                        }
                                        addGreen1();
                                    };
                                    for (let i = 0; i < 4; i++) {
                                        ngay1[i].classList.add("shift");
                                        ngay2[i].classList.add("shift");
                                        ngay3[i].classList.add("shift");
                                        ngay1[i].innerHTML = "Đặt";
                                        ngay2[i].innerHTML = "Đặt";
                                        ngay3[i].innerHTML = "Đặt";
                                        ngay1[i].onclick = showModal;
                                        ngay2[i].onclick = showModal;
                                        ngay3[i].onclick = showModal;
                                    }


                                    ///Đặt work shift vao calender;


                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        var work = document.getElementsByClassName(dayDoctor[i].day + " slot" + dayDoctor[i].slot);
                                        work[0].classList.add("working");
                                        work[0].innerHTML = "Đã được đặt";
                                    }

                                }
                                ;
                                //// Bac si lam thu 3, 5, 7
                                if (dateTitle2[0]) {

                                    /// Get day & slot booked 
                                    var size = document.getElementById("size-booked").innerHTML;
                                    size = +size;
                                    var dayDoctor = [];
                                    for (let a = 1; a <= size; a++) {
                                        var day = "booked-day" + a;
                                        var slot = "booked-slot" + a;
                                        var xx = document.getElementById(day);
                                        var yy = document.getElementById(slot);
                                        const d = new Date(xx.innerHTML);
                                        let mm = d.getMonth() + 1; // Months start at 0!
                                        let dd = d.getDate();
                                        if (dd < 10)
                                            dd = '0' + dd;
                                        if (mm < 10)
                                            mm = '0' + mm;

                                        var m = [dd, mm, d.getFullYear()].join('/');
                                        var k = yy.innerHTML;
                                        //tao object gom ngay` va slot da duoc booked
                                        var n = {day: m, slot: k};
                                        dayDoctor[a] = n;
                                    }

                                    ///So sánh ngày nào trong tuần trùng với lịch đã được booked của bác sĩ
                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        for (let k = 1; k < days.length; k++) {
                                            if (days[k].innerHTML.includes(dayDoctor[i].day)) {
                                                dayDoctor[i].day = "ngay" + k;
                                            }

                                        }
                                    }



                                    /// Xác định ngày làm việc của bác sĩ theo thứ
                                    for (let i = 0; i < days.length; i++) {
                                        if (days[i].innerHTML.includes("Tue") || days[i].innerHTML.includes("Thu") || days[i].innerHTML.includes("Sat")) {
                                            listDay = listDay + i;
                                        }
                                    }

                                    listDay.trim();
                                    var da1 = listDay.slice(0, 1);
                                    var da2 = listDay.slice(1, 2);
                                    var da3 = listDay.slice(2, 3);
                                    var d1 = "ngay" + da1;
                                    var d2 = "ngay" + da2;
                                    var d3 = "ngay" + da3;
                                    var ngay1 = document.getElementsByClassName(d1);
                                    var ngay2 = document.getElementsByClassName(d2);
                                    var ngay3 = document.getElementsByClassName(d3);
                                    const showModal = function () {
                                        if (!this.className.includes("working")) {

                                            const split = this.className.split(' ');

                                            const valueDay = days[split[0][4]].innerHTML.slice(5, 15);
                                            console.log(valueDay);
                                            const [day, month, year] = valueDay.split('/');
                                            const result = [year, month, day].join('-');
                                            console.log(result);
                                            const slot = split[1];
                                            console.log(slot);
                                            let time = "";
                                            switch (slot) {
                                                case 'slot1':
                                                    time = "7:00 - 9:00 am";
                                                    break;
                                                case 'slot2':
                                                    time = "9:00 - 11:00 am";
                                                    break;
                                                case 'slot3':
                                                    time = "13:00 - 15:00 pm";
                                                    break;
                                                case 'slot4':
                                                    time = "15:00 - 17:00 pm";
                                                    break;
                                            }
                                            modal.style.display = "block";
                                            var form = document.getElementById('form-submit');
                                            const input = document.createElement("input");
                                            input.id = "dayBookingNext";
                                            input.type = "hidden"
                                            input.value = result
                                            input.name = "dateBooking"
                                            form.appendChild(input);
                                            console.log(time)
                                            const dayDiv = document.createElement("div");
                                            dayDiv.id = "ngay-gio";
                                            dayDiv.innerHTML = "Vào ngày: " + valueDay + " vào lúc: " + time;
                                            var serbooking = document.getElementsByClassName('service-booking');
                                            serbooking[0].appendChild(dayDiv)
                                            const slotID = document.createElement("input");
                                            slotID.id = "slotBookingNext";
                                            slotID.type = "hidden"
                                            slotID.value = slot[4]
                                            slotID.name = "slotID"
                                            form.appendChild(slotID);
                                        }
                                        addGreen1();
                                    };
                                    for (let i = 0; i < 4; i++) {
                                        ngay1[i].classList.add("shift");
                                        ngay2[i].classList.add("shift");
                                        ngay3[i].classList.add("shift");
                                        ngay1[i].innerHTML = "Đặt";
                                        ngay2[i].innerHTML = "Đặt";
                                        ngay3[i].innerHTML = "Đặt";
                                        ngay1[i].onclick = showModal;
                                        ngay2[i].onclick = showModal;
                                        ngay3[i].onclick = showModal;
                                    }


                                    ///Đặt work shift vao calender;


                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        var work = document.getElementsByClassName(dayDoctor[i].day + " slot" + dayDoctor[i].slot);
                                        work[0].classList.add("working");
                                        work[0].innerHTML = "Đã được đặt";
                                    }
                                }



                                // Get the modal
                                var modal = document.getElementById("myModal");

                                // Get the button that opens the modal
                                var btn = document.getElementById("myBtn");

                                // Get the <span> element that closes the modal
                                var span = document.getElementsByClassName("close")[0];

                                // When the user clicks the button, open the modal 
                                if (btn != null) {
                                    btn.onclick = function () {
                                        modal.style.display = "block";
                                    }
                                }
                                ;

                                const addGreen1 = () => {
                                    const dl = document.getElementsByClassName("comfirmTitle")[0];
                                    dl.classList.add('active');
                                }

                                const addGreen2 = () => {
                                    const dl = document.getElementsByClassName("checkoutTitle")[0];
                                    dl.classList.add('active');
                                }

                                const cancel = () => {
                                    modal.style.display = "none";
                                    const element = document.getElementById("ngay-gio");
                                    element.remove();

                                    const element2 = document.getElementById("dayBookingNext");
                                    element2.remove();
                                    const element3 = document.getElementById("slotBookingNext");
                                    element3.remove();
                                    const dl = document.getElementsByClassName("comfirmTitle")[0];
                                    dl.classList.remove('active');
                                }

                                // When the user clicks on <span> (x), close the modal
                                span.onclick = function () {
                                    modal.style.display = "none";
                                    const element = document.getElementById("ngay-gio");
                                    element.remove();
                                    const element2 = document.getElementById("dayBookingNext");
                                    element2.remove();
                                    const element3 = document.getElementById("slotBookingNext");
                                    element3.remove();
                                    const dl = document.getElementsByClassName("comfirmTitle")[0];
                                    dl.classList.remove('active');
                                };

                                // When the user clicks anywhere outside of the modal, close it
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                        const element = document.getElementById("ngay-gio");
                                    element.remove();
                                    const element2 = document.getElementById("dayBookingNext");
                                    element2.remove();
                                    const element3 = document.getElementById("slotBookingNext");
                                    element3.remove();
                                    const dl = document.getElementsByClassName("comfirmTitle")[0];
                                    dl.classList.remove('active');
                                    }
                                    ;
                                };
            </script>

    </body>
</html>