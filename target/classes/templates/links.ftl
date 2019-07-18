<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-size: 14px;
        }
    </style>
</head>
<body>
<table class="table table-hover">
    <thead class="thead-dark">
    <tr>
        <th>标题</th>
        <th>网址</th>
        <th>图标</th>
        <th>备注</th>
        <th>序号</th>
        <th>是否touch</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list links as link>
        <tr>
            <td>${link.title}</td>
            <td>${link.url}</td>
            <td>${link.icon}</td>
            <td>${link.summary}</td>
            <td>${link.ordered}</td>
            <td>${link.isTouch}</td>
            <td>
                <button data-id="${link.linkId}" data-title="${link.title}" type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#updateModal">修改</button>
                <button data-id="${link.linkId}" data-title="${link.title}" type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteModal">删除</button>
            </td>
        </tr>
    </#list>
    </tbody>
</table>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">修改链接[<span class="link-title"></span>]</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="u-title" class="col-form-label">标题:</label>
                        <input type="text" class="form-control" id="u-title">
                    </div>
                    <div class="form-group">
                        <label for="u-url" class="col-form-label">网址:</label>
                        <input type="text" class="form-control" id="u-url">
                    </div>
                    <div class="form-group">
                        <label for="u-icon" class="col-form-label">图标:</label>
                        <input type="text" class="form-control" id="u-icon">
                    </div>
                    <div class="form-group">
                        <label for="u-summary" class="col-form-label">摘要:</label>
                        <input type="text" class="form-control" id="u-summary">
                    </div>
                    <div class="form-group">
                        <label for="u-ordered" class="col-form-label">序号:</label>
                        <input type="number" class="form-control" id="u-ordered">
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="is-touch1" name="u-is-touch" class="custom-control-input">
                        <label class="custom-control-label" for="is-touch1">设置</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="is-touch2" name="u-is-touch" class="custom-control-input">
                        <label class="custom-control-label" for="is-touch2">不设置</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button id="update" type="button" class="btn btn-warning">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">删除提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h3 style="text-align: center">确认删除[<span class="link-title"></span>]吗？</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button id="delete" type="button" class="btn btn-danger">保存</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script>
    $('#updateModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id');
        var title = button.data('title');
        var modal = $(this);
        modal.find('.link-title').text(title);
        $.get('links/updateData',{'linkId':id},function (result) {
            console.log(result);
            $('#u-title').val(result.title);
            $('#u-url').val(result.url);
            $('#u-icon').val(result.icon);
            $('#u-summary').val(result.summary);
            $('#u-ordered').val(result.ordered);
            /*$('input [name="is-touch"]').val(result.isTouch);*/
        })
    });
    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id');
        var title = button.data('title');
        var modal = $(this);
        modal.find('.link-title').text(title);

    });


    $("#update").click(function () {

    });
    $("#delete").click(function () {

    });
</script>
</html>