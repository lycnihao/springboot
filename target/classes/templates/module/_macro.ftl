<#macro head>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title><#nested /></title>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="/static/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="/static/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/xenon-core.css">
    <link rel="stylesheet" href="/static/css/xenon-forms.css">
    <link rel="stylesheet" href="/static/css/xenon-components.css">
    <link rel="stylesheet" href="/static/css/xenon-skins.css">
    <link rel="stylesheet" href="/static/css/custom.css">
    <link rel="stylesheet" href="/static/plugins/dropzone/css/dropzone.css">
    <script src="/static/plugins/jquery/jquery.min.js"></script>
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="page-body">
<div class="page-container">
<#-- 菜单栏模块 -->
<#include "_sidebar.ftl">
</#macro>

<#macro footer>
</div>

<script src="/static/plugins/dropzone/dropzone.min.js"></script>
<!-- Bottom Scripts -->
<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/js/TweenMax.min.js"></script>
<script src="/static/js/resizeable.js"></script>
<script src="/static/js/joinable.js"></script>
<script src="/static/js/xenon-api.js"></script>
<script src="/static/js/xenon-toggles.js"></script>
<!-- JavaScripts initializations and stuff -->
<script src="/static/js/xenon-custom.js"></script>
<#nested />
</body>
</html>
</#macro>
