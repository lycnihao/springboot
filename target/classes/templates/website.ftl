<#compress >
    <link rel="stylesheet" href="/static/plugins/select2/css/select2.min.css">
    <#include "module/_macro.ftl">
    <@head>小红衣后台管理 | 首页</@head>
    <div class="content-wrapper">
      <section class="content-header" id="animated-header">
        <h1 style="display: inline-block;">网站列表</h1>
        <a class="btn btn-xs btn-info"  href="javascript:;" onclick="jQuery('#addModal').modal('show', {backdrop: 'static'});">
          <i class="fa fa-plus"></i>添加网站 </a>
        <ol class="breadcrumb">
          <li>
            <a data-pjax="true" href="javascript:void(0)"><i class="fa fa-dashboard"></i> 首页</a>
          </li>
          <li class="active">网站列表</li>
        </ol>
      </section>
      <section class="content" id="animated-content">
          <div class="box">
            <div class="box-body">
                <div class="row" id="form-search" style="display: none">
                  <form action="/admin/website" method="get">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="form-group">
                        <label class="control-label">ID</label>
                        <input class="form-control" type="text" name="websiteId" placeholder="" value="">
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="form-group">
                        <label class="control-label">网站名称</label>
                        <input class="form-control" type="text" name="title" placeholder="" value="">
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="form-group">
                        <label class="control-label">网站网址</label>
                        <input class="form-control" type="text" name="url" placeholder="" value="">
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="form-group">
                        <label class="control-label">网站分类</label>
                        <select class="group form-control" name="category" data-url="example/bootstraptable/cxselect?type=group">
                          <option value="">请选择</option>
                          <#list categories as categorie>
                          <option value="${categorie.categoryId}">${categorie.name}</option>
                          </#list>
                        </select>
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <button type="submit" class="btn btn-primary">
                        提交
                      </button>
                    </div>
                  </form>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="pull-left"></div>
                    <div class="pull-right">
                      <button id="search-toggle" type="button" class="btn btn-default" style="margin-top: 10px">
                        <i class="fa fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 table-responsive no-padding">
                    <table class="table table-hover">
                    <thead>
                    <tr>
                      <th></th>
                      <th>图标</th>
                      <th>名称</th>
                      <th>链接</th>
                      <th>分类</th>
                      <th>类型</th>
                      <th>标签</th>
                      <th>ID</th>
                      <th>添加时间</th>
                      <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list website.content as website>
                    <tr>
                      <td class="user-cb">
                        <input type="checkbox" name="ids" value="${website.websiteId}"/>
                      </td>
                      <td>
                        <a href="javascript:;" onclick="jQuery('#updateModal').modal('show', {backdrop: 'static',id:${website.websiteId}});">
                          <img src="${website.icon}" class="direct-chat-img" alt="user-pic" />
                        </a>
                      </td>
                      <td>
                        <a target="_blank" href="${website.url}" class="name">${website.title}</a>
                      </td>
                      <td class="hidden-xs hidden-sm">
                        <span class="email">${website.url}</span>
                      </td>
                      <td class="hidden-xs hidden-sm">
                                <#--<#list website.categories as cate>
                                  <div class="label label-primary">${cate.name}</div>
                                </#list>-->
                      </td>
                      <td>
                                <span>${(website.isTouch == 0 && website.isRecommend == 0)?string('<div class="badge bg-light-blue">网站</div>',
                                (website.isTouch == 1 && website.isRecommend == 1)?string('<div class="badge bg-yellow">置顶</div><div class="badge bg-green">推荐</div>',
                                (website.isTouch == 1)?string('<div class="badge bg-yellow">置顶</div>',
                                '<div class="badge bg-green">推荐</div>')) )}</span>
                      </td>
                      <td>
                        <span class="email">设计师/设计工具</span>
                      </td>
                      <td>
                        <span class="email">${website.websiteId}</span>
                      </td>
                      <td>
                        <span class="email">${website.createTime?string("yyyy-MM-dd")}</span>
                      </td>
                      <td class="action-website">
                        <a href="javascript:;" onclick="jQuery('#updateModal').modal('show', {backdrop: 'static',id:${website.websiteId}});" class="btn bg-olive btn-flat"><i class="linecons-pencil"></i>编辑</a>
                        <a href="javascript:;" onclick="jQuery('#deleteModal').modal('show', {backdrop: 'static',id:${website.websiteId}});" class="btn btn-danger"><i class="linecons-trash"></i>删除</a>
                      </td>
                    </tr>
                    </#list>
                    </tbody>
                  </table>
                </div>
                </div>
            </div>
            <div class="box-footer">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="no-margin pull-left">
                  第${website.number+1}/${website.totalPages}页
                </div>
                <div class="btn-group pull-right btn-group-sm" role="group">
                  <a data-pjax="true" class="btn btn-default <#if !website.hasPrevious()>disabled</#if>" href="/admin/website" >
                    首页
                  </a>
                  <a data-pjax="true" class="btn btn-default <#if !website.hasPrevious()>disabled</#if>" href="/admin/website?page=${website.number-1}" >
                    上一页
                  </a>
                  <a data-pjax="true" class="btn btn-default <#if !website.hasNext()>disabled</#if>" href="/admin/website?page=${website.number+1}">
                    下一页
                  </a>
                  <a data-pjax="true" class="btn btn-default <#if !website.hasNext()>disabled</#if>" href="/admin/website?page=${website.totalPages-1}">
                    尾页
                  </a>
                </div>
              </div>
            </div>
          </div>
      </section>
    </div>


    <!-- 新增 -->
    <div class="modal fade" id="addModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">新增网站</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">
                <div class="col-sm-4 text-center" style="margin-top: 28px">
                  <div class="upload-img">
                    <img id="icon" class="profile-img img-responsive img-circle pointer" src="/static/images/user-5.png" alt="User profile picture">
                    <span class="upload-img-text" onclick="layerModal('/admin/attachments/select?id=icon','选择附件')">选择图片</span>
                  </div>
                </div>
                <div class="col-sm-8">
                  <div class="row">
                    <div class="col-md-12">
                      <label for="url" class="control-label">网址</label>
                      <div class="input-group input-group-sm">
                        <input id="url" name="url" type="text" class="form-control" placeholder="网址地址，如:http://www.baidu.com">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-info btn-flat" onclick="getTitle('#url','#title')">抓取标题</button>
                      </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="title" class="control-label">名称</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="网站名称">
                  </div>
                  <div class="form-group no-margin">
                    <label for="summary" class="control-label">简介</label>
                    <textarea class="form-control autogrow" id="summary" placeholder="对此标签页的简介文字"></textarea>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="categories" class="control-label">分类</label>
                  <select id="categories" class="categories form-control" multiple="multiple" style="width: 100%;">
                      <#list categories as categorie>
                          <option value="${categorie.categoryId}">${categorie.name}</option>
                      </#list>
                  </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="createTime" class="control-label">添加时间</label>
                  <input type="text" class="form-control" id="createTime" name="createTime" placeholder="2017-08-01">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-12">
                  <ul style="list-style: none;padding: 0px;margin: 0px;">
                      <li style="padding: 0;margin: 0px;list-style: none;display: inline-block;">
                          <div class="pretty p-default">
                              <input name="isTouch" id="isTouch" type="checkbox" class="minimal" value="1">
                              <div class="state p-primary">
                                  <label>置顶</label>
                              </div>
                          </div>
                      </li>
                      <li style="padding: 0;margin: 0px;list-style: none;display: inline-block;">
                          <div class="pretty p-default">
                              <input name="isRecommend" id="isRecommend" type="checkbox" class="minimal" value="1">
                              <div class="state p-primary">
                                  <label>推荐</label>+
                              </div>
                          </div>
                      </li>
                  </ul>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-info" id="add">保存</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 修改-->
    <div class="modal fade" id="updateModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">编辑网站</h4>
                </div>
                <div class="modal-body">
                  <input id="u-websiteId" type="hidden">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-4 text-center">
                              <div class="upload-img">
                                <img id="u-icon" class="profile-img img-responsive img-circle pointer" src="/static/images/user-5.png" alt="User profile picture">
                                <span class="upload-img-text" onclick="layerModal('/admin/attachments/select?id=u-icon','选择附件')">选择图片</span>
                              </div>
                            </div>
                            <div class="col-sm-8">
                              <div class="row">
                                <div class="col-md-12">
                                  <label for="u-url" class="control-label">网址</label>
                                  <div class="input-group input-group-sm">
                                    <input id="u-url" name="u-url" type="text" class="form-control" placeholder="网址地址，如:http://www.baidu.com">
                                    <span class="input-group-btn">
                                      <button type="button" class="btn btn-info btn-flat"  onclick="getTitle('#u-url','#u-title')">抓取标题</button>
                                    </span>
                                  </div>
                                </div>
                              </div>

                              <div class="form-group">
                                <label for="u-title" class="control-label">名称</label>
                                <input type="text" class="form-control" id="u-title" name="u-title" placeholder="网站名称">
                              </div>


                              <div class="form-group no-margin">
                                <label for="u-summary" class="control-label">简介</label>
                                <textarea class="form-control autogrow" id="u-summary" placeholder="对此标签页的简介文字"></textarea>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="categories" class="control-label">分类</label>
                                  <select id="u-categories" class="categories form-control" multiple="multiple" style="width: 100%;">
                                      <#list categories as categorie>
                                          <option value="${categorie.categoryId}">${categorie.name}</option>
                                      </#list>
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
                        <div class="form-group col-md-5">
                          <label for="u-ordered" class="control-label">序号</label>
                          <input type="number" class="form-control" id="u-ordered" placeholder="序号">
                        </div>
                        <div class="form-group col-md-5" style="margin-top: 20px;">
                            <ul style="list-style: none;padding: 0px;margin: 0px;">
                                <li style="padding: 0;margin: 0px;list-style: none">
                                    <div class="pretty p-default">
                                        <input name="u-isTouch" id="u-isTouch" type="checkbox" class="minimal" value="1">
                                        <div class="state p-primary">
                                            <label>置顶</label>
                                        </div>
                                    </div>
                                </li>
                                <li style="padding: 0;margin: 0px;list-style: none">
                                    <div class="pretty p-default">
                                        <input name="u-isRecommend" id="u-isRecommend" type="checkbox" class="minimal" value="1">
                                        <div class="state p-primary">
                                            <label>推荐</label>
                                        </div>
                                    </div>
                                </li>
                            </ul>
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
    <!-- 删除 -->
    <div class="modal fade" id="deleteModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">删除网站</h4>
          </div>
          <div class="modal-body"><input id="website-id" type="hidden">
            确定要删除这个网址吗!
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-info" id="delete">确定</button>
          </div>
        </div>
      </div>
    </div>
    <script src="/static/plugins/select2/js/select2.min.js"></script>
    <@footer/>
    <script>

      $(function () {
        $(".categories").select2({
          placeholder: '请选择分类',
          allowClear: true,
          dropdownAutoWidth: true
        });
      });

        $('#updateModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)[0];
            var id = button.id;
            $('#u-isRecommend').prop('checked', false);
            $('#u-isTouch').prop('checked', false);
            $.get('website/updateData',{'websiteId':id},function (result) {

                $('#u-websiteId').val(result.websiteId);
                $('#u-title').val(result.title);
                $('#u-url').val(result.url);
                $('#u-icon').attr('src',result.icon);
                $('#u-summary').val(result.summary);
                $('#u-ordered').val(result.ordered);
                $('#u-createTime').val(result.createTime);

                var arr = [];
                $.each(result.categories, function(key, val) { arr.push(val.categoryId) });
                $('#u-categories').val(arr).trigger('change');

                if(result.isTouch == 1)
                    $('#u-isTouch').prop('checked', true);

                if(result.isRecommend == 1)
                  $('#u-isRecommend').prop('checked', true)


            });
        });

        $('#deleteModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)[0];
            var id = button.id;
            var modal = $(this);
            modal.find('#website-id').val(id);
        });

        $("#update").click(function () {
            var websiteId = $('#u-websiteId').val();
            var title = $('#u-title').val();
            var url =  $('#u-url').val();
            var icon =  $('#u-icon').attr('src');
            var summary = $('#u-summary').val();
            var ordered = $('#u-ordered').val();
            var createTime = $('#u-createTime').val();
            var isTouch = $('#u-isTouch').prop('checked');
            var isRecommend = $('#u-isRecommend').prop('checked');
            var cateList = $("#u-categories").val();
            var cateIds = "";
            for (var i in cateList){
                cateIds += cateList[i] + ","
            }
            var data = {'websiteId':websiteId,'title':title,'url':url,'icon':icon,'summary':summary,'ordered':ordered,'createTime':new Date(createTime),'isTouch':isTouch == true ? 1:0,'isRecommend':isRecommend == true ? 1:0,'cateIds':cateIds};
            $.ajax({
                url:'website/save',
                type:'post',
                data:data,
                success:function (result) {
                    alert("修改成功！");
                    window.location.reload();
                }
            });

        });

        $("#add").click(function () {
          var title = $('#title').val();
          var url =  $('#url').val();
          var icon =  $('#icon').attr('src');
          var summary = $('#summary').val();
          var createTime = $('#createTime').val();
          var isTouch = $('#isTouch').prop('checked');
          var isRecommend = $('#isRecommend').prop('checked');
          var cateList = $("#categories").val();
            var cateIds = "";
            for (var i in cateList){
                cateIds += cateList[i] + ","
            }
          var data = {'title':title,'url':url,'icon':icon,'summary':summary,'createTime':new Date(createTime),'isTouch':isTouch == true ? 1:0,'isRecommend':isRecommend == true ? 1:0,'cateIds':cateIds};
            $.ajax({
                url:'website/save',
                type:'post',
                data:data,
                success:function (result) {
                    alert("新增成功！");
                    window.location.reload();
                }
            });
        });

        $("#delete").click(function () {
            $.ajax({
                url:'website/delete/'+$("#website-id").val(),
                type:'post',
                data:{},
                success:function (result) {
                    alert("删除成功！");
                    window.location.reload();
                }
            });
        });

        $("#search-toggle").click(function () {
          $("#form-search").toggle();
        })

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
        }

        function getTitle(url,title) {
          $.ajax({
            url:'website/get-title/',
            type:'GET',
            data:{'url':$(url).val()},
            success:function (result) {
              if(result.code){
                $(title).val(result.msg);
              } else {
                alert("获取发生了错误")
              }
            }
          });
        }
    </script>

</#compress>