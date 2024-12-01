
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>总结-Shell 编程范例</title>
<meta content='总结,Shell 编程范例' name='keywords'>
<meta content='总结,Shell 编程范例' name='description'>
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
<a href="/book/44/zh/chapters/01-chapter9.markdown">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">用户管理</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/44/zh/appendix/02-chapter1.markdown">
<span class="">附录</span>
<i class="nav-icon-right uk-icon-small  uk-icon-caret-right"></i>
</a>
</div>
</div>
<div class="uk-text-center">
<h2 class="book-page-title uk-container-center">
<a href="/book/44/index.html">Shell 编程范例</a>
<a target="_blank" rel="nofollow" href="https://github.com/tinyclub/open-shell-book" class="uk-icon-button uk-icon-github" title="github项目地址"></a>
</h2>
</div>
<script type="text/javascript" src="/static/components/js/app_intro.js"></script>
<ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-5313208362165053" data-ad-slot="1328047120"></ins>
<script>(adsbygoogle =window.adsbygoogle ||[]).push({});</script>
<hr class="uk-article-divider">
<div class="book-content-section  md-content-section  uk-margin-bottom">
<h1 id="总结">总结</h1>
<ul>
<li><a href="#toc_30143_27506_1">前言</a></li>
<li><a href="#toc_30143_27506_2">Shell 编程范例回顾</a></li>
<li><a href="#toc_30143_27506_3">常用 Shell 编程“框架”</a></li>
<li><a href="#toc_30143_27506_4">程序优化技巧</a></li>
<li><a href="#toc_30143_27506_5">其他注意事项</a></li>
</ul>
<p><span id="toc_30143_27506_1"></span></p>
<h2 id="前言">前言</h2>
<p>到这里，整个 Shell 编程系列就要结束了，作为总结篇，主要回顾一下各个小节的主要内容，并总结出 Shell 编程的一些常用框架和相关注意事项等。</p>
<p><span id="toc_30143_27506_2"></span></p>
<h2 id="shell-编程范例回顾">Shell 编程范例回顾</h2>
<p>TODO：主要回顾各小节的内容。</p>
<p><span id="toc_30143_27506_3"></span></p>
<h2 id="常用-shell-编程框架">常用 Shell 编程“框架”</h2>
<p>TODO：通过分析一些实例总结各种常见问题的解决办法，比如如何保证同一时刻每个程序只有一个运行实体（进程）。</p>
<p><span id="toc_30143_27506_4"></span></p>
<h2 id="程序优化技巧">程序优化技巧</h2>
<p>TODO：多思考，总会有更简洁和高效的方式。</p>
<p><span id="toc_30143_27506_5"></span></p>
<h2 id="其他注意事项">其他注意事项</h2>
<p>TODO：比如小心 <code>rm -rf</code> 的用法，如何查看系统帮助等。</p>
<h3 id="正确使用-source-和-">正确使用 <code>source</code> 和 <code>.</code></h3>
<p>仅使用 <code>source</code> 和 <code>.</code> 来执行你的环境配置等功能，建议不要用于其它用途。 在Shell中使用脚本时，使用 <code>bash your_script.sh</code> 而不是 <code>source your_script.sh</code> 或 <code>. your_script.sh</code>。</p>
<p>当使用 <code>bash</code> 的时候，当前的Shell会创建一个新的子进程执行你的脚本；当使用 <code>source</code> 和 <code>.</code> 时，当前的Shell会直接解释执行 <code>your_script.sh</code> 中的代码。如果 <code>your_script.sh</code> 中包含了类似 <code>exit 0</code> 这样的代码，使用<code>source</code> 和 <code>.</code> 执行会导致当前Shell意外地退出。</p>
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
<a href="/book/104/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/104/index.html">Linux 内核揭密</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/63.html">ye11ow</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">83页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年6月29日</span>
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
<a href="/book/191/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/191/index.html">Linux秘传心法</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/107.html">trimstray</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">81页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2019年5月26日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 20277个">20277</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/114/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/114/index.html">Linux 内核揭密</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/62.html">tzivanmoe</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">86页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年7月1日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 2个">2</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/17/index.html">
<img class="uk-book-cover" src="/static/icons/48/go_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/17/index.html">Go语言博客实践</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/12.html">achun</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="go">go</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">30页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 298个">298</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/169/index.html">
<img class="uk-book-cover" src="/static/icons/48/python_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/169/index.html">PyTorch 1.0 中文文档 & 教程</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/18.html">ApacheCN</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="python">python</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">87页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2019年5月26日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 874个">874</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/84/index.html">
<img class="uk-book-cover" src="/static/icons/48/java_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/84/index.html">Java后端开发笔记</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/54.html">shunliz</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="java">java</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">18页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年6月24日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 0个">0</span>
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
<a href="/book/44/index.html" data-book-page-rel-url="index.html" data-book-page-id="0" title="封面">封面</a>
</li>
<li>
<a class="pjax" href="/book/44/readme.html" data-book-page-rel-url="readme.html" data-book-page-id="0" title="简介">简介</a>
</li>
<li>
<a class="pjax" href="/book/44/README.md" title="简介" data-book-page-rel-url="README.md" data-book-page-id="2880">简介</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/preface/01-chapter0.markdown" title="版本修订历史" data-book-page-rel-url="zh/preface/01-chapter0.markdown" data-book-page-id="2881">版本修订历史</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/preface/01-chapter1.markdown" title="前言" data-book-page-rel-url="zh/preface/01-chapter1.markdown" data-book-page-id="2882">前言</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter1.markdown" title="准备工作" data-book-page-rel-url="zh/chapters/01-chapter1.markdown" data-book-page-id="2883">准备工作</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter2.markdown" title="数值运算" data-book-page-rel-url="zh/chapters/01-chapter2.markdown" data-book-page-id="2884">数值运算</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter3.markdown" title="布尔运算" data-book-page-rel-url="zh/chapters/01-chapter3.markdown" data-book-page-id="2885">布尔运算</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter4.markdown" title="字符串操作" data-book-page-rel-url="zh/chapters/01-chapter4.markdown" data-book-page-id="2886">字符串操作</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter5.markdown" title="文件操作" data-book-page-rel-url="zh/chapters/01-chapter5.markdown" data-book-page-id="2887">文件操作</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter6.markdown" title="文件系统操作" data-book-page-rel-url="zh/chapters/01-chapter6.markdown" data-book-page-id="2888">文件系统操作</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter7.markdown" title="进程操作" data-book-page-rel-url="zh/chapters/01-chapter7.markdown" data-book-page-id="2889">进程操作</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter8.markdown" title="网络操作" data-book-page-rel-url="zh/chapters/01-chapter8.markdown" data-book-page-id="2890">网络操作</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter9.markdown" title="用户管理" data-book-page-rel-url="zh/chapters/01-chapter9.markdown" data-book-page-id="2891">用户管理</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/chapters/01-chapter10.markdown" title="总结" data-book-page-rel-url="zh/chapters/01-chapter10.markdown" data-book-page-id="2892">总结</a>
</li>
<li>
<a class="pjax" href="/book/44/zh/appendix/02-chapter1.markdown" title="附录" data-book-page-rel-url="zh/appendix/02-chapter1.markdown" data-book-page-id="2893">附录</a>
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
<script type="text/javascript">var bookId =44;var bookPageId =2892;var bookPageRelUrl ='zh/chapters/01-chapter10.markdown';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>