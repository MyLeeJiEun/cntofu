
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>网络操作-Shell 编程范例</title>
<meta content='网络操作,Shell 编程范例' name='keywords'>
<meta content='网络操作,Shell 编程范例' name='description'>
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
<a href="/book/44/zh/chapters/01-chapter7.markdown">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">进程操作</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/44/zh/chapters/01-chapter9.markdown">
<span class="">用户管理</span>
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
<h1 id="网络操作">网络操作</h1>
<ul>
<li><a href="#toc_5782_1744_1">前言</a></li>
<li><a href="#toc_5782_1744_2">网络原理介绍</a></li>
<li><a href="#toc_5782_1744_3">我们的网络世界</a></li>
<li><a href="#toc_5782_1744_4">网络体系结构和网络协议介绍</a></li>
<li><a href="#toc_5782_1744_5">Linux 下网络“实战”</a></li>
<li><a href="#toc_5782_1744_6">如何把我们的 Linux 主机接入网络</a></li>
<li><a href="#toc_5782_1744_7">范例：通过dhclient获取IP地址</a></li>
<li><a href="#toc_5782_1744_8">范例：静态配置IP地址</a></li>
<li><a href="#toc_5782_1744_9">用 Linux 搭建网桥</a></li>
<li><a href="#toc_5782_1744_10">用 Linux 做路由</a></li>
<li><a href="#toc_5782_1744_11">用 Linux 搭建各种常规的网络服务</a></li>
<li><a href="#toc_5782_1744_12">Linux 下网络问题诊断与维护</a></li>
<li><a href="#toc_5782_1744_13">Linux 下网络编程与开发</a></li>
<li><a href="#toc_5782_1744_14">后记</a></li>
<li><a href="#toc_5782_1744_15">参考资料</a></li>
</ul>
<p><span id="toc_5782_1744_1"></span></p>
<h2 id="前言">前言</h2>
<p>前面章节已经介绍了Shell编程范例之数值、布尔值、字符串、文件、文件系统、进程等的操作。这些内容基本覆盖了网络中某个独立机器正常工作的“方方面面”，现在需要把视角从单一的机器延伸到这些机器通过各种网络设备和协议连接起来的网络世界，分析网络拓扑结构、网络工作原理、了解各种常见网络协议、各种常见硬件工作原理、网络通信与安全相关软件以及工作原理分析等。</p>
<p>不过，因为网络相关的问题确实太复杂了，这里不可能介绍具体，因此如果想了解更多细节，还是建议参考相关资料。但Linux是一个网络原理学习和实践的好平台，不仅因为它本身对网络体系结构的实现是开放源代码的，而且各种相关的分析工具和函数库数不胜数，因此，如果你是学生，千万不要错过通过它来做相关的实践工作。</p>
<p><span id="toc_5782_1744_2"></span></p>
<h2 id="网络原理介绍">网络原理介绍</h2>
<p><span id="toc_5782_1744_3"></span></p>
<h3 id="我们的网络世界">我们的网络世界</h3>
<p>在进行所有介绍之前，来直观地感受一下那个真真实实存在的网络世界吧。当我在 Linux 下通过 <code>Web</code> 编辑器写这篇 Blog 时，一边用 <code>mplayer</code> 听着远程音乐，累了时则打开兰大的网络 <code>TV</code> 频道开始看看凤凰卫视……这些“现代化”的生活，我想，如果没有网络，将变得无法想象。</p>
<p>下面来构想一下这样一个网络世界的优美图画：</p>
<blockquote>
<p>一边盯着显示器，一边敲击着键盘，一边挂着耳机。</p>
</blockquote>
<blockquote>
<p>主机电源灯灿烂得很，发着绿光，这时很容易想象主机背后的那个网卡位置肯定有两个不同颜色的灯光在闪烁，它显示着主机正在与计算机网络世界打着交道。</p>
</blockquote>
<blockquote>
<p>就在实验室的某个角落，有一个交换机上的一个网口的网线连到主机上，这个交换机接到了一个局域网的网关上，然后这个网关再接到了信息楼的某个路由器上，再转接到学校网络中心的另外一个路由器上……</p>
</blockquote>
<blockquote>
<p>期间，有一个路由器连接到了这个 Blog 服务器上，而另外一个则可能连到了那个网络 <code>TV</code> 服务器上，还有呢，另外一些则连接到了电信网络里头的某个音乐服务器上……</p>
</blockquote>
<p>下面用 <code>dia</code> 绘制一个简单的“网络地图”：</p>
<p><a href="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Architecture.jpg" data-uk-lightbox><img src="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Architecture.jpg" alt="Network Architecture"></a></p>
<p>该图把一些最常见的网络设备和网络服务基本都呈现出来了，包括本地主机、路由、交换机、网桥，域名服务器，万维网服务，视频服务，防火墙服务，动态 <code>IP</code> 地址服务等。其中各种设备构成了整个物理网络，而网络服务则是构建在这些设备上的各种网络应用。</p>
<p>现在的网络应用越来越丰富多样，比如即时聊天（<code>IM</code>）、 <code>p2p</code> 资源共享、网络搜索等，它们是如何实现的，它们如何构建在各种各样的网络设备之上，并且能够安全有效的工作呢？这取决于这背后逐步完善的网络体系结构和各种相关网络协议的开发、实现和应用。</p>
<p><span id="toc_5782_1744_4"></span></p>
<h3 id="网络体系结构和网络协议介绍">网络体系结构和网络协议介绍</h3>
<p>那么网络体系结构是怎么样的呢？涉及到哪些相关的网络协议呢？什么又是网络协议呢？</p>
<p>在《计算机网络——自顶向下的方法》一书中非常巧妙地给出了网络体系结构分层的比喻，把网络中各层跟交通运输体系中的各个环节对照起来，让人通俗易懂。在交通运输体系中，运输的是人和物品，在计算机网络体系中，运输的是电子数据。考虑到交通运输网络和计算机网络中最终都可以划归为点对点的信息传输。这里考虑两点之间的信息传递过程，得到这样一个对照关系，见下图：</p>
<p><a href="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Layer_Compare.jpg" data-uk-lightbox><img src="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Layer_Compare.jpg" alt="Network Layer与交通运输体系比较"></a></p>
<p>对照上图，更容易理解右侧网络体系结构的分层原理（如果比照一封信发出到收到的这一中间过程可能更容易理解），上图右侧是 <code>TCP/IP</code> 网络体系结构的一个网络分层示意图，在把数据发送到网络之前，在各层中需要进行各种“打包”的操作，而从网络接收到数据后，就需要进行“解包”操作，最终把纯粹的数据信息给提取出来。这种分层的方式是为了传输数据的需要，也是两个主机之间如何建立连接以及如何保证数据传输的完整性和可靠性的需要。通过把各种需要分散在不同的层次，使得整个体系结构更加清晰和明了。这些“需求”具体通过各种对应的协议来规范，这些规范统成为网络协议。</p>
<p>关于 <code>OSI</code> 模型（7 层）比照 <code>TCP/IP</code> 模型（4 层）的协议栈可以从下图（来自网络）看个明了：</p>
<p><a href="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Layer_OSI.jpg" data-uk-lightbox><img src="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Layer_OSI.jpg" alt="OSI Network Layer"></a></p>
<p>而下图（来自网络）则更清晰地体现了 <code>TCP/IP</code> 分层模型。</p>
<p><a href="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Layer_TCP_IP.jpg" data-uk-lightbox><img src="https://img.cntofu.com/book/open-shell-book/zh/chapters/pic/Network_Layer_TCP_IP.jpg" alt="TCP IP Network Layer"></a></p>
<p>上面介绍了网络原理方面的基本内容，如果想了解更多网络原理和操作系统对网络支持的实现，可以考虑阅读后面的参考资料。下面将做一些实践，即在 Linux 下如何联网，如何用 Linux 搭建各种网络服务，并进行网络安全方面的考量以及基本的网络编程和开发的介绍。</p>
<p><span id="toc_5782_1744_5"></span></p>
<h2 id="linux-下网络实战">Linux 下网络“实战”</h2>
<p><span id="toc_5782_1744_6"></span></p>
<h3 id="如何把我们的-linux-主机接入网络">如何把我们的 Linux 主机接入网络</h3>
<p>如果要让一个系统能够联网，首先当然是搭建好物理网络了。接入网络的物理方式还是蛮多的，比如直接用网线接入以太网，用无线网卡上网，用 <code>ADSL</code> 拨号上网……</p>
<p>对于用以太网网卡接入网络的常见方式，在搭建好物理网络并确保连接正常后，可以通过配置 <code>IP</code> 地址和默认网关来接入网络，这个可以通过手工配置和动态获取两种方式。</p>
<p><span id="toc_5782_1744_7"></span></p>
<h4 id="范例通过dhclient获取ip地址">范例：通过dhclient获取IP地址</h4>
<p>如果所在的局域网有 <code>DHCP</code> 服务，那么可以这么获取，<code>N</code> 是设备名称，如果只有一块网卡，一般是 0 或者 1 。</p>
<pre><code>$ dhclient ethN
</code></pre>
<p><span id="toc_5782_1744_8"></span></p>
<h4 id="范例静态配置ip地址">范例：静态配置IP地址</h4>
<p>当然，也可以考虑采用静态配置的方式，<code>ip_address</code> 是本地主机的 <code>IP</code> 地址，<code>gw_ip_address</code> 是接入网络的网关的 <code>IP</code> 地址。</p>
<pre><code>$ ifconfig eth0 ip_address on
$ route add deafult gw gw_ip_address
</code></pre>
<p>如果上面不工作，记得通过 <code>ifconfig/mii-tool/ethtool</code> 等工具检查网卡是否有被驱动起来，然后通过 <code>lspci/dmesg</code> 等检查网卡类型（或者通过主板手册和独立网卡自带的手册查看），接着安装或者编译相关驱动，最后把驱动通过 <code>insmod/modprobe</code> 等工具加载到内核中。</p>
<p><span id="toc_5782_1744_9"></span></p>
<h3 id="用-linux-搭建网桥">用 Linux 搭建网桥</h3>
<p>网桥工作在 <code>OSI</code> 模型的第二层，即数据链路层，它只需要知道目标主机的 <code>MAC</code> 地址就可以工作。 Linux 内核在 <code>2.2</code> 开始就已经支持了这个功能，具体怎么配置看看后续<a href="http://www.ibm.com/developerworks/cn/linux/kernel/l-netbr/index.html">参考资料</a>吧。如果要把 Linux 主机配置成一个网桥，至少需要两个网卡。</p>
<p>网桥的作用相当于一根网线，用户无须关心里头有什么东西，把它的两个网口连接到两个主机上就可以让这两个主机支持相互通信。不过它比网线更厉害，如果配上防火墙，就可以隔离连接在它两端的网段（注意这里是网络，因为它不识别 <code>IP</code>），另外，如果这个网桥有多个网口，那么可以实现一个功能复杂的交换机，而如果有效组合多个网桥，则有可能实现一个复杂的可实现流量控制和负载平衡的防火墙系统。</p>
<p><span id="toc_5782_1744_10"></span></p>
<h3 id="用-linux-做路由">用 Linux 做路由</h3>
<p>路由工作在 <code>OSI</code> 模型的第三层，即网络层，通过 <code>router</code> 可以配置 Linux 的路由，当然，Linux 下也有很多工具支持动态路由的。相关的资料在网路中铺天盖地，由于时间关系，这里不做介绍。</p>
<p><span id="toc_5782_1744_11"></span></p>
<h3 id="用-linux-搭建各种常规的网络服务">用 Linux 搭建各种常规的网络服务</h3>
<p>需要什么网络服务呢？</p>
<ul>
<li>给局域网弄个 <code>DHCP</code> 服务器，那就弄个 <code>dhcpd</code>，看看<a href="http://tldp.org/HOWTO/DHCP/">参考资料</a>；</li>
<li>如果想弄个邮件发送服务器，那就安装个 <code>sendmail</code> 或者 <code>exim4</code> ；</li>
<li>如果再想弄个邮件列表服务器呢，那就装个 <code>mailman</code> ；</li>
<li>如果想弄个接收邮件的服务器呢，那就安装个 <code>pop3</code> 服务器；</li>
<li>如果想弄个 <code>web</code> 站点，那就弄个 <code>apache</code> 或者 <code>nginx</code> 服务器；</li>
<li>如果想弄上防火墙服务，那么通过 <code>iptables</code> 工具配置 <code>netfilter</code> 就可以</li>
</ul>
<p>What's more？如果你能想到，Linux上基本都有相应的实现。</p>
<p><span id="toc_5782_1744_12"></span></p>
<h3 id="linux-下网络问题诊断与维护">Linux 下网络问题诊断与维护</h3>
<p>如果出现网络问题，不要惊慌，逐步检查网络的各个层次：物理链接、链路层、网络层直到应用层，熟悉使用各种如下的工具，包括 <code>ethereal/tcpdump</code>，<code>hping</code>，<code>nmap</code>，<code>netstat</code>，<code>netpipe</code>，<code>netperf</code>，<code>vnstat</code>，<code>ntop</code> 等。</p>
<p>关于这些工具的详细用法和网络问题诊断和维护的相关知识，请看后续相关资料。</p>
<p><span id="toc_5782_1744_13"></span></p>
<h2 id="linux-下网络编程与开发">Linux 下网络编程与开发</h2>
<p>如果想做网络编程开发，比如：</p>
<ul>
<li>要实现一个客户端 <code>/</code> 服务器架构的应用，可以采用 Linux 下的 <code>socket</code> 编程了；</li>
<li>如果想写一个数据包抓获和协议分析的程序，可以采用 <code>libpap</code> 等函数库；</li>
<li>如果想实现某个协议呢，那就可以参考相关的 <code>RFC</code> 文档，并通过 <code>socket</code> 编程来实现。</li>
</ul>
<p>这个可以参考相关的 <code>Linux socket</code> 编程等资料。</p>
<p><span id="toc_5782_1744_14"></span></p>
<h2 id="后记">后记</h2>
<p>本来介绍网络相关的一些基本内容，但因时间关系，没有详述，更多细节请参考相关资料。</p>
<p>到这里，整个《Shell编程范例》算是很粗略地完成了，不过“范例”却缺少实例，特别是这一节。因此，如果时间允许，会逐步补充一些实例。</p>
<p><span id="toc_5782_1744_15"></span></p>
<h2 id="参考资料">参考资料</h2>
<ul>
<li>计算机网络——自上而下的分析方法</li>
<li>Linux 网络体系结构（清华大学出版社出版）</li>
<li>Linux 系统故障诊断与排除 第13章 网络问题（人民邮电出版社）</li>
<li>在 Linux 下用 ADSL 拨号上网</li>
<li>Linux 下无线网络相关资料收集</li>
<li><a href="http://www.ibm.com/developerworks/cn/linux/kernel/l-netbr/index.html">Linux网桥的实现分析与使用</a></li>
<li><a href="http://tldp.org/HOWTO/DHCP/">DHCP mini howto</a></li>
<li>最佳的 75 个安全工具</li>
<li>网络管理员必须掌握的知识</li>
<li>Linux 上检测 rootkit 的两种工具: Rootkit Hunter 和 Chkrootkit</li>
<li>数据包抓获与 ip 协议的简单分析（基于 pcap 库）</li>
<li><a href="http://www.ietf.org/rfc">RFC</a></li>
<li><a href="http://zhoulifa.bokee.com/4640913.html">HTTP 协议的 C 语言编程实现实例</a></li>
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
<a href="/book/151/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/151/index.html">Shell脚本编程30分钟入门</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/83.html">qinjx</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">5页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2019年3月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 5224个">5224</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/45/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/45/index.html">嵌入式 Linux 知识库</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/23.html">泰晓科技</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">402页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月30日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 97个">97</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/68/index.html">
<img class="uk-book-cover" src="/static/icons/48/python_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/68/index.html">Python 资源大全中文版</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/19.html">伯乐在线</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="python">python</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">1页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年6月6日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 10237个">10237</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/153/index.html">
<img class="uk-book-cover" src="/static/icons/48/javascript_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/153/index.html">你不懂JS：ES6与未来</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/85.html">getify</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="javascript">javascript</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">13页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2019年3月24日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 98514个">98514</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/8/index.html">
<img class="uk-book-cover" src="/static/icons/48/netty_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/8/index.html">Netty 实战(精髓)</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/6.html">waylau</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="netty">netty</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">101页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 817个">817</span>
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
<script type="text/javascript">var bookId =44;var bookPageId =2890;var bookPageRelUrl ='zh/chapters/01-chapter8.markdown';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>