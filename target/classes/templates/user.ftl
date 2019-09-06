<#compress >
    <link rel="stylesheet" href="/static/plugins/select2/css/select2.min.css">
    <#include "module/_macro.ftl">
    <@head>小红衣后台管理 | 用户管理</@head>
    <div class="content-wrapper">
      <section class="content-header" id="animated-header">
        <h1 style="display: inline-block;">用户</h1>
        <a class="btn btn-xs btn-info"  href="javascript:;" onclick="jQuery('#addModal').modal('show', {backdrop: 'static'});">
          <i class="fa fa-plus"></i>添加用户 </a>
        <ol class="breadcrumb">
          <li>
            <a data-pjax="true" href="javascript:void(0)"><i class="fa fa-dashboard"></i> 首页</a>
          </li>
          <li class="active">用户列表</li>
        </ol>
      </section>
      <section class="content" id="animated-content">
        <div class="row">
            <div class="col-md-12">
              <div class="box">
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th></th>
                            <th>头像</th>
                            <th>用户名</th>
                            <th>昵称</th>
                            <th>邮箱</th>
                            <th>QQ</th>
                            <th>用户状态</th>
                            <th>最后登陆</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                          <#list users as user>
                          <tr>
                            <td class="user-cb">
                              <input type="checkbox" name="ids" value="${user.userId}"/>
                            </td>
                            <td>
                              <a href="javascript:;">
                                <img src="/static/images/user-5.png" class="direct-chat-img" alt="user-pic" />
                              </a>
                            </td>
                            <td>
                              ${user.username}
                            </td>
                            <td>
                              ${user.nickname}
                            </td>
                            <td>
                              ${user.email}
                            </td>
                            <td>
                              <#-- 判断是否为空 -->
                              <#if user.qq??>
                                ${user.qq ? c}
                              <#else>
                                - -
                              </#if>
                            </td>
                            <td>
                              ${(user.status == 1) ?string ("<span class='text-green'><i class='fa fa-circle'></i>正常</span>","<span class='text-danger'><i class='fa fa-circle'></i>禁用</span>")}
                            </td>
                            <td>
                              <#-- 判断是否为空 -->
                              <#if user.lastLoginTime??>
                                ${(user.lastLoginTime)?string("yyyy-MM-dd")}
                              <#else> - - </#if>
                            </td>
                            <td class="action-user">
                              <a href="javascript:;" onclick="jQuery('#updateModal').modal('show', {backdrop: 'static',id:${user.userId}});" class="btn bg-olive btn-flat"><i class="linecons-pencil"></i>查看编辑</a>
                              <a href="javascript:;" onclick="jQuery('#deleteModal').modal('show', {backdrop: 'static',id:${user.userId}});" class="btn btn-danger"><i class="linecons-trash"></i>删除</a>
                            </td>
                          </tr>
                          </#list>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer">
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
            <h4 class="modal-title">新增用户</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">
                <div class="col-sm-4 text-center">
                  <div class="upload-img">
                    <img id="userAvatar" class="profile-img img-responsive img-circle pointer" src="/static/images/user-5.png" alt="User profile picture">
                    <span class="upload-img-text" onclick="layerModal('/admin/attachments/select?id=icon','选择附件')">选择图片</span>
                  </div>
                </div>
                <div class="col-sm-8">
                  <div class="row">
                    <div class="col-md-12">
                      <label for="username" class="control-label">用户名</label>
                      <div class="input-group input-group-sm">
                        <input id="username" name="username" type="text" class="form-control" placeholder="用户唯一凭证">
                        <span class="input-group-btn">
                              <button type="button" class="btn btn-info btn-flat" onclick="repeat('#username')">检测</button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group no-margin">
                        <label for="nickname" class="control-label">昵称</label>
                        <input class="form-control" id="nickname" placeholder="昵称">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="first-password" class="control-label">密码</label>
                  <input type="text" class="form-control" id="first-password" placeholder="请输入密码">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="password" class="control-label">确认密码</label>
                  <input type="text" class="form-control" id="password" name="password" placeholder="再次输入密码">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="qq" class="control-label">联系QQ</label>
                  <input type="text" class="form-control" id="qq" name="qq" placeholder="qq">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="email" class="control-label">邮箱</label>
                  <input type="text" class="form-control" id="email" name="email" placeholder="邮箱">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="categories" class="control-label">角色</label>
                  <select id="categories" class="categories form-control" multiple="multiple" style="width: 100%;">
                    <option value="1">1</option>
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
                <div class="row">
                  <div class="col-md-12">
                    <input id="u-userId" type="hidden">
                    <div class="col-sm-4 text-center">
                      <div class="upload-img">
                        <img id="u-userAvatar" class="profile-img img-responsive img-circle pointer" src="/static/images/user-5.png" alt="User profile picture">
                        <span class="upload-img-text" onclick="layerModal('/admin/attachments/select?id=icon','选择附件')">选择图片</span>
                      </div>
                    </div>
                    <div class="col-sm-8">
                      <div class="row">
                        <div class="col-md-12">
                          <label for="u-username" class="control-label">用户名</label>
                          <div class="input-group input-group-sm">
                            <input id="u-username" name="u-username" type="text" class="form-control" placeholder="用户唯一凭证">
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-info btn-flat" onclick="repeat('#u-username','#u-userId')">检测</button>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group no-margin">
                            <label for="u-nickname" class="control-label">昵称</label>
                            <input class="form-control" id="u-nickname" placeholder="昵称">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="u-qq" class="control-label">联系QQ</label>
                      <input type="text" class="form-control" id="u-qq" name="u-qq" placeholder="qq">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="email" class="control-label">邮箱</label>
                      <input type="text" class="form-control" id="u-email" name="u-email" placeholder="邮箱">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="u-categories" class="control-label">角色</label>
                      <select id="u-categories" class="categories form-control" multiple="multiple" style="width: 100%;">
                        <option value="1">1</option>
                      </select>
                    </div>
                  </div>
                </div>
                  <div class="row">
                    <div class="form-group col-md-12">
                      <ul style="list-style: none;padding: 0px;margin: 0px;">
                        <li style="padding: 0;margin: 0px;list-style: none;display: inline-block;">
                          <div class="pretty p-default">
                            <input name="u-status" id="u-status" type="checkbox" class="minimal" value="1">
                            <div class="state p-primary">
                              <label>启用</label>
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
            <h4 class="modal-title">删除用户</h4>
          </div>
          <div class="modal-body"><input id="user-id" type="hidden">
            确定要删除这个用户吗!
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
            $.get('user/updateData/' + id,{},function (result) {

                $('#u-userId').val(result.userId);
                $('#u-username').val(result.username);
                $('#u-nickname').val(result.nickname);
                $('#u-userAvatar').attr('src',result.userAvatar);
                $('#u-qq').val(result.qq);
                $('#u-email').val(result.email);

                if(result.status == 1)
                    $('#u-status').prop('checked', true);
            });
        });

        $('#deleteModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)[0];
            var id = button.id;
            var modal = $(this);
            modal.find('#user-id').val(id);
        });

        $("#update").click(function () {
            var userId = $('#u-userId').val();
            var username = $('#u-username').val();
            var nickname =  $('#u-nickname').val();
            var userAvatar =  $('#u-userAvatar').attr('src');
            var qq = $('#u-qq').val();
            var email = $('#u-email').val();
            var status = $('#u-status').prop('checked');
            var data = {'userId':userId,'username':username,'nickname':nickname,'userAvatar':userAvatar,'qq':qq,'email':email,'status':status == true ? 1:0};
            $.ajax({
                url:'user/update',
                type:'post',
                data:data,
                success:function (result) {
                    alert("修改成功！");
                    window.location.reload();
                }
            });

        });

        $("#add").click(function () {
          var username = $('#username').val();
          var nickname =  $('#nickname').val();
          var userAvatar =  $('#userAvatar').attr('src');
          var password = $('#password').val();
          var email = $('#email').val();
          var data = {'username':username,'nickname':nickname,'userAvatar':userAvatar,'password':password,'email':email};
            $.ajax({
                url:'user/save',
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
                url:'user/delete/'+$("#user-id").val(),
                type:'post',
                data:{},
                success:function (result) {
                    alert("删除成功！");
                    window.location.reload();
                }
            });
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
        
        function repeat(username,userId) {
          var data = {};
          if (userId !== ''){
            data.userId = $(userId).val();
            data.username = $(username).val();
          } else {
            data.username = $(username).val();
          }
          console.log(data);
          $.ajax({
            url:'user/repeat/',
            type:'GET',
            data:data,
            success:function (result) {
                if(result.code){
                  alert("可用")
                } else {
                  alert("不可用")
                }
            }
          });
        }
    </script>

</#compress>