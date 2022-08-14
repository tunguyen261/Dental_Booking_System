/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
///format date

const formatDate = (xx) => {
  const d = new Date(xx);
  let mm = d.getMonth() + 1; // Months start at 0!
  let dd = d.getDate();
  if (dd < 10) dd = "0" + dd;
  if (mm < 10) mm = "0" + mm;
  return (m = [dd, mm, d.getFullYear()].join("/"));
};

//// get date and update timetable
var dayOfWeek = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];
var day = new Date();
var tmp = (tpm = day.getTime());
var d = day.getDay();
var listDay = [];
listDay[d] = formatDate(day);
for (let i = 1; i < d; i++) {
  tmp = tmp - 1000 * 60 * 60 * 24;
  listDay[new Date(tmp).getDay()] = formatDate(new Date(tmp));
}
for (let i = d; i < 7; i++) {
  tpm = tpm + 1000 * 60 * 60 * 24;
  listDay[new Date(tpm).getDay()] = formatDate(new Date(tpm));
}

//get <tr> to print data
var trDay = document.getElementById("day");
const collection = trDay.children;
for (let i = 1; i < 7; i++) {
  collection[i].innerHTML = listDay[i];
}
collection[7].innerHTML = listDay[0];

  ////
                             
                                var days = document.getElementsByClassName("day");
                                var listDay = "";
                  

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
                                        var n = {day: m, slot:k,ngay:m};
                                        dayDoctor[a] = n;
                                    }
                             
                                     /// Get schedule of doctor
                                    var dem = document.getElementById("size-schedule").innerHTML;
                                    dem = +dem;
                                    var scheduleDoctor = [];
                                    for (let a = 1; a <= dem; a++) {
                                        var day = "schedule-day" + a;
                                        var slot = "schedule-slot" + a;
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
                                        var n = {day: m, slot:k,ngay:m};
                                        scheduleDoctor[a] = n;
                                    }

                                   
                                    ///So sánh ngày nào trong tuần trùng với lịch làm việc của bác sĩ
                                    for (let i = 1; i < scheduleDoctor.length; i++) {
                                        for (let k = 1; k < days.length; k++) {
                                            if (days[k].innerHTML.includes(scheduleDoctor[i].day)) {
                                                scheduleDoctor[i].day = "ngay" + k;
                                                
                                            }
                                        }
                                    }
                                       
                                     ///So sánh ngày nào trong tuần trùng với lịch đã được booked của bác sĩ
                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        for (let k = 1; k < days.length; k++) {
                                            if (days[k].innerHTML.includes(dayDoctor[i].day)) {
                                                dayDoctor[i].day = "ngay" + k;
 
                                            }
                                        }
                                    }
                                    var doctorID=document.getElementById('doctorID');
                                    console.log(doctorID.innerHTML)
                                 ///Function hủy slot làm việc của bác sĩ    
                                    function cancelSlot (daym,slot){
                                        if(confirm("Bạn có muốn hủy lịch") == true){
                                            var form = document.createElement("form");
                                            form.action="CancelSlotDoctorController";
                                            
                                            const day1 = document.createElement("input");
                                            const slot1 = document.createElement("input");
                                            const drID = document.createElement("input");
                                            //format date
                                            
                                            const [day, month, year] = daym.split('/');
                                            const result = [year, month, day].join('-');
                                            // Day input
                                            day1.setAttribute("type", "text");
                                            day1.type = "hidden"
                                            day1.value = result;
                                            day1.name = "day";
                                           
                                            // slot input
                                            slot1.setAttribute("type", "text");
                                            slot1.type = "hidden"
                                            slot1.value = slot;
                                            slot1.name = "slot";
                                            
                                            // doctor input
                                            drID.setAttribute("type", "text");
                                            drID.type = "hidden"
                                            drID.value = doctorID.innerHTML;
                                            drID.name = "doctorID";
                                            
                                            
                                            form.appendChild(day1);
                                            form.appendChild(slot1);
                                            form.appendChild(drID);
                                            
                                            var body =document.getElementById('f');
                                            body.appendChild(form)
                                            form.submit()
                                        }
                                        
                                    }
                                
                                    
                                    /// Xác định ngày làm việc của bác sĩ theo thứ Đặt work shift vao calender;

                                    for (let i = 1; i < scheduleDoctor.length; i++) {
                                 
                                        var clName=  scheduleDoctor[i].day+ " slot"+ scheduleDoctor[i].slot;
                                       
                                       var ngaylamviec=document.getElementsByClassName(clName);
                                       if(ngaylamviec.length >0){
                                           ngaylamviec[0].classList.add("shift");
                                           ngaylamviec[0].innerHTML = "Đã đăng ký";
                                           ngaylamviec[0].onclick = () =>cancelSlot(scheduleDoctor[i].ngay,scheduleDoctor[i].slot);
                                       }
                                    }

                                    ///xác định slot nào đã được đặt và thêm class vào <tr>

                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        var work = document.getElementsByClassName(dayDoctor[i].day + " slot" + dayDoctor[i].slot);
                                        if(work.length>0){
                                        work[0].classList.add("working");
                                        work[0].innerHTML = "Đã được đặt";
                                        work[0].onclick = ()=>cancelSlot(dayDoctor[i].ngay,dayDoctor[i].slot);
                                    }
                                }
  /// không cho bệnh nhân đặt các lịch đã qua trong tuần  
                                if(d==1){
    
                            }else{
                                for (let i=1;i<d+1;i++){
                                for (let k = 1; k < 5; k++) {
                                    var slot = document.getElementsByClassName(`ngay${i} slot${k}`);
                                    if(slot[0].classList.contains('shift')){
                                         slot[0].classList.remove("shift");
                                    }
                                   
                                    slot[0].style. backgroundColor= '#F0EBE3';
                                    slot[0].style.borderRadius= '20px';
                                    slot[0].style.padding= '2px 4px 2px 4px';
                                    slot[0].style.color='black';
                                    slot[0].innerHTML="X";
                                    slot[0].onclick = ()=>{        
                                    };
                                }
                            }
                            }


