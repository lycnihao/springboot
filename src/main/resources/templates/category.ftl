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
                            <h3 class="box-title">修改分类目录<#if updateCategory??>[${updateCategory.cateName}]</#if></h3>
                        </div>
                        <form role="form" id="cateSaveForm">
                            <input type="hidden" name="cateId" value="${updateCategory.cateId?c}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="cateName">名称：</label>
                                    <input type="text" class="form-control" id="cateName" name="cateName" value="${updateCategory.cateName!}">
                                    <small>*页面上所显示的名称</small>
                                </div>
                                <div class="form-group">
                                    <label for="cateUrl">路径名称：</label>
                                    <input type="text" class="form-control" id="cateUrl" name="cateUrl" value="${updateCategory.cateUrl!}">
                                    <small>*这是文章路径上显示的名称，最好为英文</small>
                                </div>
                                <div class="form-group">
                                    <label for="cateDesc" class="control-label">描述：</label>
                                    <textarea class="form-control" rows="3" id="cateDesc" name="cateDesc" style="resize: none">${updateCategory.cateDesc!}</textarea>
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
                                    <label for="cateName">名称：</label>
                                    <input type="text" class="form-control" id="cateName" name="cateName">
                                    <small>*页面上所显示的名称</small>
                                </div>
                                <div class="form-group">
                                    <label for="cateUrl">路径名称：</label>
                                    <input type="text" class="form-control" id="cateUrl" name="cateUrl">
                                    <small>*这是文章路径上显示的名称，最好为英文</small>
                                </div>
                                <div class="form-group">
                                    <label for="cateDesc" class="control-label">描述：</label>
                                    <textarea class="form-control" rows="3" id="cateDesc" name="cateDesc" style="resize: none"></textarea>
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
                                                <td>${cate.cateName!}</td>
                                                <td>${cate.cateUrl!}</td>
                                                <td>${cate.cateDesc!}</td>
                                                <td>
                                                    <span class="label" style="background-color: #d6cdcd;">${cate.posts?size}</span>
                                                </td>
                                                <td>
                                                    <#if updateCategory?? && updateCategory.cateId?c==cate.cateId?c>
                                                        <a href="javascript:void(0)" class="btn btn-primary btn-xs " disabled><@spring.message code='common.btn.editing' /></a>
                                                    <#else >
                                                        <a data-pjax="true" href="/admin/category/edit?cateId=${cate.cateId?c}" class="btn btn-primary btn-xs "><@spring.message code='common.btn.modify' /></a>
                                                    </#if>
                                                    <button class="btn btn-danger btn-xs " onclick="modelShow('/admin/category/remove?cateId=${cate.cateId?c}')"><@spring.message code='common.btn.delete' /></button>
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

    }
    function save() {

    }
</script>
</@footer>
</#compress>
