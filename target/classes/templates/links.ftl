<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{
            font-size: 14px;
        }
    </style>
</head>
<body>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>编号</th>
                <th>标题</th>
                <th>网址</th>
                <th>图标</th>
                <th>备注</th>
                <th>序号</th>
                <th>是否touch</th>
            </tr>
        </thead>
        <tbody>
        <#list links as link>
            <tr>
                <th>${link.linkId}</th>
                <td>${link.title}</td>
                <td>${link.url}</td>
                <td>${link.icon}</td>
                <td>${link.summary}</td>
                <td>${link.ordered}</td>
                <td>${link.isTouch}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</body>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
</html>