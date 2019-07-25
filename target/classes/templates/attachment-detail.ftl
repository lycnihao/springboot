<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>附件管理</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 attachImg">
            <img src="${attachment.attachPath!}" style="width: 100%;">
        </div>
        <div class="col-lg-6 attachDesc">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">附件详情</h3>
                </div>
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="attachName" class="col-sm-2 control-label">附加名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachName" value="${attachment.attachName!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachType" class="col-sm-2 control-label">附件类型</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachType" value="${attachment.attachType!}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachPath" class="col-sm-2 control-label">附件路径</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachPath" value="${attachment.attachPath!}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachCreated" class="col-sm-2 control-label">上传时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachCreated" value="${attachment.attachCreated!}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachStorage" class="col-sm-2 control-label">附件大小</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachStorage" value="${attachment.attachSize!}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachSize" class="col-sm-2 control-label">图片尺寸</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachSize" value="${attachment.attachWh!}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-danger btn-sm pull-left" onclick="btn_delete()">永久删除</button>
                        <button type="button" class="btn btn-info btn-sm pull-right btn-copy">复制链接</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/layer.js"></script>
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