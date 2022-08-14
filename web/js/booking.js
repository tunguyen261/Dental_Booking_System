
function next2(){
    var tt=document.getElementsByClassName("dateTitle");
    tt[0].classList.add("active");
    var cale=document.getElementsByClassName("calendar-tb");
    cale[0].classList.remove("none");
}
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
                                        var n = {day: m, slot: k};
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
                                        var n = {day: m, slot: k};
                                        scheduleDoctor[a] = n;
                                    }
                                     console.log(scheduleDoctor);
                                   
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
                                    
                                    
                                    const showModal = function () {
                                        if (!this.className.includes("working")) {
                                            const split = this.className.split(' ');
                                            const valueDay = days[split[0][4]].innerHTML.slice(0, 10);
                                            const [day, month, year] = valueDay.split('/');
                                            const result = [year, month, day].join('-');
                                            const slot = split[1];;
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
                                    
                                    /// Xác định ngày làm việc của bác sĩ theo thứ Đặt work shift vao calender;

                                    for (let i = 1; i < scheduleDoctor.length; i++) {
                                 
                                        var clName=  scheduleDoctor[i].day+ " slot"+ scheduleDoctor[i].slot;
                                       
                                       var ngaylamviec=document.getElementsByClassName(clName);
                                       if(ngaylamviec.length >0){
                                           ngaylamviec[0].classList.add("shift");
                                           ngaylamviec[0].innerHTML = "Đặt";
                                           ngaylamviec[0].onclick = showModal;
                                       }
                                    }

                                    ///xác định slot nào đã được đặt và thêm class vào <tr>

                                    for (let i = 1; i < dayDoctor.length; i++) {
                                        var work = document.getElementsByClassName(dayDoctor[i].day + " slot" + dayDoctor[i].slot);
                                        if(work.length>0){
                                        work[0].classList.add("working");
                                        work[0].innerHTML = "Đã được đặt";
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
                                function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";
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
                                
                                
