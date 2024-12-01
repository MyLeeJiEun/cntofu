
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>准备工作-Shell 编程范例</title>
<meta content='准备工作,Shell 编程范例' name='keywords'>
<meta content='准备工作,Shell 编程范例' name='description'>
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
<a href="/book/44/zh/preface/01-chapter1.markdown">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">前言</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/44/zh/chapters/01-chapter2.markdown">
<span class="">数值运算</span>
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
<h1 id="准备工作">准备工作</h1>
<ul>
<li><a href="#toc_22391_32127_1">前言</a></li>
<li><a href="#toc_22391_32127_2">什么是 Shell</a></li>
<li><a href="#toc_22391_32127_3">搭建运行环境</a></li>
<li><a href="#toc_22391_32127_4">基本语法介绍</a></li>
<li><a href="#toc_22391_32127_5">Shell 程序设计过程</a></li>
<li><a href="#toc_22391_32127_6">调试方法介绍</a></li>
<li><a href="#toc_22391_32127_7">小结</a></li>
<li><a href="#toc_22391_32127_8">参考资料</a></li>
</ul>
<p><span id="toc_22391_32127_1"></span></p>
<h2 id="前言">前言</h2>
<p>到最后一节来写“开篇”，确实有点古怪。不过，在<a href="01-chapter2.markdown">第一篇（数值操作）</a>的开头实际上也算是一个小的开篇，那里提到整个系列的前提是需要有一定的 Shell 编程基础，因此，为了能够让没有 Shell 编程基础的读者也可以阅读这个系列，我到最后来重写这个开篇。开篇主要介绍什么是 Shell，Shell 运行环境，Shell 基本语法和调试技巧。</p>
<p><span id="toc_22391_32127_2"></span></p>
<h2 id="什么是-shell">什么是 Shell</h2>
<p>首先让我们从下图看看 Shell 在整个操作系统中所处的位置吧，该图的外圆描述了整个操作系统（比如 <code>Debian/Ubuntu/Slackware</code> 等），内圆描述了操作系统的核心（比如 <code>Linux Kernel</code>），而 <code>Shell</code> 和 <code>GUI</code> 一样作为用户和操作系统之间的接口。</p>
<p><a href="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/UI_Shell_and_GUI.jpg" data-uk-lightbox><img src="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/UI_Shell_and_GUI.jpg" alt="Shell和GUI用户接口"></a></p>
<p><code>GUI</code> 提供了一种图形化的用户接口，使用起来非常简便易学；而 <code>Shell</code> 则为用户提供了一种命令行的接口，接收用户的键盘输入，并分析和执行输入字符串中的命令，然后给用户返回执行结果，使用起来可能会复杂一些，但是由于占用的资源少，而且在操作熟练以后可能会提高工作效率，而且具有批处理的功能，因此在某些应用场合还非常流行。</p>
<p><code>Shell</code> 作为一种用户接口，它实际上是一个能够解释和分析用户键盘输入，执行输入中的命令，然后返回结果的一个解释程序（Interpreter，例如在 <code>linux</code> 下比较常用的 <code>Bash</code>），我们可以通过下面的命令查看当前的 <code>Shell</code> ：</p>
<pre><code>$ echo $SHELL
/bin/bash
$ ls -l /bin/bash
-rwxr-xr-x 1 root root 702160 2008-05-13 02:33 /bin/bash
</code></pre>
<p>该解释程序不仅能够解释简单的命令，而且可以解释一个具有特定语法结构的文件，这种文件被称作脚本（Script）。它具体是如何解释这些命令和脚本文件的，这里不深入分析，请看我在 2008 年写的另外一篇文章：<a href="http://tinylab.gitbooks.io/cbook/content/zh/chapters/02-chapter3.html">《Linux命令行上程序执行的一刹那》</a>。</p>
<p>既然该程序可以解释具有一定语法结构的文件，那么我们就可以遵循某一语法来编写它，它有什么样的语法，如何运行，如何调试呢？下面我们以 <code>Bash</code> 为例来讨论这几个方面。</p>
<p><span id="toc_22391_32127_3"></span></p>
<h2 id="搭建运行环境">搭建运行环境</h2>
<p>为了方便后面的练习，我们先搭建一个基本运行环境：在一个 Linux 操作系统中，有一个运行有 <code>Bash</code> 的命令行在等待我们键入命令，这个命令行可以是图形界面下的 <code>Terminal</code> （例如 <code>Ubuntu</code> 下非常厉害的 <code>Terminator</code>），也可以是字符界面的 <code>Console</code> （可以用 <code>CTRL+ALT+F1~6</code> 切换），如果你发现当前 <code>Shell</code> 不是 <code>Bash</code>，请用下面的方法替换它：</p>
<pre><code>$ chsh $USER -s /bin/bash
$ su $USER
</code></pre>
<p>或者是简单地键入Bash：</p>
<pre><code>$ bash
$ echo $SHELL  # 确认一下
/bin/bash
</code></pre>
<p>如果没有安装 Linux 操作系统，也可以考虑使用一些公共社区提供的 <a href="http://www.tinylab.org/free-online-linux-labs/">Linux 虚拟实验服务</a>，一般都有提供远程 <code>Shell</code>，你可以通过 <code>Telnet</code> 或者是 <code>Ssh</code> 的客户端登录上去进行练习。</p>
<p>有了基本的运行环境，那么如何来运行用户键入的命令或者是用户编写好的脚本文件呢 <code>?</code></p>
<p>假设我们编写好了一个 Shell 脚本，叫 <code>test.sh</code> 。</p>
<p>第一种方法是确保我们执行的命令具有可执行权限，然后直接键入该命令执行它：</p>
<pre><code>$ chmod +x /path/to/test.sh
$ /path/to/test.sh
</code></pre>
<p>第二种方法是直接把脚本作为 <code>Bash</code> 解释器的参数传入：</p>
<pre><code>$ bash /path/to/test.sh
</code></pre>
<p>或</p>
<pre><code>$ source /path/to/test.sh
</code></pre>
<p>或</p>
<pre><code>$ . /path/to/test.sh
</code></pre>
<p><span id="toc_22391_32127_4"></span></p>
<h2 id="基本语法介绍">基本语法介绍</h2>
<p>先来一个 <code>Hello, World</code> 程序。</p>
<p>下面来介绍一个 Shell 程序的基本结构，以 <code>Hello, World</code> 为例：</p>
<pre><code>#!/bin/bash -v
# test.sh
echo "Hello, World"
</code></pre>
<p>把上述代码保存为 <code>test.sh</code>，然后通过上面两种不同方式运行，可以看到如下效果。</p>
<p>方法一：</p>
<pre><code>$ chmod +x test.sh
$ ./test.sh
 ./test.sh
 #!/bin/bash -v

 echo "Hello, World"
 Hello, World
