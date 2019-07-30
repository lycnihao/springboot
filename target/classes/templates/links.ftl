<#compress >
    <#include "module/_macro.ftl">
    <@head>小红衣后台管理 | 首页</@head>
    <div class="content-wrapper">
      <section class="content-header" id="animated-header">
        <h1 style="display: inline-block;">网站列表</h1>
        <a class="btn btn-xs btn-info" id="btnNewPage" href="/admin/page/new">
          <i class="fa fa-plus"></i>添加网站 </a>
        <ol class="breadcrumb">
          <li>
            <a data-pjax="true" href="javascript:void(0)"><i class="fa fa-dashboard"></i> 首页</a>
          </li>
          <li class="active">网站列表</li>
        </ol>
      </section>
      <section class="content" id="animated-content">
        <div class="row">
            <div class="col-md-12">
                <div class="tab-pane active" id="all">
                    <table class="table table-hover members-table middle-align">
                        <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>名称简介</th>
                            <th>链接</th>
                            <th>分类</th>
                            <th>类型</th>
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
                                    <input type="checkbox" name="ids" value="${link.linkId}"/>
                                </td>
                                <td>
                                    <a href="#">
                                        <img src="${link.icon}" class="direct-chat-img" alt="user-pic" />
                                    </a>
                                </td>
                                <td>
                                    <a target="_blank" href="${link.url}" class="name">${link.title}</a>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">${link.url}</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">设计师/设计工具</span>
                                </td>
                                <td class="text-center">
                                    <span class="email">${(link.isTouch == 0 && link.isRecommend == 0)?string('<div class="badge bg-light-blue">网站</div>',
                                    (link.isTouch == 1 && link.isRecommend == 1)?string('<div class="badge bg-green">推荐</div><div class="badge bg-yellow">置顶</div>',
                                    (link.isTouch == 1)?string('<div class="badge bg-yellow">置顶</div>',
                                    '<div class="badge bg-green">推荐</div>')) )}</span>
                                </td>
                                <td>
                                    <div class="label label-primary">tools</div>
                                    <div class="label label-primary">design</div>
                                </td>
                                <td>
                                    <span class="email">${link.linkId}</span>
                                </td>
                                <td>
                                    <span class="email">${link.createTime?string("yyyy-MM-dd")}</span>
                                </td>
                                <td>
                                    <span class="email">Admin</span>
                                </td>
                                <td class="action-links">
                                    <a href="javascript:;" onclick="jQuery('#updateModal').modal('show', {backdrop: 'static',id:${link.linkId},title:'${link.title}'});" class="btn bg-olive btn-flat"><i class="linecons-pencil"></i>编辑</a>
                                    <a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'static'});" class="btn btn-danger"><i class="linecons-trash"></i>删除</a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
      </section>
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
                                <div class="droppable-area dz-clickable">
                                    <input id="u-icon" type="hidden">
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
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tags" class="control-label">标签</label>
                                  <select class="u-tags form-control" multiple="multiple">
                                    <option selected="selected">orange</option>
                                    <option>white</option>
                                    <option selected="selected">purple</option>
                                  </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="u-createTime" class="control-label">添加时间</label>
                                <input type="text" class="form-control" id="u-createTime" placeholder="2017-08-01">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="u-isTouch" value="1"> 置顶
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="u-isRecommend" value="1"> 推荐
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-info" id="update">保存</button>
                </div>
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="/static/plugins/select2/css/select2.css">
    <link rel="stylesheet" href="/static/plugins/select2/css/select2-bootstrap.css">
    <script src="/static/plugins/select2/js/select2.min.js"></script>
    <@footer/>
    <script>
        $('#updateModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)[0];
            var id = button.id;
            $('#u-isRecommend').prop('checked', false);
            $('#u-isTouch').prop('checked', false);
            $.get('links/updateData',{'linkId':id},function (result) {
                console.log(result);
              $(".u-tags").select2({
                placeholder: 'Choose your favorite US Countries',
                allowClear: true,
                dropdownAutoWidth: true
              });
                $('#u-linkId').val(result.linkId);
                $('#u-title').val(result.title);
                $('#u-url').val(result.url);
                $('#u-icon').val(result.icon);
                $('#u-summary').val(result.summary);
                $('#u-ordered').val(result.ordered);
                $('#u-createTime').val(result.createTime);
                if(result.isTouch == 1){
                  $('#u-isTouch').prop('checked', true)
                }
                if(result.isRecommend == 1){
                  $('#u-isRecommend').prop('checked', true)
                }


            })
        });

        $('#deleteModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
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
            var createTime = $('#u-createTime').val();
            var isTouch = $('#u-isTouch').prop('checked');
            var isRecommend = $('#u-isRecommend').prop('checked');
            var data = {'linkId':linkId,'title':title,'url':url,'icon':icon,'summary':summary,'ordered':ordered,'createTime':createTime,'isTouch':isTouch == true ? 1:0,'isRecommend':isRecommend == true ? 1:0};
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