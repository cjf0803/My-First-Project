<%--
  Created by IntelliJ IDEA.
  User: 陈锦房
  Date: 2022/1/6
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>虎牙商城管理系统</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/layui.css" />
    <link rel="stylesheet" href="css/master.css" />
    <link rel="stylesheet" href="/css/gloable.css" />
    <link rel="stylesheet" href="/css/nprogress.css" />
    <link rel="stylesheet" href="/css/blog.css" />
    <link rel="apple-touch-icon-precomposed" href="/images/favicon.ico">
    <link rel="shortcut icon" href="/images/favicon.ico">
    <script src="/js/jquery-2.1.4.min.js"></script>
    <script src="/js/admin-scripts.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--[if gte IE 9]>
    <script src="/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="/js/respond.min.js" type="text/javascript"></script>
    <script src="/js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href="#";</script>
    <![endif]-->
</head>

<body class="user-select">
<section class="container-fluid">
    <header>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand" href="#" style="font-family: 'Matura MT Script Capitals';font-size: 50px">TigerCjf</a> </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="">消息 <span class="badge">1</span></a></li>
                        <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">admin <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
                            </ul>
                        </li>
                        <li><a href="/user/loginOut" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
                        <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="row">
        <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="/information.jsp">信息总览</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="userMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户管理</a>
                    <ul class="dropdown-menu" aria-labelledby="userMenu">
                        <li><a href="/user/findUser">管理用户组</a></li>
                        <li><a href="/user/findUser">管理用户</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/userindexlogin.jsp">管理登录日志</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">商品管理</a>
                    <ul class="dropdown-menu" aria-labelledby="otherMenu">
                        <li><a href="/goods/findGoods">商品总览</a></li>
                        <li><a href="/goods/findGoodsAllDetails">商品详情</a></li>
                        <li><a href="/addgoods1.jsp">商品上架</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="itemMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">订单管理</a>
                    <ul class="dropdown-menu" aria-labelledby="otherMenu">
                        <li><a href="/lists/findLists">订单总览</a></li>
                        <li><a href="/lists/findListsAllDetails">订单详情</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="/category.jsp">学习栏</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="otherMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
                    <ul class="dropdown-menu" aria-labelledby="otherMenu">
                        <li><a href="/link.jsp">友情链接</a></li>
                        <li><a href="/userindexlogin.jsp">访问记录</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
                    <ul class="dropdown-menu" aria-labelledby="settingMenu">
                        <li><a href="/setting.jsp">基本设置</a></li>
                        <li><a href="/setting.jsp">用户设置</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/setting.jsp">安全配置</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="disabled"><a>扩展菜单</a></li>
                    </ul>
                </li>
            </ul>
        </aside>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
                <form action="/goods/findByGimage" method="post" >
                    <h1 class="page-header">这是商品管理</h1>
                    <ol class="breadcrumb">
                        <li><a href="/addgoods1.jsp">点击添加新商品#</a></li>
                    </ol>
                    <h1 class="page-header">商品详情展示 <span class="badge">7</span></h1>
                    <div class="doc-container" id="doc-container">
                        <div class="container-fixed">
                            <div class="col-content">
                                <div class="inner">
                                    <article class="article-lists bloglist" id="LAY_bloglist" >
                                        <c:forEach items="${list}" var="p">
                                            <section class="article-item zoomIn article">
                                                <div class="fc-flag">置顶</div>
                                                <h5 class="title">
                                                    <span class="fc-blue">【精品】</span>
                                                    <a href="#">虎牙商城好物推荐</a>
                                                </h5>
                                                <div class="time">
                                                    <span class="day">1</span>
                                                    <span class="month fs-18">1<span class="fs-14">月</span></span>
                                                    <span class="year fs-18 ml10">2022</span>
                                                </div>
                                                <div class="content">
                                                    <a href="#" class="cover img-light">
                                                        <img src="/images/${p.gimage}">
                                                    </a>
                                                    <tr>
                                                        <input type="checkbox" id="checkbox[]" name="checkbox[]" />
                                                        <div class="time" >
                                                <span class="day" style="font-size:25px; margin-right: 160px;">商品id:-#${p.gid}号商品#-
                                                </span>
                                                        </div>

                                                        </br>
                                                        </br>


                                                        <div style="font-size:20px;">
                                                   <span class="fc-blue" style="font-family: '微軟正黑體';margin-left: 50px">
                                                         商品名: ${p.gname}
                                                   </span>
                                                        </div>


                                                        <td>
                                                            <div style="font-size: 20px;">
                                                    <span class="fc-red" style="font-family: 'Impact';margin-left: 50px">
                                                    商品价格: ${p.gprice}
                                                    </span>
                                                            </div>
                                                        </td>
                                                        <div style="font-size: 20px;">
                                                    <span class="fc-black" style="font-family: 'Magneto';margin-left: 50px">
                                                    商品库存: ${p.count}
                                                    </span>
                                                        </div>
                                                        <div style="font-size: 20px;">
                                                    <span style="font-family: 'Arimo';margin-left: 50px;color: #fbb611">
                                                    商品生产时间: ${p.createtime}
                                                    </span>
                                                        </div>
                                                        <div style="font-size: 20px;">
                                                    <span style="font-family: 'Bahnschrift' ;margin-left: 50px;color: #b952c5">
                                                    商品描述: ${p.gdesc}
                                                    </span>
                                                        </div>

                                                    </tr>
                                                </div>

                                            </section>
                                        </c:forEach>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form action="" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >个人信息</h4>
                </div>
                <div class="modal-body">
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr> </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td wdith="20%">姓名:</td>
                            <td width="80%"><input type="text" value="陈锦房" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">用户名:</td>
                            <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">电话:</td>
                            <td width="80%"><input type="text" value="19816280861" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">旧密码:</td>
                            <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">新密码:</td>
                            <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">确认密码:</td>
                            <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr></tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >登录记录</h4>
            </div>
            <div class="modal-body">
                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr>
                        <th>登录IP</th>
                        <th>登录时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>::1:55570</td>
                        <td>2016-01-08 15:50:28</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:64377</td>
                        <td>2016-01-08 10:27:44</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:64027</td>
                        <td>2016-01-08 10:19:25</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:57081</td>
                        <td>2016-01-06 10:35:12</td>
                        <td>成功</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
    <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
            </div>
            <div class="modal-body" style="text-align:center"> <img src="/images/weixin.jpg" alt="" style="cursor:pointer;height: 300px;width: 250px"/> </div>
        </div>
    </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
            </div>
            <div class="modal-body"> <img src="images/favicon.ico" alt="深思熟虑" />
                <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>