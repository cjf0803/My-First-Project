<%--
  Created by IntelliJ IDEA.
  User: 陈锦房
  Date: 2022/1/11
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/normal.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" /> <meta charset="utf-8" />
    <title>虎牙商城购物系统</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="/css/normal.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
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
    <script>
        function addLists() {
            var uname=$("#uname").val();
            var uphone=$("#uphone").val();
            var address=$("#address").val();
            if(confirm("是否提交？")){
                $.ajax({
                    url:'/lists/addLists',
                    data:'uphone='+uphone+'&address='+address+'&uname='+uname,
                    dataType:'text',
                    type:'post',
                    success:function (result) {
                        if(result=="true"){
                            alert("恭喜你，提交成功！")
                            location.href="/end.jsp";
                        }else {
                            alert("提交失败，请重新提交！")
                            window.location.reload();
                        }

                    }
                });
            }


        }
    </script>
</head>

<body>
<body class="user-select">
<section class="container-fluid">
    <header>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand" href="/goods/customerFindGoods" style="font-family: 'Matura MT Script Capitals';font-size: 50px">TigerCjf</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/cart/findCart">购物车<span class="badge">${count}</span></a></li>
                        <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${username}<span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
                            </ul>
                        </li>
                        <li><a href="/user/loginOut">退出登录</a></li>
                        <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
</section>
</body>

