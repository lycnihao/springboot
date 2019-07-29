<#compress >
    <#include "module/_macro.ftl">
    <@head>小红衣后台管理 | 首页</@head>
    <div class="main-content">
        <#include "module/_header.ftl">
        <div class="page-title">
            <div class="title-env">
                <h1 class="title">网站列表</h1>
                <p class="description">所有导航网站信息列表</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <form method="get" action="" enctype="application/x-www-form-urlencoded">
                    <input type="text" class="form-control input-lg" placeholder="Search..." name="s" />
                    <button type="submit" class="btn-unstyled">
                    </button>
                </form>
            </div>
            <div class="col-md-2">
                <button class="btn btn-black btn-lg">
                    <span>Search</span>
                </button>
            </div>
            <div class="col-md-4">
                <a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});" class="edit">
                    <button class="btn btn-icon btn-secondary btn-warning pull-right btn-lg">
                        <i class="fa-plus"></i>
                    </button>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tab-pane active" id="all">
                    <table class="table table-hover members-table middle-align">
                        <thead>
                        <tr>
                            <th></th>
                            <th class="hidden-xs hidden-sm"></th>
                            <th>名称简介</th>
                            <th class="hidden-xs hidden-sm">链接</th>
                            <th>分类</th>
                            <th>标签</th>
                            <th>ID</th>
                            <th>添加时间</th>
                            <th>推荐者</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list links as link>
                            <tr>
                                <td class="user-cb">
                                    <input type="checkbox" class="cbr" name="members-list[]" value="1" checked />
                                </td>
                                <td class="user-image hidden-xs hidden-sm">
                                    <a href="#">
                                        <img src="${link.icon}" class="img-circle" alt="user-pic" />
                                    </a>
                                </td>
                                <td class="user-name">
                                    <a target="_blank" href="${link.url}" class="name">Adobe Photoshop</a>
                                    <span>${link.title}</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">${link.url}</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">${(link.type == 0)?string('<span class="badge badge-pill badge-info">网站</span>',
                                        (link.type == 1)?string('<span class="badge badge-pill badge-warning">置顶</span>',
                                        '<span class="badge badge-pill badge-primary">推荐</span>') )}</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <div class="label label-primary">tools</div>
                                    <div class="label label-primary">design</div>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">${link.linkId}</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">${link.createTime}</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">Admin</span>
                                </td>
                                <td class="action-links">
                                    <a href="javascript:;" onclick="jQuery('#updateModal').modal('show', {backdrop: 'static',id:${link.linkId},title:'${link.title}'});" class="edit"><i class="linecons-pencil"></i>编辑</a>
                                    <a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'static'});" class="delete"><i class="linecons-trash"></i>删除</a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <!-- Modal 1 (Basic)-->
    <div class="modal fade" id="modal-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">删除网站</h4>
                </div>
                <div class="modal-body">
                    确定要删除这个网址吗!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-info">确定</button>
                </div>
            </div>
        </div>
    </div>
    <!-- updateModal (Long Modal)-->
    <div class="modal fade" id="updateModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">编辑网站</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-4 text-center">
                                <div id="u-icon" class="droppable-area">
                                    选择图片
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="u-title" class="control-label">名称</label>
                                            <input type="text" class="form-control" id="u-title" placeholder="网站名称">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group no-margin">
                                            <label for="u-summary" class="control-label">简介</label>
                                            <textarea class="form-control autogrow" id="u-summary" placeholder="对此标签页的简介文字"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="u-url" class="control-label">网址</label>
                                <input type="text" class="form-control" id="u-url" placeholder="Https://">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label for="field-3" class="control-label">一级分类</label>
                            </br>
                            <div class="btn-group">
                                <button type="button" class="btn btn-white">设计师</button>
                                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <i class="caret"></i>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="#">设计师</a>
                                    </li>
                                    <li>
                                        <a href="#">产品经理</a>
                                    </li>
                                    <li>
                                        <a href="#">产品策划</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">前端开发</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="field-3" class="control-label">二级分类</label>
                            </br>
                            <div class="btn-group">
                                <button type="button" class="btn btn-white">设计工具</button>
                                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <i class="caret"></i>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="#">灵感收集</a>
                                    </li>
                                    <li>
                                        <a href="#">设计素材</a>
                                    </li>
                                    <li>
                                        <a href="#">icon下载</a>
                                    </li>
                                    <li>
                                        <a href="#">高清图库</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="field-3" class="control-label">三级分类</label>
                            </br>
                            <div class="btn-group">
                                <button type="button" class="btn btn-white">三级分类没想好</button>
                                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <i class="caret"></i>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="#">三级分类</a>
                                    </li>
                                    <li>
                                        <a href="#">三级分类</a>
                                    </li>
                                    <li>
                                        <a href="#">三级分类</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-4" class="control-label">标签</label>
                                <input type="text" class="form-control" id="field-4" placeholder="输入新标签">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <button class="btn btn-black btn-xs">Tools</button>
                                <button class="btn btn-black btn-xs">Design</button>
                                <button class="btn btn-white btn-xs">Other</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-3" class="control-label">添加时间</label>
                                <input type="text" class="form-control" id="field-3" placeholder="2017-08-01">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="field-3" class="control-label">推荐人</label>
                                <input type="text" class="form-control" id="field-3" placeholder="Admin">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="field-3" class="control-label">推荐人邮箱</label>
                                <input type="text" class="form-control" id="field-3" placeholder="Admin">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="field-3" class="control-label">推荐人身份</label>
                            </br>
                            <div class="btn-group">
                                <button type="button" class="btn btn-white">网站开发者</button>
                                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <i class="caret"></i>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="#">网站管理者</a>
                                    </li>
                                    <li>
                                        <a href="#">网站发现者</a>
                                    </li>
                                    <li>
                                        <a href="#">管理员</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group no-margin">
                                <label for="field-7" class="control-label">推荐人理由</label>
                                <textarea class="form-control autogrow" id="field-7" placeholder="对此标签页的简介文字"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-info">保存</button>
                </div>
            </div>
        </div>
    </div>
    <@footer/>

    <script>
        $('#updateModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)[0];
            var id = button.id;
            $.get('links/updateData',{'linkId':id},function (result) {
                console.log(result);
                $('#u-linkId').val(result.linkId);
                $('#u-title').val(result.title);
                $('#u-url').val(result.url);
                /*$('#u-icon').css("background-image","url(" + result.icon +")");*/
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

</#compress>