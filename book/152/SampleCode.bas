
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>点击这里-简明Excel VBA</title>
<meta content='点击这里,简明Excel VBA' name='keywords'>
<meta content='点击这里,简明Excel VBA' name='description'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
<meta name="applicable-device" content="pc,mobile">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<meta name="renderer" content="webkit">
<link rel="stylesheet" href="/static/components/uikit-2.27.5/css/uikit.custom.css">
<link rel="stylesheet" href="/static/components/social-share/social-share.min.css">
<link rel="stylesheet" href="/static/components/highlight/styles/custom.css">
<link rel="stylesheet" href="/static/components/css/base.css">
<link rel="stylesheet" href="/static/components/css/reader.css">
<link rel="stylesheet" href="/static/components/css/markdown.css">
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5313208362165053" crossorigin="anonymous"></script>
</head>
<body>
<div class=" book-main-wrap uk-container uk-container-center uk-margin-top ">
<div class="uk-grid">
<div class="uk-width-1-1 reader-wrap ">
<div class=" bottom-nav uk-clearfix ">
<div class="uk-align-left ">
<a href="/book/152/README.md#1.5.3">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">1.5.3 GoTo语句</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/152/LICENSE">
<span class="">BY-NC-ND 4.0</span>
<i class="nav-icon-right uk-icon-small  uk-icon-caret-right"></i>
</a>
</div>
</div>
<div class="uk-text-center">
<h2 class="book-page-title uk-container-center">
<a href="/book/152/index.html">简明Excel VBA</a>
<a target="_blank" rel="nofollow" href="https://github.com/Youchien/concise-excel-vba" class="uk-icon-button uk-icon-github" title="github项目地址"></a>
</h2>
</div>
<script type="text/javascript" src="/static/components/js/app_intro.js"></script>
<ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-5313208362165053" data-ad-slot="1328047120"></ins>
<script>(adsbygoogle =window.adsbygoogle ||[]).push({});</script>
<hr class="uk-article-divider">
<div class="book-content-section  md-content-section  uk-margin-bottom">
<p>'------------------------------------- ' Creation date : 03/05/2017 (cn) ' Last update : 11/28/2018 (cn) ' Author(s) : Sekito.Lv ' Contributor(s): ' Tested on Excel 2016 '-------------------------------------</p>
<p>'------------------------------------- ' List of functions : ' - 1 - PublicHolidayFr ' - 2 - WorkingDay ' - 3 - WorkableDay ' - 4 - NextWorkingDay ' - 5 - NextWorkableDay ' - 6 - PrevWorkingDay ' - 7 - PrevWorkableDay '-------------------------------------</p>
<p>Option Explicit</p>
<p>'------------------------------------- ' Define all Constant variables '------------------------------------- Const WS_CONST_SHEET As String = "const" Const WS_ORIGINAL_DATA_SHEET As String = "Original" Const WS_DESIRED_OUT_SHEET As String = "Desired Output"</p>
<p>'------------------------------------------------------------------------------- ' The function PublicHolidayFr returns 1 if the date is a public holiday. ' If there is no DateDay parameter, the function returns 1 if the current date ' is a public holiday. ' Note : actually it's just for France '-------------------------------------------------------------------------------</p>
<p>Function PublicHolidayFr(Optional DateDay As Date) As Byte If DateDay = "00:00:00" Then DateDay = Date Dim res As Byte ' year Dim ye As Integer ye = year(DateDay) ' compute Paques day Dim Pa As Date Dim Mod4 As Integer, Mod7 As Integer, Mod9 As Integer Mod9 = (19 * (ye Mod 19) + 24) Mod 30 Mod4 = ye Mod 4 Mod7 = ye Mod 7 Pa = DateSerial(ye, 4, (Mod9 + (2 * Mod4 + 4 * Mod7 + 6 * Mod9 + 5) Mod 7) - 9) ' if Dateday is a public holiday Select Case DateDay Case Is = DateSerial(ye, 1, 1): res = 1 Case Is = DateSerial(ye, 5, 1): res = 1 Case Is = DateSerial(ye, 5, 8): res = 1 Case Is = DateSerial(ye, 7, 14): res = 1 Case Is = DateSerial(ye, 8, 15): res = 1 Case Is = DateSerial(ye, 11, 1): res = 1 Case Is = DateSerial(ye, 11, 11): res = 1 Case Is = DateSerial(ye, 12, 25): res = 1 Case Is = Pa: res = 1 ' Dimanche Paques Case Is = Pa + 1: res = 1 ' Lundi de Paques Case Is = Pa + 39: res = 1 ' Ascension Case Is = Pa + 49: res = 1 ' Pentecôte Case Is = Pa + 50: res = 1 ' Lundi de Pentecôte Case Else res = 0 End Select ' return result PublicHolidayFr = res End Function</p>
<p>'------------------------------------------------------------------------------- ' The function WorkingDay returns 1 if the date is a Working Day (Monday =&gt; Friday). ' If there is no DateDay parameter, the function returns 1 if the current date is a Working Day. '-------------------------------------------------------------------------------</p>
<p>Function WorkingDay(Optional DateDay As Date) As Byte If DateDay = "00:00:00" Then DateDay = Date Dim res As Byte Dim nda As Byte Dim phl As Byte phl = PublicHolidayFr(DateDay) nda = Weekday(DateDay, vbMonday) If (nda = 6 Or nda = 7 Or phl = 1) Then res = 0 Else res = 1 End If WorkingDay = res End Function</p>
<p>'------------------------------------------------------------------------------- ' The function WorkableDay returns 1 if the date is a Workable Day (Monday =&gt; Saturday). ' If there is no DateDay parameter, the function returns 1 if the current date is a Workable Day. '-------------------------------------------------------------------------------</p>
<p>Function WorkableDay(Optional DateDay As Date) As Byte If DateDay = "00:00:00" Then DateDay = Date Dim res As Byte Dim nda As Byte Dim phl As Byte phl = PublicHolidayFr(DateDay) nda = Weekday(DateDay, vbMonday) If (nda = 7 Or phl = 1) Then res = 0 Else res = 1 End If WorkableDay = res End Function</p>
<p>'------------------------------------------------------------------------------- ' The function NextWorkingDay returns the date in parameter if it's a Working Day and ' not a public holiday or the next Working Day if not. ' If there is no DateDay parameter, the function returns the next Working Day for the current date. '-------------------------------------------------------------------------------</p>
<p>Function NextWorkingDay(Optional DateDay As Date) As Date If DateDay = "00:00:00" Then DateDay = Date Dim res As Date Dim wda As Byte, wda1 As Byte, wda2 As Byte, wda3 As Byte, wda4 As Byte wda = WorkingDay(DateDay) wda1 = WorkingDay(DateDay + 1) wda2 = WorkingDay(DateDay + 2) wda3 = WorkingDay(DateDay + 3) wda4 = WorkingDay(DateDay + 4) If wda = 1 Then res = DateDay ElseIf wda1 = 1 Then res = DateDay + 1 ElseIf wda2 = 1 Then res = DateDay + 2 ElseIf wda3 = 1 Then res = DateDay + 3 ElseIf wda4 = 1 Then res = DateDay + 4 End If NextWorkingDay = res End Function</p>
<p>'------------------------------------------------------------------------------- ' The function NextWorkableDay returns the date in parameter if it's a Workable Day and ' not a public holiday or the next Workable Day if not. ' If there is no DateDay parameter, the function returns the next Workable Day for the current date. '-------------------------------------------------------------------------------</p>
<p>Function NextWorkableDay(Optional DateDay As Date) As Date If DateDay = "00:00:00" Then DateDay = Date Dim res As Date Dim wda As Byte, wda1 As Byte, wda2 As Byte, wda3 As Byte wda = WorkableDay(DateDay) wda1 = WorkableDay(DateDay + 1) wda2 = WorkableDay(DateDay + 2) wda3 = WorkableDay(DateDay + 3) If wda = 1 Then res = DateDay ElseIf wda1 = 1 Then res = DateDay + 1 ElseIf wda2 = 1 Then res = DateDay + 2 ElseIf wda3 = 1 Then res = DateDay + 3 End If NextWorkableDay = res End Function</p>
</div>
<hr class="uk-article-divider">
<div class="uk-block uk-block-muted uk-padding-top-remove uk-padding-bottom-remove uk-margin-large-top  book-recommend-wrap">
<div class="uk-margin-top uk-margin-bottom uk-margin-left uk-margin-right">
<div class="uk-margin uk-text-muted "><i class="uk-icon-outdent uk-icon-justify uk-margin-small-right"></i>书籍推荐</div>
<div class="books">
<ul class="uk-book-list">
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/200/index.html">
<img class="uk-book-cover" src="/static/icons/48/code_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/200/index.html">软件开发基础知识宝典</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/112.html">frank-lam</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="code">code</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">20页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2021年10月24日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 0个">0</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/205/index.html">
<img class="uk-book-cover" src="/static/icons/48/code_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/205/index.html">从0到1实战微服务架构</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/115.html">skyline75489</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="code">code</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="java">java</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="mysql">mysql</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="netty">netty</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="nginx">nginx</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">62页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2021年10月24日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 1个">1</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/185/index.html">
<img class="uk-book-cover" src="/static/icons/48/code_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/185/index.html">技术面试必备基础知识、Leetcode 题解、后端面试、Java 面试、春招、秋招、操作系统、计算机网络、系统设计</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/104.html">CyC2018</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="code">code</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">11页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2019年5月26日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 63551个">63551</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/107/index.html">
<img class="uk-book-cover" src="/static/icons/48/laravel_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/107/index.html">Laravel 源码详解</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/62.html">tzivanmoe</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="laravel">laravel</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">42页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年7月1日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 4个">4</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/22/index.html">
<img class="uk-book-cover" src="/static/icons/48/cplusplus_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/22/index.html">计算与推断思维</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/17.html">Kivy Developers From China</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="cplusplus">cplusplus</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">19页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 243个">243</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/36/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/36/index.html">米斯特白帽培训讲义</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/15.html">wizardforcel</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">24页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 99个">99</span>
</div>
</div>
</div>
</li>
<hr>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<nav class="tm-navbar uk-navbar uk-navbar-attached reader-nav">
<div class="uk-float-left uk-margin-small-top">
<a href="javascript:;" title="目录菜单" class="show-menu  uk-icon-hover  uk-icon-align-justify uk-margin-right"></a>
<div data-uk-dropdown="{mode:'click',pos:'bottom-left'}" class="font-setting-wrap">
<a class="uk-icon-hover uk-icon-font uk-margin-right" aria-label="字体设置" href="javascript:;"></a>
<div class="uk-dropdown dropdown-menu">
<div class="dropdown-caret"><span class="caret-outer"></span><span class="caret-inner"></span></div>
<div class="buttons uk-clearfix">
<button class="uk-button-link button size-2 font-reduce">小字</button>
<button class="uk-button-link button size-2 font-enlarge">大字</button>
</div>
<hr>
<div class="buttons uk-clearfix">
<button class="uk-button-link button size-2 font-1 ">宋体</button>
<button class="uk-button-link button size-2 font-2 ">黑体</button>
</div>
<hr>
<div class="buttons uk-clearfix">
<button class="uk-button-link button size-3 color-theme-sun "><i class="uk-icon-sun-o"></i>白天</button>
<button class="uk-button-link button size-3 color-theme-eye "><i class="uk-icon-eye"></i>护眼</button>
<button class="uk-button-link button size-3 color-theme-moon "><i class="uk-icon-moon-o"></i>夜晚</button></div>
</div>
</div>
<a class="logo uk-margin-right" href="/" title="返回首页"><img class="" src="/static/components/images/icon_32.png" /></a>
</div>
<div class="uk-navbar-flip  uk-hidden-small">
<div id="share-box"></div>
</div>
</nav>
<div id="menu-id" class="uk-offcanvas reader-offcanvas">
<div class="uk-offcanvas-bar">
<ul class="book-menu-bar uk-nav uk-nav-offcanvas" data-uk-nav>
<li>
<a href="/book/152/index.html" data-book-page-rel-url="index.html" data-book-page-id="0" title="封面">封面</a>
</li>
<li>
<a class="pjax" href="/book/152/readme.html" data-book-page-rel-url="readme.html" data-book-page-id="0" title="简介">简介</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#explanation" title="0x01 语法说明" data-book-page-rel-url="README.md#explanation" data-book-page-id="10502">0x01 语法说明</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.1" title="1.1 数据和数据类型" data-book-page-rel-url="README.md#1.1" data-book-page-id="10503">1.1 数据和数据类型</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.2" title="1.2 常量和变量" data-book-page-rel-url="README.md#1.2" data-book-page-id="10504">1.2 常量和变量</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.3" title="1.3 数组" data-book-page-rel-url="README.md#1.3" data-book-page-id="10505">1.3 数组</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.4" title="1.4 运算符" data-book-page-rel-url="README.md#1.4" data-book-page-id="10506">1.4 运算符</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.5" title="1.5 语句结构" data-book-page-rel-url="README.md#1.5" data-book-page-id="10507">1.5 语句结构</a>
<ul>
<li>
<a class="pjax" href="/book/152/README.md#1.5.1" title="1.5.1 选择语句" data-book-page-rel-url="README.md#1.5.1" data-book-page-id="10508">1.5.1 选择语句</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.5.2" title="1.5.2 循环语句" data-book-page-rel-url="README.md#1.5.2" data-book-page-id="10509">1.5.2 循环语句</a>
</li>
</ul>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.6" title="1.6 过程(Sub)和函数(Function)" data-book-page-rel-url="README.md#1.6" data-book-page-id="10511">1.6 过程(Sub)和函数(Function)</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.7" title="1.7 正则表达式(Regular Expression)" data-book-page-rel-url="README.md#1.7" data-book-page-id="10512">1.7 正则表达式(Regular Expression)</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.8" title="1.8 注释（Comments code）" data-book-page-rel-url="README.md#1.8" data-book-page-id="10513">1.8 注释（Comments code）</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.9" title="1.9 补充" data-book-page-rel-url="README.md#1.9" data-book-page-id="10514">1.9 补充</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.10" title="1.10 示例" data-book-page-rel-url="README.md#1.10" data-book-page-id="10515">1.10 示例</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#layout" title="0x02 VBA界面介绍" data-book-page-rel-url="README.md#layout" data-book-page-id="10516">0x02 VBA界面介绍</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#2.1" title="2.1 整体界面说明" data-book-page-rel-url="README.md#2.1" data-book-page-id="10517">2.1 整体界面说明</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#2.2" title="2.2 工程资源管理器（Project Explore）说明" data-book-page-rel-url="README.md#2.2" data-book-page-id="10518">2.2 工程资源管理器（Project Explore）说明</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#2.3" title="2.3 设置VBA Macro Project 密码保护" data-book-page-rel-url="README.md#2.3" data-book-page-id="10519">2.3 设置VBA Macro Project 密码保护</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#2.4" title="2.4 常用快捷栏及窗口设置" data-book-page-rel-url="README.md#2.4" data-book-page-id="10520">2.4 常用快捷栏及窗口设置</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#object-option" title="0x03 对象操作说明" data-book-page-rel-url="README.md#object-option" data-book-page-id="10521">0x03 对象操作说明</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#3.1" title="3.1 对象简述" data-book-page-rel-url="README.md#3.1" data-book-page-id="10522">3.1 对象简述</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#3.2" title="3.2 Application对象" data-book-page-rel-url="README.md#3.2" data-book-page-id="10523">3.2 Application对象</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#string-option" title="0x04 字符串 String 相关常用操作" data-book-page-rel-url="README.md#string-option" data-book-page-id="10524">0x04 字符串 String 相关常用操作</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#4.1" title="4.1 Trim" data-book-page-rel-url="README.md#4.1" data-book-page-id="10525">4.1 Trim</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#4.2" title="4.2 Instr 和 InStrRev (类似indexOf函数)" data-book-page-rel-url="README.md#4.2" data-book-page-id="10526">4.2 Instr 和 InStrRev (类似indexOf函数)</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#4.3" title="4.3 Mid (类似substring函数)" data-book-page-rel-url="README.md#4.3" data-book-page-id="10527">4.3 Mid (类似substring函数)</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#4.4" title="4.4 Left 和 Right" data-book-page-rel-url="README.md#4.4" data-book-page-id="10528">4.4 Left 和 Right</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#4.5" title="4.5 Replace" data-book-page-rel-url="README.md#4.5" data-book-page-id="10529">4.5 Replace</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#4.6" title="4.6 StrReverse 倒转函数" data-book-page-rel-url="README.md#4.6" data-book-page-id="10530">4.6 StrReverse 倒转函数</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#4.7" title="4.7 其他字符串函数" data-book-page-rel-url="README.md#4.7" data-book-page-id="10531">4.7 其他字符串函数</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#excel-option" title="0x05 Excel 相关常用操作" data-book-page-rel-url="README.md#excel-option" data-book-page-id="10597">0x05 Excel 相关常用操作</a>
<ul>
<li>
<a class="pjax" href="/book/152/README.md#5.1" title="5.1 Excel 基础操作" data-book-page-rel-url="README.md#5.1" data-book-page-id="10598">5.1 Excel 基础操作</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#5.2" title="5.2 打开Excel两种方式" data-book-page-rel-url="README.md#5.2" data-book-page-id="10599">5.2 打开Excel两种方式</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#5.3" title="5.3 操作Excel工作表（Worksheet）" data-book-page-rel-url="README.md#5.3" data-book-page-id="10600">5.3 操作Excel工作表（Worksheet）</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#5.4" title="5.4 Excel AutoFilter / Excel 自动筛选操作" data-book-page-rel-url="README.md#5.4" data-book-page-id="10601">5.4 Excel AutoFilter / Excel 自动筛选操作</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#5.5" title="5.5 清理Excel数据相关操作" data-book-page-rel-url="README.md#5.5" data-book-page-id="10602">5.5 清理Excel数据相关操作</a>
</li>
</ul>
</li>
<li>
<a class="pjax" href="/book/152/README.md#0x06" title="0x06 文件 相关常用操作" data-book-page-rel-url="README.md#0x06" data-book-page-id="10603">0x06 文件 相关常用操作</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#6.1" title="6.1 判断文件，文件夹等是否存在" data-book-page-rel-url="README.md#6.1" data-book-page-id="10604">6.1 判断文件，文件夹等是否存在</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#6.2" title="6.2 文件相关操作" data-book-page-rel-url="README.md#6.2" data-book-page-id="10605">6.2 文件相关操作</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#6.3" title="6.3 文件夹相关操作" data-book-page-rel-url="README.md#6.3" data-book-page-id="10606">6.3 文件夹相关操作</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#6.4" title="6.4 其他操作（获取文件名等）" data-book-page-rel-url="README.md#6.4" data-book-page-id="10607">6.4 其他操作（获取文件名等）</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#0x07" title="0x07 VBA Best Practices" data-book-page-rel-url="README.md#0x07" data-book-page-id="10608">0x07 VBA Best Practices</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#0x08" title="0x08 Trouble shooting" data-book-page-rel-url="README.md#0x08" data-book-page-id="10609">0x08 Trouble shooting</a>
<ul>
<li>
<a class="pjax" href="/book/152/README.md#8.1" title="8.1 消除Excel保存时警告（Privacy Warning:this document contains macros...）" data-book-page-rel-url="README.md#8.1" data-book-page-id="10610">8.1 消除Excel保存时警告（Privacy Warning:this document contains macros...）</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#8.2" title="8.2 清除Excel数据透视表中过滤器缓存（旧项目）" data-book-page-rel-url="README.md#8.2" data-book-page-id="10611">8.2 清除Excel数据透视表中过滤器缓存（旧项目）</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#8.3" title="8.3 解决办法：The macros in this project are disabled. Please refer to ..." data-book-page-rel-url="README.md#8.3" data-book-page-id="10612">8.3 解决办法：The macros in this project are disabled. Please refer to ...</a>
</li>
</ul>
</li>
<li>
<a class="pjax" href="/book/152/README.md#0x09" title="0x09 VBA示例代码" data-book-page-rel-url="README.md#0x09" data-book-page-id="10613">0x09 VBA示例代码</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#docslist" title="0xFF 学习资源列表" data-book-page-rel-url="README.md#docslist" data-book-page-id="10614">0xFF 学习资源列表</a>
</li>
<li>
<a class="pjax" href="/book/152/README.md#1.5.3" title="1.5.3 GoTo语句" data-book-page-rel-url="README.md#1.5.3" data-book-page-id="10510">1.5.3 GoTo语句</a>
</li>
<li>
<a class="pjax" href="/book/152/SampleCode.bas" title="点击这里" data-book-page-rel-url="SampleCode.bas" data-book-page-id="10615">点击这里</a>
</li>
<li>
<a class="pjax" href="/book/152/LICENSE" title="BY-NC-ND 4.0" data-book-page-rel-url="LICENSE" data-book-page-id="10616">BY-NC-ND 4.0</a>
</li>
</ul>
</div>
</div>
<script src="https://cdn.staticfile.net/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/static/components/uikit-2.27.5/js/uikit.reader.js"></script>
<script type="text/javascript" src="/static/components/social-share/social-share.min.js"></script>
<script>(function(){var bp =document.createElement('script');var curProtocol =window.location.protocol.split(':')[0];if (curProtocol ==='https') {bp.src ='https://zz.bdstatic.com/linksubmit/push.js';}
else {bp.src ='http://push.zhanzhang.baidu.com/push.js';}
var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(bp,s);})();</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
<script src="https://cdn.staticfile.net/highlight.js/9.12.0/highlight.min.js"></script>
<script src="https://cdn.staticfile.net/jquery.pjax/2.0.1/jquery.pjax.min.js"></script>
<script src="https://cdn.staticfile.net/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="https://cdn.staticfile.net/uikit/2.27.5/js/components/lightbox.min.js"></script>
<link rel="dns-prefetch" href="//cdn.mathjax.org" />
<script type="text/x-mathjax-config">
 function initMathJax() {
    var mathId = $("book-content-section")[0];
    MathJax.Hub.Config({
        tex2jax: {skipTags: ['script', 'noscript', 'style', 'textarea', 'pre','code','a']},
        showProcessingMessages: false,
        messageStyle: "none"
    });
    MathJax.Hub.Queue(["Typeset",MathJax.Hub,mathId]);
 };
initMathJax();
</script>
<script src='https://cdn.staticfile.net/mathjax/2.7.4/MathJax.js?config=TeX-AMS-MML_HTMLorMML' async></script>
<style>
	.MathJax_Display{display:inline!important;}
</style>
<script type="text/javascript" src="/static/components/js/reader.js"></script>
<script type="text/javascript">var bookId =152;var bookPageId =10615;var bookPageRelUrl ='SampleCode.bas';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>