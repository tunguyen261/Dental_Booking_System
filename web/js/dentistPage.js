/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

///format date

const formatDate = (xx) => {
    const d = new Date(xx);
    let mm = d.getMonth() + 1; // Months start at 0!
    let dd = d.getDate();
    if (dd < 10)
        dd = "0" + dd;
    if (mm < 10)
        mm = "0" + mm;
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
/// showModal
const showModal = function () {
    if (!this.className.includes("working")) {

        const split = this.className.split(' ');
        const valueDay = days[split[0][4]].innerHTML.slice(0, 10);
        const [day, month, year] = valueDay.split('/');
        const result = [year, month, day].join('-');
        const fullDay = new Date(result);
        var fullDayString = fullDay.toString();
        const dayOfWeek = fullDayString.toUpperCase().slice(0, 3);
        const slot = split[1];
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
        const slotDiv = document.createElement("div");
        const dayDiv = document.createElement("div");
        const dayOfWeekInput = document.createElement("input");
        dayOfWeekInput.type = "hidden";
        dayOfWeekInput.name = "dayOfWeek";
        dayOfWeekInput.value = dayOfWeek;
        form.appendChild(dayOfWeekInput);
        input.id = "dayBookingNext";
        input.type = "hidden"
        input.value = result;
        input.name = "day"
        form.appendChild(input);
        console.log(time);
        dayDiv.id = "ngay-gio";
        dayDiv.innerHTML = "Vào ngày: " + valueDay + " vào lúc: " + time;
        var schedu = document.getElementById('schedule-view');
        schedu.appendChild(dayDiv);
        const slotID = document.createElement("input");
        slotID.id = "slotBookingNext";
        slotID.type = "hidden"
        slotID.value = slot[4]
        slotID.name = "slotID"
        form.appendChild(slotID);
    }
    addGreen1();
};


/// Bác sĩ đăng kí lịch đặt

for (let i = 1; i < 7; i++) {
    for (let k = 1; k < 5; k++) {
        var slot = document.getElementsByClassName(`ngay${i} slot${k}`);
        slot[0].classList.add("register");
        slot[0].innerHTML = "Đăng ký";
        slot[0].onclick = showModal;
    }
}
////Set null cho các slot đã qua trong tuần
if(d==1){
    
}else{
    for (let i=1;i<d+1;i++){
    for (let k = 1; k < 5; k++) {
        var slot = document.getElementsByClassName(`ngay${i} slot${k}`);
        slot[0].classList.remove("register");
        slot[0].style. backgroundColor= '#F0EBE3';
        slot[0].style.borderRadius= '20px';
        slot[0].style.padding= '2px 4px 2px 4px';
        slot[0].style.color='black';
        slot[0].onclick = ()=>{        
        };
    }
}
}

/// Slot đã được đăng ký

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



var days = document.getElementsByClassName("day");
///So sánh ngày nào trong tuần trùng với lịch làm việc của bác sĩ
for (let i = 1; i < scheduleDoctor.length; i++) {
    for (let k = 1; k < days.length; k++) {
        if (days[k].innerHTML.includes(scheduleDoctor[i].day)) {
            scheduleDoctor[i].day = "ngay" + k;
        }
    }
}
///xác định slot nào đã được đặt và thêm class vào <tr>

for (let i = 1; i < scheduleDoctor.length; i++) {
    var work = document.getElementsByClassName(scheduleDoctor[i].day + " slot" + scheduleDoctor[i].slot);
    if (work.length > 0) {
        work[0].classList.add("register-done");
        work[0].style.color='#76BA99';
        work[0].style.backgroundColor="#3F4E4F";
        work[0].innerHTML = "Đã đăng ký";
        work[0].onclick = ()=>{           
        }
    }
}
///Modal

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

                               