</code></pre>
<p>方法二：</p>
<pre><code>$ bash test.sh
Hello, World

$ source test.sh
Hello, World

$ . test.sh
Hello, World
</code></pre>
<p>我们发现两者运行结果有区别，为什么呢？这里我们需要关注一下 <code>test.sh</code> 文件的内容，它仅仅有两行，第二行打印了 <code>Hello, World</code>，两种方法都达到了目的，但是第一种方法却多打印了脚本文件本身的内容，为什么呢？</p>
<p>原因在该文件的第一行，当我们直接运行该脚本文件时，该行告诉操作系统使用用<code>#!</code> 符号之后面的解释器以及相应的参数来解释该脚本文件，通过分析第一行，我们发现对应的解释器以及参数是 <code>/bin/bash -v</code>，而 <code>-v</code> 刚好就是要打印程序的源代码；但是我们在用第二种方法时没有给 <code>Bash</code> 传递任何额外的参数，因此，它仅仅解释了脚本文件本身。</p>
<p>其他语法细节请直接看<a href="../appendix/02-chapter1.markdown">《Shell编程学习笔记》</a>即本书后面的附录一。</p>
<p><span id="toc_22391_32127_5"></span></p>
<h2 id="shell-程序设计过程">Shell 程序设计过程</h2>
<p>Shell 语言作为解释型语言，它的程序设计过程跟编译型语言有些区别，其基本过程如下：</p>
<ul>
<li>设计算法</li>
<li>用 Shell 编写脚本程序实现算法</li>
<li>直接运行脚本程序</li>
</ul>
<p>可见它没有编译型语言的"麻烦的"编译和链接过程，不过正是因为这样，它出错时调试起来不是很方便，因为语法错误和逻辑错误都在运行时出现。下面我们简单介绍一下调试方法。</p>
<p><span id="toc_22391_32127_6"></span></p>
<h2 id="调试方法介绍">调试方法介绍</h2>
<p>可以直接参考资料：<a href="http://www.ibm.com/developerworks/cn/linux/l-cn-shell-debug/index.html">Shell 脚本调试技术</a> 或者 <a href="http://www.tinylab.org/bash-debugging-tools/">BASH 的调试手段</a>。</p>
<p><span id="toc_22391_32127_7"></span></p>
<h2 id="小结">小结</h2>
<p>Shell 语言作为一门解释型语言，可以使用大量的现有工具，包括数值计算、符号处理、文件操作、网络操作等，因此，编写过程可能更加高效，但是因为它是解释型的，需要在执行过程中从磁盘上不断调用外部的程序并进行进程之间的切换，在运行效率方面可能有劣势，所以我们应该根据应用场合选择使用 Shell 或是用其他的语言来编程。</p>
<p><span id="toc_22391_32127_8"></span></p>
<h2 id="参考资料">参考资料</h2>
<ul>
<li><a href="http://tinylab.gitbooks.io/cbook/content/zh/chapters/02-chapter3.html">Linux命令行上程序执行的一刹那</a></li>
<li><a href="../appendix/02-chapter1.markdown">Linux Shell编程学习笔记</a></li>
<li><a href="http://www.ibm.com/developerworks/cn/linux/l-cn-shell-debug/index.html">Shell 脚本调试技术</a></li>
<li><a href="http://www.tinylab.org/bash-debugging-tools/">BASH 的调试手段</a></li>
</ul>
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
<a href="/book/31/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/31/index.html">操作系统思考</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/15.html">wizardforcel</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">15页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 74个">74</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/28/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/28/index.html">笨办法学 Linux</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/15.html">wizardforcel</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">34页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 326个">326</span>
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
<a href="/book/6/index.html">
<img class="uk-book-cover" src="/static/icons/48/spring_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/6/index.html">Spring Framework 4.x 参考文档中文版</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/6.html">waylau</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="spring">spring</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">47页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 1192个">1192</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/53/index.html">
<img class="uk-book-cover" src="/static/icons/48/javascript_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/53/index.html">前端开发者指南 2018</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/30.html">稀土</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="css3">css3</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="html5">html5</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="javascript">javascript</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">103页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年6月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 282个">282</span>
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
<script type="text/javascript">var bookId =44;var bookPageId =2883;var bookPageRelUrl ='zh/chapters/01-chapter1.markdown';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>