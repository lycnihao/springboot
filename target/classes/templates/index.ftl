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
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#all" data-toggle="tab">常用推荐</a>
                </li>
                <li>
                    <a href="#designer" data-toggle="tab">社区资讯</a>
                </li>
                <li>
                    <a href="#PM" data-toggle="tab">灵感采集</a>
                </li>
                <li>
                    <a href="#subscribers" data-toggle="tab">素材资源</a>
                </li>
                <li>
                    <a href="#subscribers" data-toggle="tab">常用工具</a>
                </li>
                <li>
                    <a href="#subscribers" data-toggle="tab">学习教程</a>
                </li>
                <li>
                    <a href="#subscribers" data-toggle="tab">UED团队</a>
                </li>
            </ul>
            <div class="tab-content">
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
                            <tr>
                                <td class="user-cb">
                                    <input type="checkbox" class="cbr" name="members-list[]" value="1" checked />
                                </td>
                                <td class="user-image hidden-xs hidden-sm">
                                    <a href="#">
                                        <img src="/static/images/user-1.png" class="img-circle" alt="user-pic" />
                                    </a>
                                </td>
                                <td class="user-name">
                                    <a href="#" class="name">Adobe Photoshop</a>
                                    <span>Adobe公司开发的图像合成软件...</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">www.photoshop.com</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">设计师/设计工具</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <div class="label label-primary">tools</div>
                                    <div class="label label-primary">design</div>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">012</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">2017-08-01</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">Admin</span>
                                </td>
                                <td class="action-links">
                                    <a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});" class="edit"><i class="linecons-pencil"></i>编辑</a>
                                    <a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'static'});" class="delete"><i class="linecons-trash"></i>删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="user-cb">
                                    <input type="checkbox" class="cbr" name="members-list[]" value="1" checked />
                                </td>
                                <td class="user-image hidden-xs hidden-sm">
                                    <a href="#">
                                        <img src="/static/images/user-1.png" class="img-circle" alt="user-pic" />
                                    </a>
                                </td>
                                <td class="user-name">
                                    <a href="#" class="name">Adobe XD</a>
                                    <span>Adobe公司开发的网页设计软件...</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">www.photoshop.com</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">设计师/设计工具</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <div class="label label-primary">tools</div>
                                    <div class="label label-primary">design</div>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">012</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">2017-08-01</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">Admin</span>
                                </td>
                                <td class="action-links">
                                    <a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});" class="edit"><i class="linecons-pencil"></i>编辑</a>
                                    <a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'static'});" class="delete"><i class="linecons-trash"></i>删除</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="members-table-actions">
                                <div class="selected-items">
                                    已选中<span>2</span> 个项目
                                </div>
                                <div class="selected-actions">
                                    <a href="#" class="delete">删除</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 text-right text-center-sm">
                            <ul class="pagination pagination-sm no-margin">
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-left"></i>
                                    </a>
                                </li>
                                <li class="active">
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li class="disabled">
                                    <a href="#">4</a>
                                </li>
                                <li>
                                    <a href="#">5</a>
                                </li>
                                <li>
                                    <a href="#">6</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="designer">
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
                            <tr>
                                <td class="user-cb">
                                    <input type="checkbox" class="cbr" name="members-list[]" value="1" checked />
                                </td>
                                <td class="user-image hidden-xs hidden-sm">
                                    <a href="#">
                                        <img src="/static/images/user-1.png" class="img-circle" alt="user-pic" />
                                    </a>
                                </td>
                                <td class="user-name">
                                    <a href="#" class="name">Adobe XD</a>
                                    <span>Adobe公司开发的网页设计软件...</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">www.photoshop.com</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">设计师/设计工具</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <div class="label label-primary">tools</div>
                                    <div class="label label-primary">design</div>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">012</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">2017-08-01</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">Admin</span>
                                </td>
                                <td class="action-links">
                                    <a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});" class="edit"><i class="linecons-pencil"></i>编辑</a>
                                    <a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'static'});" class="delete"><i class="linecons-trash"></i>删除</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="members-table-actions">
                                <div class="selected-items">
                                    已选中<span>2</span> 个项目
                                </div>
                                <div class="selected-actions">
                                    <a href="#" class="delete">删除</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 text-right text-center-sm">
                            <ul class="pagination pagination-sm no-margin">
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-left"></i>
                                    </a>
                                </li>
                                <li class="active">
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li class="disabled">
                                    <a href="#">4</a>
                                </li>
                                <li>
                                    <a href="#">5</a>
                                </li>
                                <li>
                                    <a href="#">6</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="PM">
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
                            <tr>
                                <td class="user-cb">
                                    <input type="checkbox" class="cbr" name="members-list[]" value="1" checked />
                                </td>
                                <td class="user-image hidden-xs hidden-sm">
                                    <a href="#">
                                        <img src="/static/images/user-1.png" class="img-circle" alt="user-pic" />
                                    </a>
                                </td>
                                <td class="user-name">
                                    <a href="#" class="name">Adobe Photoshop</a>
                                    <span>Adobe公司开发的图像合成软件...</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">www.photoshop.com</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">设计师/设计工具</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <div class="label label-primary">tools</div>
                                    <div class="label label-primary">design</div>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">012</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">2017-08-01</span>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                    <span class="email">Admin</span>
                                </td>
                                <td class="action-links">
                                    <a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});" class="edit"><i class="linecons-pencil"></i>编辑</a>
                                    <a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'static'});" class="delete"><i class="linecons-trash"></i>删除</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="members-table-actions">
                                <div class="selected-items">
                                    已选中<span>2</span> 个项目
                                </div>
                                <div class="selected-actions">
                                    <a href="#" class="delete">删除</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 text-right text-center-sm">
                            <ul class="pagination pagination-sm no-margin">
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-left"></i>
                                    </a>
                                </li>
                                <li class="active">
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li class="disabled">
                                    <a href="#">4</a>
                                </li>
                                <li>
                                    <a href="#">5</a>
                                </li>
                                <li>
                                    <a href="#">6</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
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
<!-- Modal 6 (Long Modal)-->
<div class="modal fade" id="modal-6">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">编辑网站</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <script type="text/javascript">
                    jQuery(document).ready(function($) {
                        var i = 1,
                            $example_dropzone_filetable = $("#example-dropzone-filetable"),
                            example_dropzone = $("#advancedDropzone").dropzone({
                                url: 'data/upload-file.php',

                                // Events
                                addedfile: function(file) {
                                    if (i == 1) {
                                        $example_dropzone_filetable.find('tbody').html('');
                                    }

                                    var size = parseInt(file.size / 1024, 10);
                                    size = size < 1024 ? (size + " KB") : (parseInt(size / 1024, 10) + " MB");

                                    var $entry = $('<tr>\
                      <td class="text-center">' + (i++) + '</td>\
                      <td>' + file.name + '</td>\
                      <td><div class="progress progress-striped"><div class="progress-bar progress-bar-warning"></div></div></td>\
                      <td>' + size + '</td>\
                      <td>Uploading...</td>\
                    </tr>');

                                    $example_dropzone_filetable.find('tbody').append($entry);
                                    file.fileEntryTd = $entry;
                                    file.progressBar = $entry.find('.progress-bar');
                                },

                                uploadprogress: function(file, progress, bytesSent) {
                                    file.progressBar.width(progress + '%');
                                },

                                success: function(file) {
                                    file.fileEntryTd.find('td:last').html('<span class="text-success">Uploaded</span>');
                                    file.progressBar.removeClass('progress-bar-warning').addClass('progress-bar-success');
                                },

                                error: function(file) {
                                    file.fileEntryTd.find('td:last').html('<span class="text-danger">Failed</span>');
                                    file.progressBar.removeClass('progress-bar-warning').addClass('progress-bar-red');
                                }
                            });

                        $("#advancedDropzone").css({
                            minHeight: 200
                        });

                    });
                    </script>
                    <div class="col-md-12">
                        <div class="col-sm-4 text-center">
                            <div id="advancedDropzone" class="droppable-area">
                                选择图片
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="field-3" class="control-label">名称</label>
                                        <input type="text" class="form-control" id="field-3" placeholder="网站名称">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group no-margin">
                                        <label for="field-7" class="control-label">简介</label>
                                        <textarea class="form-control autogrow" id="field-7" placeholder="对此标签页的简介文字"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="field-3" class="control-label">网址</label>
                            <input type="text" class="form-control" id="field-3" placeholder="Https://">
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
</#compress>