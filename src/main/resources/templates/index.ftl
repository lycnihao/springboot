<#compress >
    <#include "module/_macro.ftl">
    <@head>小红衣后台管理 | 首页</@head>
    <div class="content-wrapper">
      <section class="content-header" id="animated-header">
        <h1 style="display: inline-block;">仪表盘</h1>
        <a class="btn-header" id="btnWidgetsOption" href="javascript:void(0)">
          部件选项 </a>
        <ol class="breadcrumb">
          <li>
            <a href="/admin"><i class="fa fa-dashboard"></i> 首页</a>
          </li>
          <li class="active">仪表盘</li>
        </ol>
      </section>
      <section class="content" id="animated-content">
        <div class="row">
          <div class="col-lg-12 col-xs-12" id="widgetOptionsPanel" style="display: none;">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">部件选项</h3>
              </div>
              <form class="form-horizontal" id="widgetsOption">
                <div class="box-body">
                  <div class="col-sm-6 col-xs-6">
                    <div class="form-group">
                      <label for="widgetPostCount" class="col-sm-4 control-label">文章总数：</label>
                      <div class="col-sm-8 control-radio">
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_postcount" id="widgetPostCount" value="true" checked="">
                          <div class="state p-primary">
                            <label>显示</label>
                          </div>
                        </div>
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_postcount" id="widgetPostCount" value="false">
                          <div class="state p-primary">
                            <label>隐藏</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="widgetCommentCount" class="col-sm-4 control-label">评论总数：</label>
                      <div class="col-sm-8 control-radio">
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_commentcount" id="widgetCommentCount" value="true" checked="">
                          <div class="state p-primary">
                            <label>显示</label>
                          </div>
                        </div>
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_commentcount" id="widgetCommentCount" value="false">
                          <div class="state p-primary">
                            <label>隐藏</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="widgetAttachmentCount" class="col-sm-4 control-label">附件总数：</label>
                      <div class="col-sm-8 control-radio">
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_attachmentcount" id="widgetAttachmentCount" value="true" checked="">
                          <div class="state p-primary">
                            <label>显示</label>
                          </div>
                        </div>
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_attachmentcount" id="widgetAttachmentCount" value="false">
                          <div class="state p-primary">
                            <label>隐藏</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="widgetDayCount" class="col-sm-4 control-label">成立天数：</label>
                      <div class="col-sm-8 control-radio">
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_daycount" id="widgetDayCount" value="true" checked="">
                          <div class="state p-primary">
                            <label>显示</label>
                          </div>
                        </div>
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_daycount" id="widgetDayCount" value="false">
                          <div class="state p-primary">
                            <label>隐藏</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-xs-6">
                    <div class="form-group">
                      <label for="widgetPostLastest" class="col-sm-4 control-label">最新文章：</label>
                      <div class="col-sm-8 control-radio">
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_postlastest" id="widgetPostLastest" value="true" checked="">
                          <div class="state p-primary">
                            <label>显示</label>
                          </div>
                        </div>
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_postlastest" id="widgetPostLastest" value="false">
                          <div class="state p-primary">
                            <label>隐藏</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="widgetCommentLastest" class="col-sm-4 control-label">最新评论：</label>
                      <div class="col-sm-8 control-radio">
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_commentlastest" id="widgetCommentLastest" value="true" checked="">
                          <div class="state p-primary">
                            <label>显示</label>
                          </div>
                        </div>
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_commentlastest" id="widgetCommentLastest" value="false">
                          <div class="state p-primary">
                            <label>隐藏</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="widgetLogsLastest" class="col-sm-4 control-label">最新日志：</label>
                      <div class="col-sm-8 control-radio">
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_logslastest" id="widgetLogsLastest" value="true" checked="">
                          <div class="state p-primary">
                            <label>显示</label>
                          </div>
                        </div>
                        <div class="pretty p-default p-round">
                          <input type="radio" name="widget_logslastest" id="widgetLogsLastest" value="false">
                          <div class="state p-primary">
                            <label>隐藏</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="box-footer">
                  <button type="button" class="btn btn-primary pull-right" onclick="saveOptions('widgetsOption')">保存</button>
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-3 col-xs-6" id="widgetPostCountBody">
            <div class="small-box bg-aqua">
              <div class="inner"><h3><@articleTag method="linksCount">${linksCount!0}</@articleTag></h3><p>网站</p></div>
              <div class="icon"><i class="ion ion-bag"></i></div>
              <a data-pjax="true" href="/admin/links" class="small-box-footer" data-pjax-state="">查看所有 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <div class="col-lg-3 col-xs-6" id="widgetCommentCountBody">
            <div class="small-box bg-green">
              <div class="inner"><h3><@articleTag method="linksCount">${linksCount!0}</@articleTag></h3><p>评论</p></div>
              <div class="icon"><i class="ion ion-stats-bars"></i></div>
              <a data-pjax="true" href="/admin/comments" class="small-box-footer" data-pjax-state="">查看所有 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
            <div class="small-box bg-yellow">
              <div class="inner"><h3><@articleTag method="linksCount">${linksCount!0}</@articleTag></h3><p>附件</p></div>
              <div class="icon"><i class="ion ion-person-add"></i></div>
              <a data-pjax="true" href="/admin/attachments" class="small-box-footer" data-pjax-state="">上传图片 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <div class="col-lg-3 col-xs-6" id="widgetDayCountBody">
            <div class="small-box bg-red">
              <div class="inner"><h3 id="blogStart"><@articleTag method="linksCount">${linksCount!0}</@articleTag></h3><p>成立天数</p></div>
              <div class="icon"><i class="ion ion-pie-graph"></i></div>
              <a href="javascript:void(0)" class="small-box-footer" data-toggle="modal" data-target="#blogInfo">2019-08-02 <i class="fa fa-star"></i></a>
            </div>
          </div>
        </div>
      </section>
    </div>
    <@footer>
    <script type="application/javascript">
      $('#btnWidgetsOption').click(function () {
        $('#widgetOptionsPanel').slideToggle(400);
      });
    </script>
    </@footer>

</#compress>