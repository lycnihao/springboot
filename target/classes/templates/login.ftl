<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 | 登陆</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/static/css/AdminLTE.min.css">

  <style>
    .login-backgroud {
      border-radius: 3px;
      -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      background: rgba(255, 255, 255, 0.2);
      background: -webkit-linear-gradient(transparent, #ECECEC); /* Safari 5.1 - 6.0 */
      background: -o-linear-gradient(transparent, #ECECEC); /* Opera 11.1 - 12.0 */
      background: -moz-linear-gradient(transparent, #ECECEC); /* Firefox 3.6 - 15 */
      background: linear-gradient(transparent, #ECECEC);
    }

    .form-style {
      position: relative;
    }

    .form-style .form-control {
      padding-left: 40px;
    }

    .form-control-style {
      position: absolute;
      top: 0;
      /* right: 0; */
      z-index: 2;
      display: block;
      width: 40px;
      height: 34px;
      line-height: 34px;
      text-align: center;
      pointer-events: none;
    }

    .login-logo {
      text-shadow: #b2baba 0 0 0.2em;
      font-family: "Times New Roman", Times, serif;
    }
  </style>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition">
<div class="login-box">
  <div class="login-logo">
    <a href="/"><b>后台</b></a>
  </div>
  <div class="login-box-body login-backgroud">
    <div class="text-center" style="margin-bottom: 20px">
      <img src="/static/images/user-5.png" alt="user image" class="img-circle"
           style="width: 100px;height: 100px;">
    </div>
      <div style="margin-bottom: 28px;" class="form-style">
        <input id="username" name="username" type="text" class="form-control" placeholder="用户名">
        <span class="fa fa-user form-control-style"></span>
      </div>
      <div style="margin-bottom: 22px;" class="form-style">
        <input id="password" name="password" type="password" class="form-control" placeholder="密码">
        <span class="fa fa-unlock-alt form-control-style"></span>
      </div>
      <div class="form-style text-right" style="margin: 0 0 13px">
        <a href="/retrieve ">忘记密码?</a><span style="margin: 0 5px">|</span>没有帐号？<a href="/register" title="注册">注册</a>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox">
            <label>
              <input name="rememberMe" type="checkbox" value="1"> 记住我
            </label>
          </div>
        </div>
        <div class="col-xs-4">
          <button id="loginBtn" type="submit" class="btn bg-green btn-block btn-flat">登陆</button>
        </div>
      </div>
  </div>

</div>
<script src="/static/plugins/jquery/jquery.min.js"></script>
<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/js/adminlte.min.js"></script>
<script src="/static/plugins/layer/layer.js"></script>
<script>
  $(function () {
    $("body").css("background-image", "url(/static/images/bg1.jpg)").css("background-size",
        "cover").css("background-position", "center");
    $("#loginBtn").on('click', function () {
      $("#loginBtn").html('<i class="fa fa-spin fa-refresh"></i> 登陆中...').attr('disabled', true);
      $.ajax({
        type: "POST",
        url: "/admin/login",
        data: {'username':$("#username").val(),'password':$("#password").val()},
        dataType: "json",
        success: function (data) {
          setTimeout(function () {
            $.unblockUI();
          }, 50);
          if (data.code == 1) {
            $("#loginBtn").html("跳转中...").attr('disabled', false);
            layer.msg("登陆成功！", {
              offset: '30%',
              time: 800
            }, function () {
              window.location.href = "/admin";
            });
          } else {
            $("#loginBtn").html('登陆').attr('disabled', false);
            layer.msg(data.msg, {
              icon: 2,
              offset: '30%',
              time: 2500
            });
            $("#verificationCode").click();
          }
        },
        error: function (e) {
          setTimeout(function () {
            $.unblockUI();
          }, 50);
          layer.msg(e.responseJSON.msg, {
            icon: 2,
            offset: '30%',
            time: 2500
          });
        }
      });
    });
    $(document).keyup(function (event) {
      if (event.keyCode == 13) {
        $("#loginBtn").click();
      }
    });
  })
</script>
</body>
</html>
