
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page import="doctors.DoctorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>Admin Page</title>
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
        <!-- Bootstrap CSS -->
        <!-- hiện thị password  -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
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
                        <li class="nav-item "><a href="ShowBookingDoctorController" class="nav-link sa" style="font-weight: bold">Quản lý lịch đặt</a></li>
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
                                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                DoctorDTO doctor = (DoctorDTO) request.getAttribute("DOCTOR_PROFILE");
                            %>
                            <div class="py-2 ml-3">
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <img style="max-width: 340px; height: 250px; display: block; margin-right: auto; margin-left: auto;"
                                             src="<%=doctor.getImage()%>">
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class=" col-md-7">
                                        <label class="text-primary">Họ Tên: </label>
                                        <label class="m-1"><%=doctor.getFullName()%></label>
                                    </div>
                                    <div class="col-md-5">
                                        <label class="text-primary">Giới Tính: </label>
                                        <sel class="m-1"><%=doctor.getGender()%></label>
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">Email: </label>
                                        <label class="m-1"><%=doctor.getGmail()%></label>
                                    </div>

                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">SĐT: </label>
                                        <label class="m-1"><%=doctor.getPhone()%></label>
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">Chuyên Môn: </label>
                                        <label class="m-1"> <%=doctor.getServiceTypeName()%></label>
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class="col-md-12">
                                        <label class="text-primary">Thành Tựu:</label>
                                        <label class="m-1"> <%=doctor.getAchievement()%></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='back'>
                        <div class="wrapper bg-white mt-sm-5 border-success">
                            <form action="UpdateProfileDoctorController" method="POST">
                                <h4 class="pb-4 border-bottom">Cài đặt tài khoản</h4>

                                <div class="py-2">

                                    <div id="dropBox" style="height: 400px;">
                                        <div id="gallery" class="mb-2">
                                            <img id="rendered_image_<%=doctor.getDoctorID()%>" style="max-width: 340px; height: 250px; display: block; margin-right: auto; margin-left: auto;" src="<%=doctor.getImage()%>"/>
                                        </div><br> 
                                        <div>
                                            <input type="file" value="" onchange="return onSelectedImage(this, '<%=doctor.getDoctorID()%>')" />
                                        </div>
                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label class="text-primary">Họ Tên:</label>
                                            <input type="text" class="bg-light form-control" name="fullName" placeholder="Full Name" value="<%=doctor.getFullName()%>">
                                        </div>
                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-6">
                                            <label class="text-primary">Email:</label>
                                            <input type="email" class="bg-light form-control" name="gmail" placeholder="dentacare@gmail.com" value="<%=doctor.getGmail()%>">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="text-primary">SĐT:</label>
                                            <input type="number" class="bg-light form-control" name="phone" placeholder="Phone number" value="0<%=doctor.getPhone()%>">
                                        </div>
                                    </div>
                                    <div>
                                        <label for="serviceTypeName">Chuyên khoa</label>
                                        <select name="serviceTypeName">
                                            <% for (ServiceTypeDTO svTypeDTO : listServiceType) {%>                                
                                            <option value="<%=svTypeDTO.getServiceTypeID()%>"><%=svTypeDTO.getServiceTypeName()%></option> 
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="row py-2">
                                        <div class="col-md-12">
                                            <label  class="text-primary">Mật Khẩu:</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                                                </div>
                                                <input name="password" type="password" value="<%=doctor.getPassword()%>" class="input form-control" id="password" placeholder="password" required="true" aria-label="password" aria-describedby="basic-addon1" />
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
                                                <input name="confirmPassword" type="password" value="<%=doctor.getPassword()%>" class="input form-control" id="confirmPassword" placeholder="password" required="true" aria-label="confirmPassword" aria-describedby="basic-addon1" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text" onclick="confirm_password_show_hide();">
                                                        <i class="fas fa-eye" id="show_eye"></i>
                                                        <i class="fas fa-eye-slash d-none" id="hide_eye"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <input type="hidden" name="doctorID" value="<%=doctor.getDoctorID()%>">
                                    <input type="hidden" name="achievement" placeholder="Achievement" value="<%=doctor.getAchievement()%>">
                                    <input type="hidden" name="gender" placeholder="gender" value="<%=doctor.getGender()%>">
                                    <input type="hidden" id="image_<%=doctor.getDoctorID()%>" name="image" value="">
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
        <script src="js/js/convertImageBase64.js"></script>
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

                                let dropBox = document.getElementById('dropBox');

                                // modify all of the event types needed for the script so that the browser
                                // doesn't open the image in the browser tab (default behavior)
                                ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(evt => {
                                    dropBox.addEventListener(evt, prevDefault, false);
                                });
                                function prevDefault(e) {
                                    e.preventDefault();
                                    e.stopPropagation();
                                }

                                // remove and add the hover class, depending on whether something is being
                                // actively dragged over the box area
                                ['dragenter', 'dragover'].forEach(evt => {
                                    dropBox.addEventListener(evt, hover, false);
                                });
                                ['dragleave', 'drop'].forEach(evt => {
                                    dropBox.addEventListener(evt, unhover, false);
                                });
                                function hover(e) {
                                    dropBox.classList.add('hover');
                                }
                                function unhover(e) {
                                    dropBox.classList.remove('hover');
                                }

                                // the DataTransfer object holds the data being dragged. it's accessible
                                // from the dataTransfer property of drag events. the files property has
                                // a list of all the files being dragged. put it into the filesManager function
                                dropBox.addEventListener('drop', mngDrop, false);
                                function mngDrop(e) {
                                    let dataTrans = e.dataTransfer;
                                    let files = dataTrans.files;
                                    filesManager(files);
                                }

                                // use FormData browser API to create a set of key/value pairs representing
                                // form fields and their values, to send using XMLHttpRequest.send() method.
                                // Uses the same format a form would use with multipart/form-data encoding
                                function upFile(file) {
                                    //only allow images to be dropped
                                    let imageType = /image.*/;
                                    if (file.type.match(imageType)) {
                                        let url = 'HTTP/HTTPS URL TO SEND THE DATA TO';
                                        // create a FormData object
                                        let formData = new FormData();
                                        // add a new value to an existing key inside a FormData object or add the
                                        // key if it doesn't exist. the filesManager function will loop through
                                        // each file and send it here to be added
                                        formData.append('file', file);

                                        // standard file upload fetch setup
                                        fetch(url, {
                                            method: 'put',
                                            body: formData
                                        })
                                                .then(response => response.json())
                                                .then(result => {
                                                    console.log('Success:', result);
                                                })
                                                .catch(error => {
                                                    console.error('Error:', error);
                                                });
                                    } else {
                                        console.error("Only images are allowed!", file);
                                    }
                                }


                                // use the FileReader API to get the image data, create an img element, and add
                                // it to the gallery div. The API is asynchronous so onloadend is used to get the
                                // result of the API function
                                function previewFile(file) {
                                    // only allow images to be dropped
                                    let imageType = /image.*/;
                                    if (file.type.match(imageType)) {
                                        let fReader = new FileReader();
                                        let gallery = document.getElementById('gallery');
                                        // reads the contents of the specified Blob. the result attribute of this
                                        // with hold a data: URL representing the file's data
                                        fReader.readAsDataURL(file);
                                        // handler for the loadend event, triggered when the reading operation is
                                        // completed (whether success or failure)
                                        fReader.onloadend = function () {
                                            let wrap = document.createElement('div');
                                            let img = document.createElement('img');
                                            // set the img src attribute to the file's contents (from read operation)
                                            img.src = fReader.result;
                                            let imgCapt = document.createElement('p');
                                            // the name prop of the file contains the file name, and the size prop
                                            // the file size. convert bytes to KB for the file size
                                            let fSize = (file.size / 1000) + ' KB';
                                            imgCapt.innerHTML = `<span class="fName">${file.name}</span><span class="fSize">${fSize}</span><span class="fType">${file.type}</span>`;
                                            gallery.appendChild(wrap).appendChild(img);
                                            gallery.appendChild(wrap).appendChild(imgCapt);
                                        }
                                    } else {
                                        console.error("Only images are allowed!", file);
                                    }
                                }

                                function filesManager(files) {
                                    // spread the files array from the DataTransfer.files property into a new
                                    // files array here
                                    files = [...files];
                                    // send each element in the array to both the upFile and previewFile
                                    // functions
                                    files.forEach(upFile);
                                    files.forEach(previewFile);
                                }
        </script>
        <script>
            function toastClose() {
                var toast1 = document.getElementById("toast-msg");
                toast1.style.display = "none";
            }
        </script>

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
    </body>
</html>
