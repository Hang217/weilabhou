<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="/WEB-INF/tlds/c.tld" %>
<%@ taglib prefix="fn"  uri="/WEB-INF/tlds/fn.tld"  %>
<%@ taglib prefix="fmt" uri="/WEB-INF/tlds/fmt.tld"  %>
<%@ taglib prefix="pg"  uri="/WEB-INF/tlds/pager-taglib.tld" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	application.setAttribute("ctx", path);
%>
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <title>微信小程序的实验室设备管理系统</title>
    <script type="text/javascript">
        //<![CDATA[
        try {
            if (!window.CloudFlare) {
                var CloudFlare = [{
                    verbose: 0,
                    p: 0,
                    byc: 0,
                    owlid: "cf",
                    bag2: 1,
                    mirage2: 0,
                    oracle: 0,
                    paths: {
                        cloudflare: "/cdn-cgi/nexp/dok2v=1613a3a185/"
                    },
                    atok: "1668c19642567e08c574f5d9458345a2",
                    petok: "3285f1db20753df31d6fcdae6015a30e5a60a785-1419101748-1800",
                    zone: "nyasha.me",
                    rocket: "0",
                    apps: {
                        "ga_key": {
                            "ua": "UA-50530436-1",
                            "ga_bs": "2"
                        }
                    }
                }];
                CloudFlare.push({
                    "apps": {
                        "ape": "86d42e0b8c0027bb178361fce707fc15"
                    }
                });
                !function (a, b) {
                    a = document.createElement("script"), b = document.getElementsByTagName("script")[0], a.async = !0, a.src = "js/cloudflare.min.js", b.parentNode.insertBefore(a, b)
                }()
            }
        } catch (e) {
        }
        ;
        //]]>
    </script>
    <link rel="stylesheet" href="<%=path%>/admin/static/vendor/offline/theme.css">
    <link rel="stylesheet" href="<%=path%>/admin/static/vendor/pace/theme.css">
    <link rel="stylesheet" href="<%=path%>/admin/static/vendor/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="<%=path%>/admin/static/vendor/bxslider/jquery.bxslider.css">


    <link rel="stylesheet" href="<%=path%>/admin/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/admin/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=path%>/admin/static/css/animate.min.css">

    <link rel="stylesheet" href="<%=path%>/admin/static/css/panel.css">

    <link rel="stylesheet" href="<%=path%>/admin/static/css/skins/palette.1.css" id="skin">
    <link rel="stylesheet" href="<%=path%>/admin/static/css/fonts/style.1.css" id="font">
    <link rel="stylesheet" href="<%=path%>/admin/static/css/main.css">

    <!--[if lt IE 9]>
    <script src="<%=path%>/admin/static/js/html5shiv.js"></script>
    <script src="<%=path%>/admin/static/js/respond.min.js"></script>
    <![endif]-->

    <script src="<%=path%>/admin/static/vendor/modernizr.js"></script>
    <script type="text/javascript">

        (function (b) {
            (function (a) {
                "__CF" in b && "DJS" in b.__CF ? b.__CF.DJS.push(a) : "addEventListener" in b ? b.addEventListener("load", a, !1) : b.attachEvent("onload", a)
            })(function () {
                "FB" in b && "Event" in FB && "subscribe" in FB.Event && (FB.Event.subscribe("edge.create", function (a) {
                    _gaq.push(["_trackSocial", "facebook", "like", a])
                }), FB.Event.subscribe("edge.remove", function (a) {
                    _gaq.push(["_trackSocial", "facebook", "unlike", a])
                }), FB.Event.subscribe("message.send", function (a) {
                    _gaq.push(["_trackSocial", "facebook", "send", a])
                }));
                "twttr" in b && "events" in twttr && "bind" in twttr.events && twttr.events.bind("tweet", function (a) {
                    if (a) {
                        var b;
                        if (a.target && a.target.nodeName == "IFRAME") a: {
                            if (a = a.target.src) {
                                a = a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);
                                b = 0;
                                for (var c; c = a[b]; ++b)
                                    if (c.indexOf("url") === 0) {
                                        b = unescape(c.split("=")[1]);
                                        break a
                                    }
                            }
                            b = void 0
                        }
                        _gaq.push(["_trackSocial", "twitter", "tweet", b])
                    }
                })
            })
        })(window);
        /* ]]> */
    </script>
</head>

<body>
<div class="app" data-sidebar="locked">
    <header class="header header-fixed navbar">
        <div class="brand">
            <a href="javascript:;" class="fa fa-bars off-left visible-xs" data-toggle="off-canvas" data-move="ltr"></a>
            <a href="#" class="navbar-brand text-white">
                <span class="heading-font">
                    <b>实验室设备管理系统</b>
                </span>
            </a>
        </div>
        
        <ul class="nav navbar-nav navbar-right off-right">
            <li class="hidden-xs">
                <a href="javascript:;">
                    	登录名：
                    	<font color="red">
							${sessionScope.name}                    	
                    	</font>
                    	&nbsp;&nbsp;&nbsp;&nbsp;登录身份：
                    	<font color="green">
							${sessionScope.identity}      
                    	</font>
                </a>
            </li>
            <li class="quickmenu">
                <a href="javascript:;" data-toggle="dropdown">
                    <img src="<%=path %>/admin/static/img/avatar.jpg" class="avatar pull-left img-circle" alt="user" title="user">
                    <i class="caret mg-l-xs hidden-xs no-margin"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-right mg-r-xs">
                    <li class="divider"></li>
                    <li>
                        <a href="<%=path %>/login_tuichu.action">退出</a>
                    </li>
                </ul>
            </li>
        </ul>        
        
        
        
    </header>
    <section class="layout">
        	<aside class="sidebar canvas-left">
        		 <!-- 左边菜单 -->
        		<jsp:include page="left.jsp"></jsp:include>
       	 	</aside>
	        <section class="main-content">
	            <div class="content-wrap">
	            <!-- 页面 -->
			      <iframe src="<%=path %>/admin/readme.jsp" frameborder="0" width="100%" height="100%"  name="main" id="main">
		          </iframe>	   
	             </div>
	        </section>
    </section>
</div>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/bootstrap/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/jquery.placeholder.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/fastclick.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/moment.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/skycons.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/jquery.blockUI.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/raphael.min.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/morris/morris.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/switchery/switchery.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/jquery.slimscroll.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/bxslider/jquery.bxslider.min.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/offline/offline.min.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/vendor/pace/pace.min.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/js/off-canvas.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/js/panel.js"></script>
	<script src="<%=request.getContextPath()%>/admin/static/js/dashboard.js"></script>
	<script type="text/javascript" src="<%=path%>/js/pintuer.js"></script>
</body>
</html>