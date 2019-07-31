<#macro head>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title><#nested /></title>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="/static/plugins/jquery/jquery.min.js"></script>
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition sidebar-mini skin-blue">
<div class="wrapper">
<#-- 顶部栏模块 -->
  <#include "_header.ftl">
<#-- 菜单栏模块 -->
  <#include "_sidebar.ftl">
</#macro>

<#macro footer>
<#include "_footer.ftl">
</div>

<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/js/adminlte.min.js"></script>

<#nested />
</body>
</html>
</#macro>
