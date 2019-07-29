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
        .icon {
          width: 26px;
          height: 26px;
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
        <th>类型</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list links as link>
        <tr>
            <td>${link.title}</td>
            <td><a href="${link.url}">${link.url}</a></td>
            <td><img src="${link.icon}" alt="${link.title}" class="icon rounded"></td>
            <td>${link.summary}</td>
            <td>${link.ordered}</td>
            <td>
                ${(link.type == 0)?string('<span class="badge badge-pill badge-info">网站</span>',
                (link.type == 1)?string('<span class="badge badge-pill badge-warning">置顶</span>',
                '<span class="badge badge-pill badge-primary">推荐</span>') )}
            </td>
            <td>
                <button data-id="${link.linkId}" data-title="${link.title}" type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#updateModal">修改</button>
                <button data-id="${link.linkId}" data-title="${link.title}" type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteModal">删除</button>
            </td>
        </tr>
    </#list>
    </tbody>
</table>
<button type="button" class="btn btn-info"  data-toggle="modal" data-target="#addModal">新增</button>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新增链接</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <input id="u-linkId" type="hidden">
                    <div class="form-group">
                        <label for="title" class="col-form-label">标题:</label>
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                    <div class="form-group">
                        <label for="url" class="col-form-label">网址:</label>
                        <input type="text" class="form-control" id="url" name="url">
                    </div>
                    <div class="form-group">
                        <label for="icon" class="col-form-label">图标:</label>
                        <input type="text" class="form-control" id="icon" name="icon">
                    </div>
                    <div class="form-group">
                        <label for="summary" class="col-form-label">摘要:</label>
                        <input type="text" class="form-control" id="summary" name="summary">
                    </div>
                    <div class="form-group">
                        <label for="ordered" class="col-form-label">序号:</label>
                        <input type="number" class="form-control" id="ordered" name="ordered">
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="type0" name="type" class="custom-control-input" value="0">
                        <label class="custom-control-label" for="type0">普通</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="type1" name="type" class="custom-control-input" value="1">
                        <label class="custom-control-label" for="type1">置顶</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="type2" name="type" class="custom-control-input" value="2">
                        <label class="custom-control-label" for="type2">推荐</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button id="add" type="button" class="btn btn-warning">保存</button>
            </div>
        </div>
    </div>
</div>

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
                    <input id="u-linkId" type="hidden">
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
                        <input type="radio" id="u-type0" name="u-type" class="custom-control-input" value="0">
                        <label class="custom-control-label" for="u-type0">普通</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="u-type1" name="u-type" class="custom-control-input" value="1">
                        <label class="custom-control-label" for="u-type1">置顶</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="u-type2" name="u-type" class="custom-control-input" value="2">
                        <label class="custom-control-label" for="u-type2">推荐</label>
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
                <input id="link-id" type="hidden">
            </div>
            <div class="modal-footer">
                <button id="delete" type="button" class="btn btn-danger">确认</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/static/plugins/jquery/jquery.min.js"></script>
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
            $('#u-linkId').val(result.linkId);
            $('#u-title').val(result.title);
            $('#u-url').val(result.url);
            $('#u-icon').val(result.icon);
            $('#u-summary').val(result.summary);
            $('#u-ordered').val(result.ordered);
            $('#u-type'+result.type).prop('checked', true)
        })
    });
    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id');
        var title = button.data('title');
        var modal = $(this);
        modal.find('.link-title').text(title);
        modal.find('#link-id').val(id);
    });


    $("#update").click(function () {
        var linkId = $('#u-linkId').val();
        var title = $('#u-title').val();
        var url =  $('#u-url').val();
        var icon =  $('#u-icon').val();
        var summary = $('#u-summary').val();
        var ordered = $('#u-ordered').val();
        var type = $('input[name="u-type"]:checked').val();
        var data = {'linkId':linkId,'title':title,'url':url,'icon':icon,'summary':summary,'ordered':ordered,'type':type};
        $.ajax({
            url:'links/save',
            type:'post',
            data:data,
            success:function (result) {
                alert("修改成功！");
                window.location.reload();
            }
        });

    });

    $("#add").click(function () {
        $.ajax({
            url:'links/save',
            type:'post',
            data:$("#addModal form").serialize(),
            success:function (result) {
                alert("新增成功！");
                window.location.reload();
            }
        });
    });
    $("#delete").click(function () {
        $.ajax({
            url:'links/delete/'+$("#link-id").val(),
            type:'post',
            data:{},
            success:function (result) {
                alert("删除成功！");
                window.location.reload();
            }
        });
    });
</script>
</html>