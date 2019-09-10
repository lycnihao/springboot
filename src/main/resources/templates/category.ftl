<#compress >
<#include "module/_macro.ftl">
    <@head>后台管理 | 分类管理</@head>
<div class="content-wrapper">
    <section class="content-header" id="animated-header">
        <h1>
            分类管理
            <small></small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <a data-pjax="true" href="/admin">
                    <i class="fa fa-dashboard"></i> 首页</a>
            </li>
            <li class="active">分类管理</li>
        </ol>
    </section>
    <section class="content container-fluid" id="animated-content">
        <div class="row">
            <div class="col-md-5">
                <div class="box box-primary">
                    <#if updateCategory??>
                        <div class="box-header with-border">
                            <h3 class="box-title">修改分类目录<#if updateCategory??>[${updateCategory.name}]</#if></h3>
                        </div>
                        <form role="form" id="cateSaveForm">
                            <input type="hidden" name="categoryId" value="${updateCategory.categoryId?c}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="name">名称：</label>
                                    <input type="text" class="form-control" id="name" name="name" value="${updateCategory.name!}">
                                    <small>*页面上所显示的名称</small>
                                </div>
                                <div class="form-group">
                                    <label for="slugName">路径名称：</label>
                                    <input type="text" class="form-control" id="slugName" name="slugName" value="${updateCategory.slugName!}">
                                    <small>*这是文章路径上显示的名称，最好为英文</small>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="control-label">描述：</label>
                                    <textarea class="form-control" rows="3" id="description" name="description" style="resize: none">${updateCategory.description!}</textarea>
                                    <small>*添加描述，部分页面可显示</small>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm" onclick="save()">确定修改</button>
                                <a data-pjax="true" href="/admin/category" class="btn btn-info btn-sm ">返回添加</a>
                            </div>
                        </form>
                    <#else >
                        <div class="box-header with-border">
                            <h3 class="box-title">添加分类目录</h3>
                        </div>
                        <form role="form" id="cateSaveForm">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="name">名称：</label>
                                    <input type="text" class="form-control" id="name" name="name">
                                    <small>*页面上所显示的名称</small>
                                </div>
                                <div class="form-group">
                                    <label for="slugName">路径名称：</label>
                                    <input type="text" class="form-control" id="slugName" name="slugName">
                                    <small>*这是文章路径上显示的名称，最好为英文</small>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="control-label">描述：</label>
                                    <textarea class="form-control" rows="3" id="description" name="description" style="resize: none"></textarea>
                                    <small>*添加描述，部分主题可显示</small>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm" onclick="save()">确定添加</button>
                            </div>
                        </form>
                    </#if>
                </div>
            </div>
            <div class="col-md-7">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">所有分类目录</h3>
                    </div>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>名称</th>
                                    <th>路径</th>
                                    <th>描述</th>
                                    <th>网站数</th>
                                    <th>操作</th>
                                </tr>
                                <@commonTag method="categories">
                                    <#if categories?? && categories?size gt 0>
                                        <#list categories as cate>
                                            <tr>
                                                <td>${cate.name!}</td>
                                                <td>${cate.slugName!}</td>
                                                <td>${cate.description!}</td>
                                                <td>
                                                    <span class="label" style="background-color: #d6cdcd;">${cate.webSite?size}</span>
                                                </td>
                                                <td>
                                                    <#if updateCategory?? && updateCategory.categoryId?c==cate.categoryId?c>
                                                        <a href="javascript:void(0)" class="btn btn-primary btn-xs " disabled>修改中</a>
                                                    <#else >
                                                        <a href="/admin/category/edit?cateId=${cate.categoryId?c}" class="btn btn-primary btn-xs ">修改</a>
                                                    </#if>
                                                    <button class="btn btn-danger btn-xs " onclick="modelShow('/admin/category/remove?cateId=${cate.categoryId?c}')">删除</button>
                                                </td>
                                            </tr>
                                        </#list>
                                    </#if>
                                </@commonTag>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 删除确认弹出层 -->
    <div class="modal fade" id="removeCateModal">
        <div class="modal-dialog">
            <div class="modal-content message_align">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p>确定永久删除？(不可逆)</p>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="url"/>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                    <a onclick="removeIt()" class="btn btn-danger " data-dismiss="modal">确定</a>
                </div>
            </div>
        </div>
    </div>
</div>
<@footer>
<script type="application/javascript" id="footer_script">
    function modelShow(url) {
        $('#url').val(url);
        $('#removeCateModal').modal();
    }
    function removeIt(){
      window.location.href = $.trim($("#url").val());
    }
    function save() {
      var param = $("#cateSaveForm").serialize();
      $.post('/admin/category/save',param,function (data) {
        if (data.code === 1) {
            alert(data.msg);
            window.location.reload();
        } else {
            alert(data.msg);
        }
      },'JSON');
    }
</script>
</@footer>
</#compress>