<div class="toPayMoneyBox wrap">
    <div class="content">
        <div class="toPayMoneyContent">
            <form action="/cart/findCart1" method="post" >
            <div class="toPayMoneyItem">
                <div class="line title">
                    <div class="item">产品图</div>
                    <div class="item item2">商品名称</div>
                    <div class="item">单价</div>
                    <div class="item">数量</div>
                    <div class="item">小计</div>
                </div>
                <c:forEach items="${list}" var="p">
                    <div class="line">
                        <div class="item">
                            <div class="itemProductItem">
                                <img src="/images/${p.gimage}">
                            </div>
                        </div>
                        <div class="item item2 productName">${p.gname}</div>
                        <div class="item price">￥${p.gprice}</div>
                        <div class="item number">${p.gnum}</div>
                        <div class="item totalPrice">￥${p.sum}</div>
                    </div>
                </c:forEach>
                <div class="totalLine">
                    <a href="/goods/customerFindGoods" class="toIndex fl">继续购物</a>

                    <div class="fl totalNumber">
                        共<span>${count}</span>件商品
                    </div>
                    <div class="pageBox">
                        <a href="/cart/findCart1?index=1">首页</a>
                        <c:if test="${index>1}">
                            <a href="/cart/findCart1?index=${index-1}">上页</a>
                        </c:if>
                        <c:if test="${index<totalPage}">
                            <a href="/cart/findCart1?index=${index+1}">下页</a>
                        </c:if >
                        <c:if test="${index!=totalPage}">
                            <a href="/cart/findCart1?index=${totalPage}">末页</a>
                        </c:if>
                    </div>
                </div>
                <div class="bottomPrice">
                    商品总计:   <span class="totalPrice" style="font-size: 30px">￥${totalSum}</span>
                </div>
            </div>
            </form>
            <div class="toChoosePayMethod">
                <div class="title">收货信息</div>
                <div class="getProductInfo">
                    <div class="line">
                        <div class="infoFlag">
                            收货人姓名:
                        </div>
                        <input type="text" name="uname" id="uname" placeholder=${username} autocomplete="off">
                    </div>
                    <div class="line">
                        <div class="infoFlag">
                            收货人电话:
                        </div>
                        <input type="text" name="uphone" id="uphone" placeholder="手机号" autocomplete="off" >
                    </div>
                    <div class="line">
                        <div class="infoFlag">
                            收货人地址:
                        </div>
                        <input type="text" name="address" id="address" placeholder="地址" autocomplete="off">
                    </div>
                </div>
                <div class="title">选择支付方式</div>
                <div class="payBox">
                    <form>
                        <div class="payItem">
                            <label>
                                <input type="radio" name="payMoney"/>
                                <span>支付宝</span>
                            </label>
                        </div>
                        <div class="payItem">
                            <label>
                                <input type="radio" name="payMoney"/>
                                <span>微信支付</span>
                            </label>
                        </div>
                        <div class="payItem">
                            <label>
                                <input type="radio" name="payMoney"/>
                                <span>京东支付</span>
                            </label>
                        </div>
                        <div class="payItem">
                            <label>
                                <input type="radio" name="payMoney"/>
                                <span>微信支付</span>
                            </label>
                        </div>
                        <div class="payItem">
                            <label>
                                <input type="radio" name="payMoney"/>
                                <span>京东支付</span>
                            </label>
                        </div>
                    </form>
                </div>
                <div class="toPayLine">
                    <div class="toPayBtn" onclick="addLists()">确认订单</div>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="commonFooter wrap">
    <div class="content">
        <div class="footerBox">
            <div class="line toolLinks">
                <div class="item">
                    <a href="#"><i class="iconfont">&#xe602;</i>预约维修服务</a>
                </div>
                <div class="item">
                    <a href="#"><i class="iconfont">&#xe612;</i>7天无理由退货</a>
                </div>
                <div class="item">
                    <a href="#"><i class="iconfont">&#xe601;</i>15天免费换货</a>
                </div>
                <div class="item">
                    <a href="#"><i class="iconfont">&#xe637;</i>满150元包邮</a>
                </div>
                <div class="item">
                    <a href="#"><i class="iconfont">&#xe600;</i>520余家售后网点</a>
                </div>
            </div>
            <div class="line toolNav">
                <div class="item">
                    <span>帮助中心</span>
                    <a href="#">账户管理</a>
                    <a href="#">购物指南</a>
                    <a href="#">订单操作</a>
                </div>
                <div class="item">
                    <span>服务支持</span>
                    <a href="#">售后政策</a>
                    <a href="#">自助服务</a>
                    <a href="#">相关下载</a>
                </div>
                <div class="item">
                    <span>线下门店</span>
                    <a href="#">虎牙商城之家</a>
                    <a href="#">虎牙商城网点</a>
                    <a href="#">授权体验店</a>
                </div>
                <div class="item">
                    <span>关于虎牙商城</span>
                    <a href="#">了解虎牙商城</a>
                    <a href="#">投资虎牙商城</a>
                    <a href="#">加入虎牙商城</a>
                </div>
                <div class="item toBigInfo">
                    <div class="infoLine">400-100-5678</div>
                    <div class="infoLine">周一至周日 8:00-18:00（仅收市话费）</div>
                    <div class="infoLine textCenter">
                        <div class="onlineService"><i class="iconfont">&#xe603;</i>在线客服</div>
                    </div>
                </div>
            </div>
            <div class="line copyRight">
                <div class="copyRightCon">
                    <div class="logo">
                        <a href="#" style="font-family: 'Matura MT Script Capitals';">TigerCjf</a>
                    </div>
                    <div class="copyNav">
                        <div class="copyNavline">
                            <a href="#">虎牙商城商城</a>
                            <a href="#">TigerCjf</a>
                            <a href="#">虎牙家</a>
                            <a href="#">多看</a>
                            <a href="#">虎牙商城天猫店</a>
                            <a href="#">虎牙商城商城</a>
                            <a href="#">TigerCjf</a>
                            <a href="#">虎牙家</a>
                            <a href="#">多看</a>
                            <a href="#">虎牙商城天猫店</a>
                        </div>
                        <div class="copyNavline">
                            <span>&copy;mi.com</span> <span>本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line hardWord">
                为发烧的互联网而生
            </div>
        </div>
    </div>
</div>
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
                            <td width="80%"><input type="text" value="${username}" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
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
            <div class="modal-body"> <img src="/images/favicon.ico" alt="深思熟虑" />
                <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/js/jquery-3.3.1.min.js"></script>

</html>
