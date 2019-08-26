<aside class="main-sidebar">
  <section class="sidebar">
    <div class="user-panel">
      <div class="pull-left image">
        <img src="/static/images/user-1.png" class="img-circle" alt="User Image">
      </div>
      <div class="pull-left info">
        <p>admin</p><a data-pjax="true" href="/admin/profile" data-pjax-state=""><i class="fa fa-circle text-success"></i>个人资料</a>
      </div>
    </div>
    <ul class="sidebar-menu tree" data-widget="tree">
      <li class="header">MENUS</li>
      <li class="menu-item" >
        <a data-pjax="true" href="/admin" data-pjax-state="">
          <i class="fa fa-dashboard"></i>
          <span>仪表盘</span>
        </a>
      </li>
      <li class="menu-item">
        <a data-pjax="true" href="/admin/links" data-pjax-state="">
          <i class="fa fa-external-link"></i>
          <span>网站</span>
        </a>
      </li>
      <li class="menu-item">
        <a data-pjax="true" href="/admin/category" data-pjax-state="">
          <i class="fa fa-external-link"></i>
          <span>分类</span>
        </a>
      </li>
      <li class="menu-item">
        <a data-pjax="true" href="/admin/attachments" data-pjax-state="">
          <i class="fa fa-picture-o"></i>
          <span>附件</span>
        </a>
      </li>
      <li class="menu-item">
        <a data-pjax="true" href="/admin/comments" data-pjax-state="">
          <i class="fa fa-comment"></i>
          <span>评论</span>
          <span class="pull-right-container">
</span>
        </a>
      </li>
      <li class="menu-item treeview">
        <a data-pjax="true" href="javascript:void(0)" data-pjax-state="">
          <i class="fa fa-paint-brush"></i>
          <span>外观</span>
          <span class="pull-right-container">
<i class="fa fa-angle-left pull-right"></i>
</span>
        </a>
        <ul class="treeview-menu">
          <li><a data-pjax="true" href="/admin/themes" data-pjax-state=""><i class="fa fa-circle-o"></i>主题</a></li>
          <li><a data-pjax="true" href="/admin/menus" data-pjax-state=""><i class="fa fa-circle-o"></i>菜单</a></li>
          <li><a data-pjax="true" href="/admin/themes/editor" data-pjax-state=""><i class="fa fa-circle-o"></i>主题编辑</a></li>
        </ul>
      </li>
      <li class="menu-item treeview">
        <a data-pjax="true" href="javascript:void(0)" data-pjax-state="">
          <i class="fa fa-user-o"></i>
          <span>用户</span>
          <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu">
          <li><a data-pjax="true" href="/admin/profile" data-pjax-state=""><i class="fa fa-circle-o"></i>个人资料</a></li>
        </ul>
      </li>
      <li class="menu-item treeview">
        <a data-pjax="true" href="javascript:void(0)" data-pjax-state="">
          <i class="fa fa-cog"></i>
          <span>设置</span>
          <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu">
          <li><a data-pjax="true" href="/admin/option" data-pjax-state=""><i class="fa fa-circle-o"></i>博客设置</a></li>
          <li><a data-pjax="true" href="/admin/backup" data-pjax-state=""><i class="fa fa-circle-o"></i>博客备份</a></li>
          <li><a data-pjax="true" href="/admin/tools" data-pjax-state=""><i class="fa fa-circle-o"></i>小工具</a></li>
        </ul>
      </li>
    </ul>
  </section>
</aside>
<script>
  let url = window.location.href;
  let start = url.lastIndexOf('/');
  let title = url.substring(start+1,url.length);
  let navs = document.getElementsByClassName("menu-item");
  for(let card of navs){
    let href = card.getElementsByTagName('a')[0].href;
    let l_title = href.substring(href.lastIndexOf('/') + 1,href.length);
    if (l_title.indexOf(title) > -1){
      card.classList.add("active");
    }
  }
</script>