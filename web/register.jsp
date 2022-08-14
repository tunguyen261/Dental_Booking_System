<%@page import="patients.PatientError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>DentaCare</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- <link rel="stylesheet" href="css/all.min.css"> -->
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="css/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="css/adminlte.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body class="hold-transition register-page" style="background-color: #47B5FF;">
        <div class="register-box">
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <a href="HomeController" class="h1"><b>DENTA</b>CARE</a>
                </div>
                <div class="card-body">
                    <p class="login-box-msg Bold">ĐĂNG KÍ TÀI KHOẢN</p>
                    <%
                        PatientError patientError = (PatientError) request.getAttribute("PATIENT_ERROR");
                        if (patientError == null) {
                            patientError = new PatientError();
                        }
                    %>
                    <form action="RegisterUserController" method="POST">
                        <div class="input-group mb-3">
                            <input name ="fullName" type="text" class="form-control" placeholder="Họ và tên">                           
                        </div>
                        <%=patientError.getFullNameError()%>
                        <div class="input-group mb-3">
                            <input name ="gmail" type="email" class="form-control" placeholder="Email">                            
                        </div>
                        <%=patientError.getGmailError()%>
                        <div class="input-group mb-3">
                            <input name = "password" type="password" class="form-control" placeholder="Mật khẩu">                          
                        </div>
                        <%=patientError.getPasswordError()%>
                        <div class="input-group mb-3">
                            <input name ="confirmpassword" type="password" class="form-control" placeholder="Nhập lại mật khẩu">                            
                        </div>
                        <%=patientError.getConfirmError()%>
                        <div class="input-group mb-3">
                            <label for="gender" value="">Giới tính</label>
                            <select name="gender" class="ml-2">
                                <option value="Nam">Nam</option>
                                <option value="Nữ">Nữ</option>                              
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <input  name ="phone" type="number" class="form-control" placeholder="Phone">
                        </div>
                        <div class="input-group mb-3">
                            <input name ="address" type="text" class="form-control" placeholder="Address">
                        </div>
                        <div style="width: 300px;display: block;margin-left: auto;margin-right: auto">
                            <button type="submit" name ="action" value = "Register" class="btn btn-primary bg-primary btn-block">Đăng kí</button>
                        </div>
                        <div class="social-auth-links "style="width: 300px;display: block;margin-left: auto;margin-right: auto">
                            <a href="#" class="btn btn-block btn-danger" >
                                <i class="fa fa-google mr-2"></i>
                                Đăng nhập bằng Google
                            </a>
                        </div>


                    </form>
                </div>

                <% String success = (String) request.getAttribute("SUCCESS");
                    if (success == null) {
                        success = "";
                    }
                %>
                <%=success%>
                <a href="login.jsp" class="clearfix" style="display: block;margin-left: auto;margin-right: auto">Đã có tài khoản đăng nhập</a></br>

            </div>
            <!-- /.form-box -->
        </div>

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
    </body>
</html>
