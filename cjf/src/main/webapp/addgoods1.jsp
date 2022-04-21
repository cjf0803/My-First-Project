<%--
  Created by IntelliJ IDEA.
  User: 陈锦房
  Date: 2022/1/7
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>添加商品</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/login1.css">
    <link rel="stylesheet" href="/css/sign-up-login.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/inputEffect.css" />
    <link rel="stylesheet" href="/css/tooltips.css" />
    <link rel="stylesheet" href="/css/spop.min.css" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/snow.js"></script>
    <script src="/js/jquery.pure.tooltips.js"></script>
    <script src="/js/spop.min.js"></script>
    <script>

        $(function() {
            $('#login #login-password').focus(function() {
                $('.login-owl').addClass('password');
            }).blur(function() {
                $('.login-owl').removeClass('password');
            });
            $('#login #register-password').focus(function() {
                $('.register-owl').addClass('password');
            }).blur(function() {
                $('.register-owl').removeClass('password');
            });
            $('#login #register-repassword').focus(function() {
                $('.register-owl').addClass('password');
            }).blur(function() {
                $('.register-owl').removeClass('password');
            });
            $('#login #forget-password').focus(function() {
                $('.forget-owl').addClass('password');
            }).blur(function() {
                $('.forget-owl').removeClass('password');
            });
        });

        function goto_register(){
            $("#register-username").val("");
            $("#register-password").val("");
            $("#register-repassword").val("");
            $("#register-code").val("");
            $("#tab-2").prop("checked",true);
        }

        function goto_login(){
            $("#login-username").val("");
            $("#login-password").val("");
            $("#tab-1").prop("checked",true);
        }


        //商品添加
        function register() {
            var gimage=$("#register-gimage").val();
            var gname=$("#register-gname").val();
            var gprice=$("#register-gprice").val();
            var count=$("#register-count").val();
            var createtime=$("#register-createtime").val();
            var gdesc=$("#register-gdesc").val();
            if(confirm("是否添加商品？")){
                $.ajax({
                    url:'/goods/addGoods',
                    data:'gimage='+gimage+'&gname='+gname+'&gprice='+gprice+'&count='+count+'&createtime='+createtime+'&gdesc='+gdesc,
                    dataType:'text',
                    type:'post',
                    success:function (result) {
                        if(result=="true"){
                            alert("恭喜您，添加成功！")
                            location.href="/goods/findGoods";
                        }else {
                            alert("添加失败，请重新添加！")
                            location.href="addgoods1.jsp";
                        }

                    }
                });
            }


        }
    </script>
    <style type="text/css">
        html{width: 100%; height: 100%;}
        body{

            background-repeat: no-repeat;

            background-position: center center ;

            background-color: #00BDDC;

            background-image: url(images/snow.jpg);

            background-size: 100% 100%;

        }

        .snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

    </style>
    <script>
        window.onload = function(){
            var loginDiv = document.getElementById('login');
             var btn = document.getElementById('btn');
            var div = document.getElementById('div');
            btn.onclick = function(){
                loginDiv.style.display = "block";
                div.style.display = "block";
            }
        }
    </script>
</head>
<body>
<div id="div" style="display:none;position:absolute;width:100%;height:100%;background:rgba(0,0,0,.5)"></div>

<button id="btn" class="btn btn-primary" >点击进入</button>

<!-- 雪花背景 -->
<div class="snow-container"></div>
<!-- 登录控件 -->
<div id="login" style="display:none">
    <input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
    <input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
    <input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
    <div class="wrapper">
        <!-- 登录页面 -->
        <div class="login sign-in-htm">
            <form class="container offset1 loginform">
                <div class="form-actions">
                    <a tabindex="4" class="btn pull-left btn-link text-muted">欢迎进入虎牙商城后台商品添加-></a>
                    <a tabindex="5" class="btn btn-primary" onClick="goto_register()">商品添加</a>
<%--                    <input class="btn btn-primary" type="button" tabindex="3" onClick="login()" value="登录"--%>
<%--                           style="color:white;"/>--%>
                </div>
            </form>
        </div>
        <!-- 商品添加页面 -->
        <div class="login sign-up-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="register-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" name="gimage" id="register-gimage"
                                       autocomplete="off" placeholder="请输入要添加的商品图片" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-gimage">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" name="gname" id="register-gname" autocomplete="off" placeholder="请输入要添加的商品名" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-gname">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" name="gprice" id="register-gprice" autocomplete="off" placeholder="请输入要添加的商品价格" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-gprice">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" name="count" id="register-count" autocomplete="off" placeholder="请输入要添加的商品库存"/>
								<label class="input__label input__label--hideo" for="register-count">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="date"  name="createtime" id="register-createtime" autocomplete="off" placeholder="请输入要添加的商品生产日期"/>
								<label class="input__label input__label--hideo" for="register-createtime">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" name="gdesc" id="register-gdesc" autocomplete="off" placeholder="请输入要添加的商品描述"/>
								<label class="input__label input__label--hideo" for="register-gdesc">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回</a>
                    <input class="btn btn-primary" type="button" onClick="register()" value="提交"
                           style="color:white;"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
