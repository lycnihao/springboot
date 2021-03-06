<#compress >
    <#include "module/_macro.ftl">
    <@head>后台管理 | 附件管理</@head>
<div class="content-wrapper">
    <link rel="stylesheet" href="/static/plugins/fileinput/fileinput.min.css">
    <style type="text/css" rel="stylesheet">
      .div-thumbnail{transition:all .5s ease-in-out;padding:10px}
      .thumbnail{margin-bottom:0}
      .thumbnail img{
        width: 100%;
      }
    </style>
    <section class="content-header" id="animated-header">
      <h1 style="display: inline-block;">附件管理</h1>
      <a class="btn-header" id="showForm" href="javascript:void(0)">
        <i class="fa fa-cloud-upload" aria-hidden="true"></i>上传
      </a>|
      <a class="btn-header" id="search" href="javascript:void(0)">
        <i class="fa fa-search" aria-hidden="true"></i>筛选
      </a>
      <ol class="breadcrumb">
        <li><a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i>首页</a></li>
        <li class="active">附件管理</li>
      </ol>
    </section>
    <section class="content container-fluid" id="animated-content">
      <div class="box">
        <div class="box-body">
          <#--上传-->
          <div class="row" id="uploadForm" style="display: none;">
            <div class="col-md-12">
              <div class="form-group">
                <div class="file-loading">
                  <input id="uploadImg" class="file-loading" type="file" multiple name="file">
                </div>
              </div>
            </div>
          </div>
          <div class="row" id="searchForm" style="display: none;">
            <form class="form-horizontal">
              <div class="col-md-3">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">关键词:</label>

                  <div class="col-sm-9">
                    <input type="email" class="form-control input-sm" id="inputEmail3" >
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <button class="btn btn-sm btn-info">查询</button>
              </div>
            </form>
            </div>
          <#--显示-->
          <div class="row">
          <#list attachments.content as attachment>
              <div class="col-lg-1 col-md-2 col-sm-3 col-xs-3 div-thumbnail" onclick="layerModal('/admin/attachments/attachment?attachId=${attachment.attachId}','附件详情')">
                <a href="javascript:void(0)" class="thumbnail">
                  <img src="${attachment.attachSmallPath!}" class="img-responsive">
                </a>
              </div>
          </#list>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
              <div class="no-margin pull-left">
                第${attachments.number+1}/${attachments.totalPages}页
              </div>
              <div class="btn-group pull-right btn-group-sm" role="group">
                <a data-pjax="true" class="btn btn-default <#if !attachments.hasPrevious()>disabled</#if>" href="/admin/attachments" >
                  首页
                </a>
                <a data-pjax="true" class="btn btn-default <#if !attachments.hasPrevious()>disabled</#if>" href="/admin/attachments?page=${attachments.number-1}" >
                  上一页
                </a>
                <a data-pjax="true" class="btn btn-default <#if !attachments.hasNext()>disabled</#if>" href="/admin/attachments?page=${attachments.number+1}">
                  下一页
                </a>
                <a data-pjax="true" class="btn btn-default <#if !attachments.hasNext()>disabled</#if>" href="/admin/attachments?page=${attachments.totalPages-1}">
                  尾页
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</div>
<@footer>
<script src="/static/plugins/fileinput/fileinput.min.js"></script>
<script src="/static/plugins/fileinput/zh.min.js"></script>
<script>
      $('#uploadImg').fileinput({
        language: 'zh',
        uploadUrl: '/admin/attachments/upload',
        uploadAsync: true,
        allowedFileExtensions: ['jpg','gif','png','jpeg','svg','psd'],
        maxFileCount: 100,
        enctype : 'multipart/form-data',
        showClose: false
      }).on("filebatchuploadcomplete",function (event, files, extra) {
        $("#uploadForm").hide(400);
        alert("上传成功");
      });
      $("#showForm").click(function(){
        $("#uploadForm").slideToggle(400);
      });
      $("#search").click(function(){
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
    };

    function allAttachment() {
      var selectAll = $('#allBtn').prop('checked');
      window.location.href = "attachments?selectAll=" + selectAll;
    }
</script>
</@footer>
</#compress>
