<#compress >
    <link rel="stylesheet" href="/static/plugins/select2/css/select2.min.css">
    <#include "module/_macro.ftl">
    <style>
      .site-img{
        border-radius: 50%;
        width: 32px;
        height: 32px;
      }
    </style>
    <@head>小红衣后台管理 | 首页</@head>
    <div class="content-wrapper">
      <section class="content-header" id="animated-header">
        <h1 style="display: inline-block;">网站列表</h1>
        <a  href="javascript:;" onclick="jQuery('#addModal').modal('show', {backdrop: 'static'});">
          <i class="fa fa-plus"></i>添加网站
        </a>|
        <a class="btn-header" id="search" href="javascript:void(0)">
          <i class="fa fa-search" aria-hidden="true"></i>筛选
        </a>
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
                <div class="row" id="searchForm" style="display: none">
                  <form class="form-horizontal" action="/admin/website" method="get">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="form-group">
                        <label class="col-sm-4 control-label">网站名称</label>
                        <div class="col-sm-8">
                          <input class="form-control input-sm" type="text" name="keyword">
                        </div>

                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="form-group">
                        <label class="col-sm-4 control-label">网站分类</label>
                        <div class="col-sm-8">
                          <select class="form-control" name="categoryId" data-url="example/bootstraptable/cxselect?type=group">
                            <option value="">请选择</option>
                          <@commonTag method="categories">
                            <#list categories as categorie>
                              <#if categorie.parentId == 0>
                                <option value="${categorie.categoryId}" disabled>${categorie.name}</option>
                              <#else>
                                <option value="${categorie.categoryId}">${categorie.name}</option>
                              </#if>

                            </#list>
                          </@commonTag>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <button type="submit" class="btn btn-primary btn-sm">
                        提交
                      </button>
                    </div>
                  </form>
                </div>
                <div class="row">
                  <div class="col-md-12 table-responsive no-padding" style="margin: 0 10px">
                    <table class="table table-hover" style="font-size: 15px;">
                    <thead>
                    <tr>
                      <th>图标</th>
                      <th>名称</th>
                      <th>链接</th>
                      <th>分类</th>
                      <th>标签</th>
                      <th>添加时间</th>
                      <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list website.content as website>
                    <tr>
                      <td>
                        <a href="javascript:;" onclick="jQuery('#updateModal').modal('show', {backdrop: 'static',id:${website.websiteId}});">
                          <img src="${website.icon}" class="site-img" alt="user-pic" />
                        </a>
                      </td>
                      <td>
                        <a target="_blank" href="${website.url}" class="name">${website.title}</a>
                      </td>
                      <td class="hidden-xs hidden-sm">
                        <span style="font-size: 14px">${website.url}</span>
                      </td>
                      <td class="hidden-xs hidden-sm">
                        <#list websiteCate?keys as key>
                          <#if key?number == website.websiteId>
                            <#list websiteCate[key] as item>
                              <a href="/admin/website?categoryId=${item.categoryId}"><div class="label label-primary">${item.name}</div></a>
                            </#list>
                          </#if>
                        </#list>
                      </td>
                      <td>
                        <span class="email">待开发/计划中</span>
                      </td>
                      <td>
                        <span class="email">${website.createTime?string("yyyy-MM-dd")}</span>
                      </td>
                      <td class="action-website">
                        <a href="javascript:;" onclick="jQuery('#updateModal').modal('show', {backdrop: 'static',id:${website.websiteId ? c}});" class="btn btn-sm bg-olive btn-flat"><i class="linecons-pencil"></i>编辑</a>
                        <a href="javascript:;" onclick="jQuery('#deleteModal').modal('show', {backdrop: 'static',id:${website.websiteId ? c}});" class="btn btn-sm btn-danger"><i class="linecons-trash"></i>删除</a>
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
                  <a data-pjax="true" class="btn btn-default <#if !website.hasPrevious()>disabled</#if>" href="/admin/website?page=${website.number-1}${url}" >
                    上一页
                  </a>
                  <a data-pjax="true" class="btn btn-default <#if !website.hasNext()>disabled</#if>" href="/admin/website?page=${website.number+1}${url}">
                    下一页
                  </a>
                  <a data-pjax="true" class="btn btn-default <#if !website.hasNext()>disabled</#if>" href="/admin/website?page=${website.totalPages-1}${url}">
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
                <div class="form-group col-md-6">
                  <label for="title" class="control-label">网址名称</label>
                  <input type="text" class="form-control" id="title" name="title" placeholder="网站名称">
                </div>
                <div class="form-group col-md-6">
                  <label for="url" class="control-label">网站链接</label>
                  <div class="input-group input-group-sm">
                    <input id="url" name="url" type="text" class="form-control" placeholder="如:http://www.baidu.com">
                    <span class="input-group-btn">
                            <button type="button" class="btn btn-info btn-flat" onclick="getTitle('#url','#title')">获取标题</button>
                      </span>
                  </div>
                </div>
                <div class="form-group col-md-12">
                  <label for="icon" class="control-label">网址图标</label>
                  <input type="text" class="form-control" id="icon" name="icon" placeholder="网站图标">
                </div>
                <div class="form-group col-md-12 no-margin">
                  <label for="summary" class="control-label">网站简介</label>
                  <textarea class="form-control autogrow" id="summary" placeholder="对网站进行简要的概括(50字以内)"></textarea>
                </div>
                <div class="form-group col-md-12" style="margin-top: 10px">
                  <label for="categories" class="control-label">网站分类</label>
                  <select id="categories" class="categories form-control" multiple="multiple" style="width: 100%;">
                      <#list categories as categorie>
                          <option value="${categorie.categoryId}">${categorie.name}</option>
                      </#list>
                  </select>
                </div>
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
                                <img id="u-icon-img" class="profile-img img-responsive img-circle pointer" src="/static/images/user-5.png" alt="User profile picture">
                                <span class="upload-img-text" onclick="layerModal('/admin/attachments/select?id=u-icon','选择附件')">选择图片</span>
                              </div>
                            </div>
                          <div class="col-sm-8">
                            <div class="form-group">
                              <label for="u-title" class="control-label">网址名称</label>
                              <input type="text" class="form-control" id="u-title" name="u-title" placeholder="网站名称">
                            </div>
                            <div class="form-group">
                              <label for="u-url" class="control-label">网站链接</label>
                              <div class="input-group input-group-sm">
                                <input id="u-url" name="u-url" type="text" class="form-control" placeholder="网址链接，如:http://www.baidu.com">
                                <span class="input-group-btn">
                                  <button type="button" class="btn btn-info btn-flat" onclick="getTitle('#u-url','#u-title')">抓取标题</button>
                                </span>
                              </div>
                            </div>
                            <div class="form-group">
                              <label for="u-icon" class="control-label">网址图标</label>
                              <input type="text" class="form-control" id="u-icon" name="u-icon" placeholder="网站图标">
                            </div>
                          </div>
                        </div>
                    </div>
                  <div class="row">
                      <div class="form-group col-md-12 no-margin">
                        <label for="u-summary" class="control-label">网站简介</label>
                        <textarea class="form-control autogrow" id="u-summary" placeholder="对网站进行简要的概括(50字以内)"></textarea>
                      </div>
                      <div class="form-group col-md-12" style="margin-top: 10px">
                        <label for="u-categories" class="control-label">网站分类</label>
                        <select id="u-categories" class="categories form-control" multiple="multiple" style="width: 100%;">
                        <#list categories as categorie>
                          <option value="${categorie.categoryId}">${categorie.name}</option>
                        </#list>
                        </select>
                      </div>

                      <div class="form-group col-md-6">
                        <label for="u-createTime" class="control-label">创建时间</label>
                        <input type="text" class="form-control" id="u-createTime" name="u-createTime" disabled>
                      </div>
                      <div class="form-group col-md-6">
                          <label for="u-ordered" class="control-label">序号</label>
                          <input type="number" class="form-control" id="u-ordered" placeholder="序号">
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
            $.get('website/updateData',{'websiteId':id},function (result) {

                $('#u-websiteId').val(result.websiteId);
                $('#u-title').val(result.title);
                $('#u-url').val(result.url);
                $('#u-icon').val(result.icon);
                $('#u-icon-img').attr('src',result.icon);
                $('#u-summary').val(result.summary);
                $('#u-ordered').val(result.ordered);
                $('#u-createTime').val(result.createTime);

                var arr = [];
                $.each(result.categories, function(key, val) { arr.push(val.categoryId) });
                $('#u-categories').val(arr).trigger('change');

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
            var icon =  $('#u-icon').val();
            var summary = $('#u-summary').val();
            var ordered = $('#u-ordered').val();
            var createTime = $('#u-createTime').val();
            var categoryIds = $("#u-categories").val();
            var data = {'websiteId':websiteId,'title':title,'url':url,'icon':icon,'summary':summary,'ordered':ordered,'createTime':new Date(createTime),'categoryIds':categoryIds};
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
          var icon =  $('#icon').val();
          var summary = $('#summary').val();
          var createTime = new Date();
          var categoryIds = $("#categories").val();
          var data = {'title':title,'url':url,'icon':icon,'summary':summary,'createTime':new Date(createTime),'categoryIds[]':categoryIds};
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

        $("#search").click(function () {
          $("#searchForm").slideToggle(400);
        });

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