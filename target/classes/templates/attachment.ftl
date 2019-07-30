<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>附件管理</title>
    <link href="/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="/attachments/uploadModal">上传</a>
<div class="row">
    <#list attachments as attachment>
        <div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail" onclick="layerModal('/attachments/attachment?attachId=${attachment.attachId}')">
            <a href="javascript:void(0)" class="thumbnail">
                <img src="${attachment.attachSmallPath!}" class="img-responsive">
            </a>
        </div>
    </#list>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="no-margin pull-left">
            第1/1页
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-end">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </div>
</div>

</body>
<script src="/static/plugins/jquery/jquery.min.js"></script>
<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/plugins/layer/layer.js"></script>
<script>
    function layerModal(url, title) {
        layer.open({
            type: 2,
            title: title,
            shadeClose: true,
            shade: 0.5,
            maxmin: true,
            area: ['90%', '90%'],
            content: url,
            scrollbar: false
        });
    };
</script>
</html>