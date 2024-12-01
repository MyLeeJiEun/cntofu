
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>动态符号链接的细节-C 语言编程透视</title>
<meta content='动态符号链接的细节,C 语言编程透视' name='keywords'>
<meta content='动态符号链接的细节,C 语言编程透视' name='description'>
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
<a href="/book/43/zh/chapters/02-chapter3.markdown">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">程序执行的一刹那</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/43/zh/chapters/02-chapter5.markdown">
<span class="">缓冲区溢出与注入分析</span>
<i class="nav-icon-right uk-icon-small  uk-icon-caret-right"></i>
</a>
</div>
</div>
<div class="uk-text-center">
<h2 class="book-page-title uk-container-center">
<a href="/book/43/index.html">C 语言编程透视</a>
<a target="_blank" rel="nofollow" href="https://github.com/tinyclub/open-c-book" class="uk-icon-button uk-icon-github" title="github项目地址"></a>
</h2>
</div>
<script type="text/javascript" src="/static/components/js/app_intro.js"></script>
<ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-5313208362165053" data-ad-slot="1328047120"></ins>
<script>(adsbygoogle =window.adsbygoogle ||[]).push({});</script>
<hr class="uk-article-divider">
<div class="book-content-section  md-content-section  uk-margin-bottom">
<h1 id="动态符号链接的细节">动态符号链接的细节</h1>
<ul>
<li><a href="#toc_23258_14315_1">前言</a></li>
<li><a href="#toc_23258_14315_2">基本概念</a></li>
<li><a href="#toc_23258_14315_3">ELF</a></li>
<li><a href="#toc_23258_14315_4">符号</a></li>
<li><a href="#toc_23258_14315_5">重定位：[是将符号引用与符号定义进行链接的过程][8]</a></li>
<li><a href="#toc_23258_14315_6">动态链接</a></li>
<li><a href="#toc_23258_14315_7">动态链接库</a></li>
<li><a href="#toc_23258_14315_8">动态链接器（dynamic linker/loader）</a></li>
<li><a href="#toc_23258_14315_9">过程链接表（plt）</a></li>
<li><a href="#toc_23258_14315_10">全局偏移表（got）</a></li>
<li><a href="#toc_23258_14315_11">重定位表</a></li>
<li><a href="#toc_23258_14315_12">动态链接库的创建和调用</a></li>
<li><a href="#toc_23258_14315_13">创建动态链接库</a></li>
<li><a href="#toc_23258_14315_14">隐式使用该库</a></li>
<li><a href="#toc_23258_14315_15">显式使用库</a></li>
<li><a href="#toc_23258_14315_16">动态链接过程</a></li>
<li><a href="#toc_23258_14315_17">参考资料</a></li>
</ul>
<p><span id="toc_23258_14315_1"></span></p>
<h2 id="前言">前言</h2>
<p>Linux 支持动态链接库，不仅节省了磁盘、内存空间，而且<a href="http://www.ccw.com.cn/htm/app/linux/develop/01_8_6_2.asp">可以提高程序运行效率</a>。不过引入动态链接库也可能会带来很多问题，例如<a href="http://unix-cd.com/unixcd12/article_5065.html">动态链接库的调试</a>、<a href="http://www.ibm.com/developerworks/linux/library/l-shlibs.html">升级更新</a>和潜在的安全威胁<a href="http://fanqiang.chinaunix.net/safe/system/2007-02-01/4870.shtml">[1]</a>, <a href="http://article.pchome.net/content-323084.html">[2]</a>。这里主要讨论符号的动态链接过程，即程序在执行过程中，对其中包含的一些未确定地址的符号进行重定位的过程<a href="http://elfhack.whitecell.org/mydocs/ELF_symbol_resolve_process1.txt">[1]</a>, <a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[2]</a>。</p>
<p>本篇主要参考资料<a href="http://elfhack.whitecell.org/mydocs/ELF_symbol_resolve_process1.txt">[3]</a>和<a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[8]</a>，前者侧重实践，后者侧重原理，把两者结合起来就方便理解程序的动态链接过程了。另外，动态链接库的创建、使用以及调用动态链接库的部分参考了资料<a href="http://www.ccw.com.cn/htm/app/linux/develop/01_8_6_2.asp">[1]</a>, <a href="http://www.vchome.net/tech/dll/dll9.htm">[2]</a>。</p>
<p>下面先来看看几个基本概念，接着就介绍动态链接库的创建、隐式和显示调用，最后介绍符号的动态链接细节。</p>
<p><span id="toc_23258_14315_2"></span></p>
<h2 id="基本概念">基本概念</h2>
<p><span id="toc_23258_14315_3"></span></p>
<h3 id="elf">ELF</h3>
<p><code>ELF</code> 是 Linux 支持的一种程序文件格式，本身包含重定位、执行、共享（动态链接库）三种类型（<code>man elf</code>）。</p>
<p>代码：</p>
<pre><code>/* test.c */
#include &lt;stdio.h&gt;&nbsp;&nbsp;&nbsp;&nbsp;

int global = 0;

int main()
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char local = 'A';

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("local = %c, global = %d\n", local, global);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
}
</code></pre>
<p>演示：</p>
<p>通过 <code>-c</code> 生成可重定位文件 <code>test.o</code>，这里不会进行链接：</p>
<pre><code>$ gcc -c test.c
$ file test.o
test.o: ELF 32-bit LSB relocatable, Intel 80386, version 1 (SYSV), not stripped
</code></pre>
<p>链接后才可以执行：</p>
<pre><code>$ gcc -o test test.o
$ file test
test: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
</code></pre>
<p>也可链接成动态链接库，不过一般不会把 <code>main</code> 函数链接成动态链接库，后面再介绍：</p>
<pre><code>$ gcc -fpic -shared -Wl,-soname,libtest.so.0 -o libtest.so.0.0 test.o
$ file libtest.so.0.0
libtest.so.0.0: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), not stripped
</code></pre>
<p>虽然 <code>ELF</code> 文件本身就支持三种不同的类型，不过它有一个统一的结构。这个结构是：</p>
<pre><code>文件头部(ELF Header)
程序头部表(Program Header Table)
节区1(Section1)
节区2(Section2)
节区3(Section3)
...
节区头部表(Section Header Table)
</code></pre>
<p>无论是文件头部、程序头部表、节区头部表，还是节区，它们都对应着 C 语言里头的一些结构体（<code>elf.h</code> 中定义）。文件头部主要描述 <code>ELF</code> 文件的类型，大小，运行平台，以及和程序头部表和节区头部表相关的信息。节区头部表则用于可重定位文件，以便描述各个节区的信息，这些信息包括节区的名字、类型、大小等。程序头部表则用于描述可执行文件或者动态链接库，以便系统加载和执行它们。而节区主要存放各种特定类型的信息，比如程序的正文区（代码）、数据区（初始化和未初始化的数据）、调试信息、以及用于动态链接的一些节区，比如解释器（<code>.interp</code>）节区将指定程序动态装载 <code>/</code> 链接器 <code>ld-linux.so</code> 的位置，而过程链接表（<code>plt</code>）、全局偏移表（<code>got</code>）、重定位表则用于辅助动态链接过程。</p>
<p><span id="toc_23258_14315_4"></span></p>
<h3 id="符号">符号</h3>
<p>对于可执行文件除了编译器引入的一些符号外，主要就是用户自定义的全局变量，函数等，而对于可重定位文件仅仅包含用户自定义的一些符号。</p>
<ul>
<li> <p>生成可重定位文件</p> <pre><code>  $ gcc -c test.c
  $ nm test.o
  00000000 B global
  00000000 T main
           U printf
</code></pre> <p>上面包含全局变量、自定义函数以及动态链接库中的函数，但不包含局部变量，而且发现这三个符号的地址都没有确定。</p> <p>注： <code>nm</code> 命令可用来查看 <code>ELF</code> 文件的符号表信息。</p> </li>
<li> <p>生成可执行文件</p> <pre><code>  $ gcc -o test test.o
  $ nm test | egrep "main$| printf|global$"
  080495a0 B global
  08048354 T main
           U printf@@GLIBC_2.0
</code></pre> <p>经链接，<code>global</code> 和 <code>main</code> 的地址都已经确定了，但是 <code>printf</code> 却还没，因为它是动态链接库 <code>glibc</code> 中定义函数，需要动态链接，而不是这里的“静态”链接。</p> </li>
</ul>
<p><span id="toc_23258_14315_5"></span></p>
<h3 id="重定位是将符号引用与符号定义进行链接的过程">重定位：<a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">是将符号引用与符号定义进行链接的过程</a></h3>
<p>从上面的演示可以看出，重定位文件 <code>test.o</code> 中的符号地址都是没有确定的，而经过静态链接（<code>gcc</code> 默认调用 <code>ld</code> 进行链接）以后有两个符号地址已经确定了，这样一个确定符号地址的过程实际上就是链接的实质。链接过后，对符号的引用变成了对地址（定义符号时确定该地址）的引用，这样程序运行时就可通过访问内存地址而访问特定的数据。</p>
<p>我们也注意到符号 <code>printf</code> 在可重定位文件和可执行文件中的地址都没有确定，这意味着该符号是一个外部符号，可能定义在动态链接库中，在程序运行时需要通过动态链接器（<code>ld-linux.so</code>）进行重定位，即动态链接。</p>
<p>通过这个演示可以看出 <code>printf</code> 确实在 <code>glibc</code> 中有定义。</p>
<pre><code>$ nm -D /lib/`uname -m`-linux-gnu/libc.so.6 | grep "\ printf$"
0000000000053840 T printf
</code></pre>
<p>除了 <code>nm</code> 以外，还可以用 <code>readelf -s</code> 查看 <code>.dynsym</code> 表或者用 <code>objdump -tT</code> 查看。</p>
<p>需要提到的是，用 <code>nm</code> 命令不带 <code>-D</code> 参数的话，在较新的系统上已经没有办法查看 <code>libc.so</code> 的符号表了，因为 <code>nm</code> 默认打印常规符号表（在 <code>.symtab</code> 和 <code>.strtab</code> 节区中），但是，在打包时为了减少系统大小，这些符号已经被 <code>strip</code> 掉了，只保留了动态符号（在 <code>.dynsym</code> 和 <code>.dynstr</code> 中）以便动态链接器在执行程序时寻址这些外部用到的符号。而常规符号除了动态符号以外，还包含有一些静态符号，比如说本地函数，这个信息主要是调试器会用，对于正常部署的系统，一般会用 <code>strip</code> 工具删除掉。</p>
<p>关于 <code>nm</code> 与 <code>readelf -s</code> 的详细比较，可参考：<a href="http://stackoverflow.com/questions/9961473/nm-vs-readelf-s">nm vs “readelf -s”</a>。</p>
<p><span id="toc_23258_14315_6"></span></p>
<h3 id="动态链接">动态链接</h3>
<p>动态链接就是在程序运行时对符号进行重定位，确定符号对应的内存地址的过程。</p>
<p>Linux 下符号的动态链接默认采用<a href="http://elfhack.whitecell.org/mydocs/ELF_symbol_resolve_process1.txt">Lazy Mode方式</a>，也就是说在程序运行过程中用到该符号时才去解析它的地址。这样一种符号解析方式有一个好处：只解析那些用到的符号，而对那些不用的符号则永远不用解析，从而提高程序的执行效率。</p>
<p>不过这种默认是可以通过设置 <code>LD_BIND_NOW</code> 为非空来打破的（下面会通过实例来分析这个变量的作用），也就是说如果设置了这个变量，动态链接器将在程序加载后和符号被使用之前就对这些符号的地址进行解析。</p>
<p><span id="toc_23258_14315_7"></span></p>
<h3 id="动态链接库">动态链接库</h3>
<p>上面提到重定位的过程就是对符号引用和符号地址进行链接的过程，而动态链接过程涉及到的符号引用和符号定义分别对应可执行文件和动态链接库，在可执行文件中可能引用了某些动态链接库中定义的符号，这类符号通常是函数。</p>
<p>为了让动态链接器能够进行符号的重定位，必须把动态链接库的相关信息写入到可执行文件当中，这些信息是什么呢？</p>
<pre><code>$ readelf -d test | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
</code></pre>
<p><code>ELF</code> 文件有一个特别的节区： <code>.dynamic</code>，它存放了和动态链接相关的很多信息，例如动态链接器通过它找到该文件使用的动态链接库。不过，该信息并未包含动态链接库 <code>libc.so.6</code> 的绝对路径，那动态链接器去哪里查找相应的库呢？</p>
<p>通过 <code>LD_LIBRARY_PATH</code> 参数，它类似 Shell 解释器中用于查找可执行文件的 <code>PATH</code> 环境变量，也是通过冒号分开指定了各个存放库函数的路径。该变量实际上也可以通过 <code>/etc/ld.so.conf</code> 文件来指定，一行对应一个路径名。为了提高查找和加载动态链接库的效率，系统启动后会通过 <code>ldconfig</code> 工具创建一个库的缓存 <code>/etc/ld.so.cache</code> 。如果用户通过 <code>/etc/ld.so.conf</code> 加入了新的库搜索路径或者是把新库加到某个原有的库目录下，最好是执行一下 <code>ldconfig</code> 以便刷新缓存。</p>
<p>需要补充的是，因为动态链接库本身还可能引用其他的库，那么一个可执行文件的动态符号链接过程可能涉及到多个库，通过 <code>readelf -d</code> 可以打印出该文件直接依赖的库，而通过 <code>ldd</code> 命令则可以打印出所有依赖或者间接依赖的库。</p>
<pre><code>$ ldd test
        linux-gate.so.1 =&gt;  (0xffffe000)
        libc.so.6 =&gt; /lib/libc.so.6 (0xb7da2000)
        /lib/ld-linux.so.2 (0xb7efc000)
</code></pre>
<p><code>libc.so.6</code> 通过 <code>readelf -d</code> 就可以看到的，是直接依赖的库；而 <code>linux-gate.so.1</code> 在文件系统中并没有对应的库文件，它是一个虚拟的动态链接库，对应进程内存映像的内核部分，更多细节请参考资料<a href="http://www.linux010.cn/program/Linux-gateso1-DeHanYi-pcee6103.htm">[11]</a>; 而 <code>/lib/ld-linux.so.2</code> 正好是动态链接器，系统需要用它来进行符号重定位。那 <code>ldd</code> 是怎么知道 <code>/lib/ld-linux.so</code> 就是该文件的动态链接器呢？</p>
<p>那是因为 <code>ELF</code> 文件通过专门的节区指定了动态链接器，这个节区就是 <code>.interp</code> 。</p>
<pre><code>$ readelf -x .interp test

Hex dump of section '.interp':
  0x08048114 2f6c6962 2f6c642d 6c696e75 782e736f /lib/ld-linux.so
  0x08048124 2e3200                              .2.
</code></pre>
<p>可以看到这个节区刚好有字符串 <code>/lib/ld-linux.so.2</code>，即 <code>ld-linux.so</code> 的绝对路径。</p>
<p>我们发现，与 <code>libc.so</code> 不同的是，<code>ld-linux.so</code> 的路径是绝对路径，而 <code>libc.so</code> 仅仅包含了文件名。原因是：程序被执行时，<code>ld-linux.so</code> 将最先被装载到内存中，没有其他程序知道去哪里查找 <code>ld-linux.so</code>，所以它的路径必须是绝对的；当 <code>ld-linux.so</code> 被装载以后，由它来去装载可执行文件和相关的共享库，它将根据 <code>PATH</code> 变量和 <code>LD_LIBRARY_PATH</code> 变量去磁盘上查找它们，因此可执行文件和共享库都可以不指定绝对路径。</p>
<p>下面着重介绍动态链接器本身。</p>
<p><span id="toc_23258_14315_8"></span></p>
<h3 id="动态链接器dynamic-linkerloader">动态链接器（dynamic linker/loader）</h3>
<p>Linux 下 <code>elf</code> 文件的动态链接器是 <code>ld-linux.so</code>，即 <code>/lib/ld-linux.so.2</code> 。从名字来看和静态链接器 <code>ld</code> （<code>gcc</code> 默认使用的链接器，见参考资料<a href="http://isomerica.net/archives/2007/05/28/what-is-linux-gateso1-and-why-is-it-missing-on-x86-64/">[10]</a>）类似。通过 <code>man ld-linux</code> 可以获取与动态链接器相关的资料，包括各种相关的环境变量和文件都有详细的说明。</p>
<p>对于环境变量，除了上面提到过的 <code>LD_LIBRARY_PATH</code> 和 <code>LD_BIND_NOW</code> 变量外，还有其他几个重要参数，比如 <code>LD_PRELOAD</code> 用于指定预装载一些库，以便替换其他库中的函数，从而做一些安全方面的处理 <a href="http://fanqiang.chinaunix.net/safe/system/2007-02-01/4870.shtml">[6]</a>，<a href="http://www.trilithium.com/johan/2005/08/linux-gate/">[9]</a>，<a href="http://www.ibm.com/developerworks/cn/linux/l-overflow/index.html">[12]</a>，而环境变量 <code>LD_DEBUG</code> 可以用来进行动态链接的相关调试。</p>
<p>对于文件，除了上面提到的 <code>ld.so.conf</code> 和 <code>ld.so.cache</code> 外，还有一个文件 <code>/etc/ld.so.preload</code> 用于指定需要预装载的库。</p>
<p>从上一小节中发现有一个专门的节区 <code>.interp</code> 存放有动态链接器，但是这个节区为什么叫做 <code>.interp</code> （<code>interpeter</code>）<code>呢？因为当 Shell 解释器或者其他父进程通过</code>exec<code>启动我们的程序时，系统会先为</code>ld-linux<code>创建内存映像，然后把控制权交给</code>ld-linux<code>，之后</code>ld-linux<code>负责为可执行程序提供运行环境，负责解释程序的运行，因此</code>ld-linux<code>也叫做</code>dynamic loader<code>（或</code>intepreter`）（关于程序的加载过程请参考资料 <a href="http://www.ibm.com/developerworks/cn/linux/l-elf/part1/index.html">[13]</a>）</p>
<p>那么在 <code>exec</code> （）之后和程序指令运行之前的过程是怎样的呢？ <code>ld-linux.so</code> 主要为程序本身创建了内存映像（以下内容摘自资料 <a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[8]</a>），大体过程如下：</p>
<ul>
<li>将可执行文件的内存段添加到进程映像中；</li>
<li>把共享目标内存段添加到进程映像中；</li>
<li>为可执行文件和它的共享目标（动态链接库）执行重定位操作；</li>
<li>关闭用来读入可执行文件的文件描述符，如果动态链接程序收到过这样的文件描述符的话；</li>
<li>将控制转交给程序，使得程序好像从 <code>exec()</code> 直接得到控制</li>
</ul>
<p>关于第 1 步，在 <code>ELF</code> 文件的文件头中就指定了该文件的入口地址，程序的代码和数据部分会相继 <code>map</code> 到对应的内存中。而关于可执行文件本身的路径，如果指定了 <code>PATH</code> 环境变量，<code>ld-linux</code> 会到 <code>PATH</code> 指定的相关目录下查找。</p>
<pre><code>$ readelf -h test | grep Entry
  Entry point address:               0x80482b0
</code></pre>
<p>对于第 2 步，上一节提到的 <code>.dynamic</code> 节区指定了可执行文件依赖的库名，<code>ld-linux</code> （在这里叫做动态装载器或程序解释器比较合适）再从 <code>LD_LIBRARY_PATH</code> 指定的路径中找到相关的库文件或者直接从 <code>/etc/ld.so.cache</code> 库缓冲中加载相关库到内存中。（关于进程的内存映像，推荐参考资料 <a href="http://www.ibm.com/developerworks/cn/linux/l-elf/part2/index.html">[14]</a>）</p>
<p>对于第 3 步，在前面已提到，如果设置了 <code>LD_BIND_NOW</code> 环境变量，这个动作就会在此时发生，否则将会采用 <code>lazy mode</code> 方式，即当某个符号被使用时才会进行符号的重定位。不过无论在什么时候发生这个动作，重定位的过程大体是一样的（在后面将主要介绍该过程）。</p>
<p>对于第 4 步，这个主要是释放文件描述符。</p>
<p>对于第 5 步，动态链接器把程序控制权交还给程序。</p>
<p>现在关心的主要是第 3 步，即如何进行符号的重定位？下面来探求这个过程。期间会逐步讨论到和动态链接密切相关的三个数据结构，它们分别是 <code>ELF</code> 文件的过程链接表、全局偏移表和重定位表，这三个表都是 <code>ELF</code> 文件的节区。</p>
<p><span id="toc_23258_14315_9"></span></p>
<h3 id="过程链接表plt">过程链接表（plt）</h3>
<p>从上面的演示发现，还有一个 <code>printf</code> 符号的地址没有确定，它应该在动态链接库 <code>libc.so</code> 中定义，需要进行动态链接。这里假设采用 <code>lazy mode</code> 方式，即执行到 <code>printf</code> 所在位置时才去解析该符号的地址。</p>
<p>假设当前已经执行到了 <code>printf</code> 所在位置，即 <code>call printf</code>，我们通过 <code>objdump</code> 反编译 <code>test</code> 程序的正文段看看。</p>
<pre><code>$ objdump -d -s -j .text test | grep printf
 804837c:       e8 1f ff ff ff          call   80482a0 &lt;printf@plt&gt;
</code></pre>
<p>发现，该地址指向了 <code>plt</code> （即过程链接表）即地址 <code>80482a0</code> 处。下面查看该地址处的内容。</p>
<pre><code>$ objdump -D test | grep "80482a0" | grep -v call
080482a0 &lt;printf@plt&gt;:
 80482a0:       ff 25 8c 95 04 08       jmp    *0x804958c
</code></pre>
<p>发现 <code>80482a0</code> 地址对应的是一条跳转指令，跳转到 <code>0x804958c</code> 地址指向的地址。到底 <code>0x804958c</code> 地址本身在什么地方呢？我们能否从 <code>.dynamic</code> 节区（该节区存放了和动态链接相关的数据）获取相关的信息呢？</p>
<pre><code>$ readelf -d test

Dynamic section at offset 0x4ac contains 20 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x0000000c (INIT)                       0x8048258
 0x0000000d (FINI)                       0x8048454
 0x00000004 (HASH)                       0x8048148
 0x00000005 (STRTAB)                     0x80481c0
 0x00000006 (SYMTAB)                     0x8048170
 0x0000000a (STRSZ)                      76 (bytes)
 0x0000000b (SYMENT)                     16 (bytes)
 0x00000015 (DEBUG)                      0x0
 0x00000003 (PLTGOT)                     0x8049578
 0x00000002 (PLTRELSZ)                   24 (bytes)
 0x00000014 (PLTREL)                     REL
 0x00000017 (JMPREL)                     0x8048240
 0x00000011 (REL)                        0x8048238
 0x00000012 (RELSZ)                      8 (bytes)
 0x00000013 (RELENT)                     8 (bytes)
 0x6ffffffe (VERNEED)                    0x8048218
 0x6fffffff (VERNEEDNUM)                 1
 0x6ffffff0 (VERSYM)                     0x804820c
 0x00000000 (NULL)                       0x0
</code></pre>
<p>发现 <code>0x8049578</code> 地址和 <code>0x804958c</code> 地址比较近，通过资料 <a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[8]</a> 查到前者正好是 <code>.got.plt</code> （即过程链接表）对应的全局偏移表的入口地址。难道 <code>0x804958c</code> 正好位于 <code>.got.plt</code> 节区中？</p>
<p><span id="toc_23258_14315_10"></span></p>
<h3 id="全局偏移表got">全局偏移表（got）</h3>
<p>现在进入全局偏移表看看，</p>
<pre><code>$ readelf -x .got.plt test

Hex dump of section '.got.plt':
  0x08049578 ac940408 00000000 00000000 86820408 ................
  0x08049588 96820408 a6820408                   ........
</code></pre>
<p>从上述结果可以看出 <code>0x804958c</code> 地址（即 <code>0x08049588+4</code>）处存放的是 <code>a6820408</code>，考虑到我的实验平台是 <code>i386</code>，字节顺序是 <code>little-endian</code> 的，所以实际数值应该是 <code>080482a6</code>，也就是说 <code>*</code> （<code>0x804958c</code>）<code>的值是</code>080482a6<code>，这个地址刚好是过程链接表的最后一项</code>call 80482a0<a href="mailto:printf@plt">printf@plt</a><code>中</code>80482a0<code>地址往后偏移</code>6 <code>个字节，容易猜到该地址应该就是</code>jmp` 指令的后一条地址。</p>
<pre><code>$ objdump -d -d -s -j .plt test |  grep "080482a0 &lt;printf@plt&gt;:" -A 3
080482a0 &lt;printf@plt&gt;:
 80482a0:       ff 25 8c 95 04 08       jmp    *0x804958c
 80482a6:       68 10 00 00 00          push   $0x10
 80482ab:       e9 c0 ff ff ff          jmp    8048270 &lt;_init+0x18&gt;
</code></pre>
<p><code>80482a6</code> 地址恰巧是一条 <code>push</code> 指令，随后是一条 <code>jmp</code> 指令（暂且不管 <code>push</code> 指令入栈的内容有什么意义），执行完 <code>push</code> 指令之后，就会跳转到 <code>8048270</code> 地址处，下面看看 <code>8048270</code> 地址处到底有哪些指令。</p>
<pre><code>$ objdump -d -d -s -j .plt test | grep -v "jmp    8048270 &lt;_init+0x18&gt;" | grep "08048270" -A 2
08048270 &lt;__gmon_start__@plt-0x10&gt;:
 8048270:       ff 35 7c 95 04 08       pushl  0x804957c
 8048276:       ff 25 80 95 04 08       jmp    *0x8049580
</code></pre>
<p>同样是一条入栈指令跟着一条跳转指令。不过这两个地址 <code>0x804957c</code> 和 <code>0x8049580</code> 是连续的，而且都很熟悉，刚好都在 <code>.got.plt</code> 表里头（从上面我们已经知道 <code>.got.plt</code> 的入口是 <code>0x08049578</code>）。这样的话，我们得确认这两个地址到底有什么内容。</p>
<pre><code>$ readelf -x .got.plt test

Hex dump of section '.got.plt':
  0x08049578 ac940408 00000000 00000000 86820408 ................
  0x08049588 96820408 a6820408                   ........
</code></pre>
<p>不过，遗憾的是通过 <code>readelf</code> 查看到的这两个地址信息都是 0，它们到底是什么呢？</p>
<p>现在只能求助参考资料 <a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[8]</a>，该资料的“3.8.5 过程链接表”部分在介绍过程链接表和全局偏移表相互合作解析符号的过程中的三步涉及到了这两个地址和前面没有说明的 <code>push</code> $ <code>0x10</code> 指令。</p>
<ul>
<li>在程序第一次创建内存映像时，动态链接器为全局偏移表的第二（<code>0x804957c</code>）和第三项（<code>0x8049580</code>）设置特殊值。</li>
<li>原步骤 5。在跳转到 <code>08048270 &lt;__gmon_start__@plt-0x10&gt;</code>，即过程链接表的第一项之前，有一条压入栈指令，即<code>push $0x10</code>，0x10是相对于重定位表起始地址的一个偏移地址，这个偏移地址到底有什么用呢？它应该是提供给动态链接器的什么信息吧？后面再说明。</li>
<li>原步骤 6。跳转到过程链接表的第一项之后，压入了全局偏移表中的第二项（即 <code>0x804957c</code> 处），“为动态链接器提供了识别信息的机会”（具体是什么呢？后面会简单提到，但这个并不是很重要)，然后跳转到全局偏移表的第三项（<code>0x8049580</code>，这一项比较重要），把控制权交给动态链接器。</li>
</ul>
<p>从这三步发现程序运行时地址 <code>0x8049580</code> 处存放的应该是动态链接器的入口地址，而重定位表 <code>0x10</code> 位置处和 <code>0x804957c</code> 处应该为动态链接器提供了解析符号需要的某些信息。</p>
<p>在继续之前先总结一下过程链接表和全局偏移表。上面的操作过程仅仅从“局部”看过了这两个表，但是并没有宏观地看里头的内容。下面将宏观的分析一下， 对于过程链接表：</p>
<pre><code>$ objdump -d -d -s -j .plt test
08048270 &lt;__gmon_start__@plt-0x10&gt;:
 8048270:       ff 35 7c 95 04 08       pushl  0x804957c
 8048276:       ff 25 80 95 04 08       jmp    *0x8049580
 804827c:       00 00                   add    %al,(%eax)
        ...

08048280 &lt;__gmon_start__@plt&gt;:
 8048280:       ff 25 84 95 04 08       jmp    *0x8049584
 8048286:       68 00 00 00 00          push   $0x0
 804828b:       e9 e0 ff ff ff          jmp    8048270 &lt;_init+0x18&gt;

08048290 &lt;__libc_start_main@plt&gt;:
 8048290:       ff 25 88 95 04 08       jmp    *0x8049588
 8048296:       68 08 00 00 00          push   $0x8
 804829b:       e9 d0 ff ff ff          jmp    8048270 &lt;_init+0x18&gt;

080482a0 &lt;printf@plt&gt;:
 80482a0:       ff 25 8c 95 04 08       jmp    *0x804958c
 80482a6:       68 10 00 00 00          push   $0x10
 80482ab:       e9 c0 ff ff ff          jmp    8048270 &lt;_init+0x18&gt;
</code></pre>
<p>除了该表中的第一项外，其他各项实际上是类似的。而最后一项 <code>080482a0 &lt;printf@plt&gt;</code> 和第一项我们都分析过，因此不难理解其他几项的作用。过程链接表没有办法单独工作，因为它和全局偏移表是关联的，所以在说明它的作用之前，先从总体上来看一下全局偏移表。</p>
<pre><code>$ readelf -x .got.plt test

Hex dump of section '.got.plt':
  0x08049578 ac940408 00000000 00000000 86820408 ................
  0x08049588 96820408 a6820408                   ........
</code></pre>
<p>比较全局偏移表中 <code>0x08049584</code> 处开始的数据和过程链接表第二项开始的连续三项中 <code>push</code> 指定所在的地址，不难发现，它们是对应的。而 <code>0x0804958c</code> 即 <code>push 0x10</code> 对应的地址我们刚才提到过（下一节会进一步分析），其他几项的作用类似，都是跳回到过程链接表的 <code>push</code> 指令处，随后就跳转到过程链接表的第一项，以便解析相应的符号（实际上过程链接表的第一个表项是进入动态链接器，而之前的连续两个指令则传送了需要解析的符号等信息）。另外 <code>0x08049578</code> 和 <code>0x08049580</code> 处分别存放有传递给动态链接库的相关信息和动态链接器本身的入口地址。但是还有一个地址 <code>0x08049578</code>，这个地址刚好是 <code>.dynamic</code> 的入口地址，该节区存放了和动态链接过程相关的信息，资料 <a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[8]</a> 提到这个表项实际上保留给动态链接器自己使用的，以便在不依赖其他程序的情况下对自己进行初始化，所以下面将不再关注该表项。</p>
<pre><code>$ objdump -D test | grep 080494ac
080494ac &lt;_DYNAMIC&gt;:
</code></pre>
<p><span id="toc_23258_14315_11"></span></p>
<h3 id="重定位表">重定位表</h3>
<p>这里主要接着上面的 <code>push 0x10</code> 指令来分析。通过资料 <a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[8]</a> 发现重定位表包含如何修改其他节区的信息，以便动态链接器对某些节区内的符号地址进行重定位（修改为新的地址）。那到底重定位表项提供了什么样的信息呢？</p>
<ul>
<li>每一个重定位项有三部分内容，我们重点关注前两部分。</li>
<li>第一部分是 <code>r_offset</code>，这里考虑的是可执行文件，因此根据资料发现，它的取值是被重定位影响（可以说改变或修改）到的存储单元的虚拟地址。</li>
<li>第二部分是 <code>r_info</code>，此成员给出要进行重定位的符号表索引（重定位表项引用到的符号表），以及将实施的重定位类型（如何进行符号的重定位）。(Type)。</li>
</ul>
<p>先来看看重定位表的具体内容，</p>
<pre><code>$ readelf -r test

Relocation section '.rel.dyn' at offset 0x238 contains 1 entries:
 Offset     Info    Type            Sym.Value  Sym. Name
08049574  00000106 R_386_GLOB_DAT    00000000   __gmon_start__

Relocation section '.rel.plt' at offset 0x240 contains 3 entries:
 Offset     Info    Type            Sym.Value  Sym. Name
08049584  00000107 R_386_JUMP_SLOT   00000000   __gmon_start__
08049588  00000207 R_386_JUMP_SLOT   00000000   __libc_start_main
0804958c  00000407 R_386_JUMP_SLOT   00000000   printf
</code></pre>
<p>仅仅关注和过程链接表相关的 <code>.rel.plt</code> 部分，<code>0x10</code> 刚好是 <code>1*16+0*1</code>，即 16 字节，作为重定位表的偏移，刚好对应该表的第三行。发现这个结果中竟然包含了和 <code>printf</code> 符号相关的各种信息。不过重定位表中没有直接指定符号 <code>printf</code>，而是根据 <code>r_info</code> 部分从动态符号表中计算出来的，注意观察上述结果中的 <code>Info</code> 一列的 1，2，4 和下面结果的 <code>Num</code> 列的对应关系。</p>
<pre><code>$ readelf -s test | grep ".dynsym" -A 6
Symbol table '.dynsym' contains 5 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND
     1: 00000000     0 NOTYPE  WEAK   DEFAULT  UND __gmon_start__
     2: 00000000   410 FUNC    GLOBAL DEFAULT  UND __libc_start_main@GLIBC_2.0 (2)
     3: 08048474     4 OBJECT  GLOBAL DEFAULT   14 _IO_stdin_used
     4: 00000000    57 FUNC    GLOBAL DEFAULT  UND printf@GLIBC_2.0 (2)
</code></pre>
<p>也就是说在执行过程链接表中的第一项的跳转指令（<code>jmp *0x8049580</code>）调用动态链接器以后，动态链接器因为有了 <code>push 0x10</code>，从而可以通过该重定位表项中的 <code>r_info</code> 找到对应符号（<code>printf</code>）在符号表（<code>.dynsym</code>）中的相关信息。</p>
<p>除此之外，符号表中还有 <code>Offset</code> （<code>r_offset</code>）<code>以及</code>Type<code>这两个重要信息，前者表示该重定位操作后可能影响的地址</code>0804958c<code>，这个地址刚好是</code>got<code>表项的最后一项，原来存放的是</code>push 0x10<code>指令的地址。这意味着，该地址处的内容将被修改，而如何修改呢？根据</code>Type<code>类型</code>R_386_JUMP_SLOT`，通过资料 <a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">[8]</a> 查找到该类型对应的说明如下（原资料有误，下面做了修改）：链接编辑器创建这种重定位类型主要是为了支持动态链接。其偏移地址成员给出过程链接表项的位置。动态链接器修改全局偏移表项的内容，把控制传输给指定符号的地址。</p>
<p>这说明，动态链接器将根据该类型对全局偏移表中的最有一项，即 <code>0804958c</code> 地址处的内容进行修改，修改为符号的实际地址，即 <code>printf</code> 函数在动态链接库的内存映像中的地址。</p>
<p>到这里，动态链接的宏观过程似乎已经了然于心，不过一些细节还是不太清楚。</p>
<p>下面先介绍动态链接库的创建，隐式调用和显示调用，接着进一步澄清上面还不太清楚的细节，即全局偏移表中第二项到底传递给了动态链接器什么信息？第三项是否就是动态链接器的地址？并讨论通过设置 <code>LD_BIND_NOW</code> 而不采用默认的 lazy mode 进行动态链接和采用 lazy mode 动态链接的区别？</p>
<p><span id="toc_23258_14315_12"></span></p>
<h2 id="动态链接库的创建和调用">动态链接库的创建和调用</h2>
<p>在介绍动态符号链接的更多细节之前，先来了解一下动态链接库的创建和两种使用方法，进而引出符号解析的后台细节。</p>
<p><span id="toc_23258_14315_13"></span></p>
<h3 id="创建动态链接库">创建动态链接库</h3>
<p>首先来创建一个简单动态链接库。</p>
<p>代码：</p>
<pre><code>/* myprintf.c */
#include &lt;stdio.h&gt;

int myprintf(char *str)
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("%s\n", str);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
}
</code></pre>
<pre><code>/* myprintf.h */
#ifndef _MYPRINTF_H
#define _MYPRINTF_H

int myprintf(char *);

#endif
</code></pre>
<p>演示：</p>
<pre><code>$ gcc -c myprintf.c
$ gcc -shared -Wl,-soname,libmyprintf.so.0 -o libmyprintf.so.0.0 myprintf.o
$ ln -sf libmyprintf.so.0.0 libmyprintf.so.0
$ ln -fs libmyprintf.so.0 libmyprintf.so
$ ls
libmyprintf.so  libmyprintf.so.0  libmyprintf.so.0.0  myprintf.c  myprintf.h  myprintf.o
</code></pre>
<p>得到三个文件 <code>libmyprintf.so</code>，<code>libmyprintf.so.0</code>，<code>libmyprintf.so.0.0</code>，这些库暂且存放在当前目录下。这里有一个问题值得关注，那就是为什么要创建两个符号链接呢？答案是为了在不影响兼容性的前提下升级库 <a href="http://www.ibm.com/developerworks/linux/library/l-shlibs.html">[5]</a> 。</p>
<p><span id="toc_23258_14315_14"></span></p>
<h3 id="隐式使用该库">隐式使用该库</h3>
<p>现在写一段代码来使用该库，调用其中的 <code>myprintf</code> 函数，这里是隐式使用该库：在代码中并没有直接使用该库，而是通过调用 <code>myprintf</code> 隐式地使用了该库，在编译引用该库的可执行文件时需要通过 <code>-l</code> 参数指定该库的名字。</p>
<pre><code>/* test.c */
#include &lt;stdio.h&gt;&nbsp;&nbsp;&nbsp;
#include &lt;myprintf.h&gt;

int main()
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; myprintf("Hello World");

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
}
</code></pre>
<p>编译：</p>
<pre><code>$ gcc -o test test.c -lmyprintf -L./ -I./
</code></pre>
<p>直接运行 <code>test</code>，提示找不到该库，因为库的默认搜索路径里头没有包含当前目录：</p>
<pre><code>$ ./test
./test: error while loading shared libraries: libmyprintf.so: cannot open shared object file: No such file or directory
</code></pre>
<p>如果指定库的搜索路径，则可以运行：</p>
<pre><code>$ LD_LIBRARY_PATH=$PWD ./test
Hello World
</code></pre>
<p><span id="toc_23258_14315_15"></span></p>
<h3 id="显式使用库">显式使用库</h3>
<p><code>LD_LIBRARY_PATH</code> 环境变量使得库可以放到某些指定的路径下面，而无须在调用程序中显式的指定该库的绝对路径，这样避免了把程序限制在某些绝对路径下，方便库的移动。</p>
<p>虽然显式调用有不便，但是能够避免隐式调用搜索路径的时间消耗，提高效率，除此之外，显式调用为我们提供了一组函数调用，让符号的重定位过程一览无遗。</p>
<pre><code>/* test1.c */

#include &lt;dlfcn.h&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* dlopen, dlsym, dlerror */
#include &lt;stdlib.h&gt;&nbsp;&nbsp;&nbsp;&nbsp; /* exit */
#include &lt;stdio.h&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* printf */

#define LIB_SO_NAME&nbsp;&nbsp;&nbsp;&nbsp; "./libmyprintf.so"
#define FUNC_NAME "myprintf"

typedef int (*func)(char *);

int main(void)
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *h;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *e;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; func f;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h = dlopen(LIB_SO_NAME, RTLD_LAZY);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( !h ) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("failed load libary: %s\n", LIB_SO_NAME);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f = dlsym(h, FUNC_NAME);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e = dlerror();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (e != NULL) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("search %s error: %s\n", FUNC_NAME, LIB_SO_NAME);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f("Hello World");

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(0);
}
</code></pre>
<p>演示：</p>
<pre><code>$ gcc -o test1 test1.c -ldl
</code></pre>
<p>这种情况下，无须包含头文件。从这个代码中很容易看出符号重定位的过程：</p>
<ul>
<li>首先通过 <code>dlopen</code> 找到依赖库，并加载到内存中，再返回该库的 <code>handle</code>，通过 <code>dlopen</code> 我们可以指定 <code>RTLD_LAZY</code> 采用 <code>lazy mode</code> 动态链接模式，如果采用 <code>RTLD_NOW</code> 则和隐式调用时设置 <code>LD_BIN_NOW</code> 类似。</li>
<li>找到该库以后就是对某个符号进行重定位，这里是确定 <code>myprintf</code> 函数的地址。</li>
<li>找到函数地址以后就可以直接调用该函数了。</li>
</ul>
<p>关于 <code>dlopen</code>，<code>dlsym</code> 等后台工作细节建议参考资料 <a href="http://refspecs.linuxbase.org/elf/elf.pdf">[15]</a> 。</p>
<p>隐式调用的动态符号链接过程和上面类似。下面通过一些实例来确定之前没有明确的两个内容：即全局偏移表中的第二项和第三项，并进一步讨论lazy mode和非lazy mode的区别。</p>
<p><span id="toc_23258_14315_16"></span></p>
<h2 id="动态链接过程">动态链接过程</h2>
<p>因为通过 <code>ELF</code> 文件，我们就可以确定全局偏移表的位置，因此为了确定全局偏移表位置的第三项和第四项的内容，有两种办法：</p>
<ul>
<li>通过 <code>gdb</code> 调试。</li>
<li>直接在函数内部打印。</li>
</ul>
<p>因为资料<a href="http://elfhack.whitecell.org/mydocs/ELF_symbol_resolve_process1.txt">[3]</a>详细介绍了第一种方法，这里试着通过第二种方法来确定这两个地址的值。</p>
<pre><code>/**
&nbsp;* got.c -- get the relative content of the got(global offset table) of an elf file
&nbsp;*/

#include &lt;stdio.h&gt;

#define GOT 0x8049614

int main(int argc, char *argv[])
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long got2, got3;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long old_addr, new_addr;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got2=*(long *)(GOT+4);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got3=*(long *)(GOT+8);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_addr=*(long *)(GOT+24);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("Hello World\n");

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_addr=*(long *)(GOT+24);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("got2: 0x%0x, got3: 0x%0x, old_addr: 0x%0x, new_addr: 0x%0x\n",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got2, got3, old_addr, new_addr);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
}
</code></pre>
<p>在写好上面的代码后就需要确定全局偏移表的地址，然后把该地址设置为代码中的宏 <code>GOT</code> 。</p>
<pre><code>$ make got
$ readelf -d got | grep PLTGOT
 0x00000003 (PLTGOT)                     0x8049614
</code></pre>
<p><strong>注</strong>：这里假设大家用的都是 <code>i386</code> 的系统，如果要在 <code>X86_64</code> 位系统上要编译生成 <code>i386</code> 上的可执行文件，需要给 <code>gcc</code> 传递一个 <code>-m32</code> 参数，例如：</p>
<pre><code>$ gcc -m32 -o got got.c
</code></pre>
<p>把地址 <code>0x8049614</code> 替换到上述代码中，然后重新编译运行，查看结果。</p>
<pre><code>$ make got
$ Hello World
got2: 0xb7f376d8, got3: 0xb7f2ef10, old_addr: 0x80482da, new_addr: 0xb7e19a20
$ ./got
Hello World
got2: 0xb7f1e6d8, got3: 0xb7f15f10, old_addr: 0x80482da, new_addr: 0xb7e00a20
</code></pre>
<p>通过两次运行，发现全局偏移表中的这两项是变化的，并且 <code>printf</code> 的地址对应的 <code>new_addr</code> 也是变化的，说明 <code>libc</code> 和 <code>ld-linux</code> 这两个库启动以后对应的虚拟地址并不确定。因此，无法直接跟踪到那个地址处的内容，还得借助调试工具，以便确认它们。</p>
<p>下面重新编译 <code>got</code>，加上 <code>-g</code> 参数以便调试，并通过调试确认 <code>got2</code>，<code>got3</code>，以及调用 <code>printf</code> 前后 <code>printf</code> 地址的重定位情况。</p>
<pre><code>$ gcc -g -o got got.c
$ gdb -q ./got
(gdb) l
5       #include &lt;stdio.h&gt;
6
7       #define GOT 0x8049614
8
9       int main(int argc, char *argv[])
10      {
11              long got2, got3;
12              long old_addr, new_addr;
13
14              got2=*(long *)(GOT+4);
(gdb) l
15              got3=*(long *)(GOT+8);
16              old_addr=*(long *)(GOT+24);
17
18              printf("Hello World\n");
19
20              new_addr=*(long *)(GOT+24);
21
22              printf("got2: 0x%0x, got3: 0x%0x, old_addr: 0x%0x, new_addr: 0x%0x\n",
23                                              got2, got3, old_addr, new_addr);
24
</code></pre>
<p>在第一个 <code>printf</code> 处设置一个断点：</p>
<pre><code>(gdb) break 18
Breakpoint 1 at 0x80483c3: file got.c, line 18.
</code></pre>
<p>在第二个 <code>printf</code> 处设置一个断点：</p>
<pre><code>(gdb) break 22
Breakpoint 2 at 0x80483dd: file got.c, line 22.
</code></pre>
<p>运行到第一个 <code>printf</code> 之前会停止：</p>
<pre><code>(gdb) r
Starting program: /mnt/hda8/Temp/c/program/got

Breakpoint 1, main () at got.c:18
18              printf("Hello World\n");
</code></pre>
<p>查看执行 <code>printf</code> 之前的全局偏移表内容：</p>
<pre><code>(gdb) x/8x 0x8049614
0x8049614 &lt;_GLOBAL_OFFSET_TABLE_&gt;:      0x08049548      0xb7f3c6d8      0xb7f33f10      0x080482aa
0x8049624 &lt;_GLOBAL_OFFSET_TABLE_+16&gt;:   0xb7ddbd20      0x080482ca      0x080482da      0x00000000
</code></pre>
<p>查看 <code>GOT</code> 表项的最有一项，发现刚好是 <code>PLT</code> 表中 <code>push</code> 指令的地址：</p>
<pre><code>(gdb) disassemble 0x080482da
Dump of assembler code for function puts@plt:
0x080482d4 &lt;puts@plt+0&gt;:        jmp    *0x804962c
0x080482da &lt;puts@plt+6&gt;:        push   $0x18
0x080482df &lt;puts@plt+11&gt;:       jmp    0x8048294 &lt;_init+24&gt;
</code></pre>
<p>说明此时还没有进行进行符号的重定位，不过发现并非 <code>printf</code>，而是 <code>puts(1)</code>。</p>
<p>接着查看 <code>GOT</code> 第三项的内容，刚好是 <code>dl-linux</code> 对应的代码：</p>
<pre><code>(gdb) disassemble 0xb7f33f10
Dump of assembler code for function _dl_runtime_resolve:
0xb7f33f10 &lt;_dl_runtime_resolve+0&gt;:     push   %eax
0xb7f33f11 &lt;_dl_runtime_resolve+1&gt;:     push   %ecx
0xb7f33f12 &lt;_dl_runtime_resolve+2&gt;:     push   %edx
</code></pre>
<p>可通过 <code>nm /lib/ld-linux.so.2 | grep _dl_runtime_resolve</code> 进行确认。</p>
<p>然后查看 <code>GOT</code> 表第二项处的内容，看不出什么特别的信息，反编译时提示无法反编译：</p>
<pre><code>(gdb) x/8x 0xb7f3c6d8
0xb7f3c6d8:     0x00000000      0xb7f39c3d      0x08049548      0xb7f3c9b8
0xb7f3c6e8:     0x00000000      0xb7f3c6d8      0x00000000      0xb7f3c9a4
</code></pre>
<p>在 <code>*(0xb7f33f10)</code> 指向的代码处设置一个断点，确认它是否被执行：</p>
<pre><code>(gdb) break *(0xb7f33f10)
break *(0xb7f33f10)
Breakpoint 3 at 0xb7f3cf10
(gdb) c
Continuing.

Breakpoint 3, 0xb7f3cf10 in _dl_runtime_resolve () from /lib/ld-linux.so.2
</code></pre>
<p>继续运行，直到第二次调用 <code>printf</code> ：</p>
<pre><code>(gdb)  c
Continuing.
Hello World

Breakpoint 2, main () at got.c:22
22              printf("got2: 0x%0x, got3: 0x%0x, old_addr: 0x%0x, new_addr: 0x%0x\n",
</code></pre>
<p>再次查看 <code>GOT</code> 表项，发现 <code>GOT</code> 表的最后一项的值应该被修改：</p>
<pre><code>(gdb) x/8x 0x8049614
0x8049614 &lt;_GLOBAL_OFFSET_TABLE_&gt;:      0x08049548      0xb7f3c6d8      0xb7f33f10      0x080482aa
0x8049624 &lt;_GLOBAL_OFFSET_TABLE_+16&gt;:   0xb7ddbd20      0x080482ca      0xb7e1ea20      0x00000000
</code></pre>
<p>查看 <code>GOT</code> 表最后一项，发现变成了 <code>puts</code> 函数的代码，说明进行了符号 <code>puts</code> 的重定位（2）：</p>
<pre><code>(gdb) disassemble 0xb7e1ea20
Dump of assembler code for function puts:
0xb7e1ea20 &lt;puts+0&gt;:    push   %ebp
0xb7e1ea21 &lt;puts+1&gt;:    mov    %esp,%ebp
0xb7e1ea23 &lt;puts+3&gt;:    sub    $0x1c,%esp
</code></pre>
<p>通过演示发现一个问题（1）（2），即本来调用的是 <code>printf</code>，为什么会进行 <code>puts</code> 的重定位呢？通过 <code>gcc -S</code> 参数编译生成汇编代码后发现，<code>gcc</code> 把 <code>printf</code> 替换成了 <code>puts</code>，因此不难理解程序运行过程为什么对 <code>puts</code> 进行了重定位。</p>
<p>从演示中不难发现，当符号被使用到时才进行重定位。因为通过调试发现在执行 <code>printf</code> 之后，<code>GOT</code> 表项的最后一项才被修改为 <code>printf</code> （确切的说是 <code>puts</code>）的地址。这就是所谓的 <code>lazy mode</code> 动态符号链接方式。</p>
<p>除此之外，我们容易发现 <code>GOT</code> 表第三项确实是 <code>ld-linux.so</code> 中的某个函数地址，并且发现在执行 <code>printf</code> 语句之前，先进入了 <code>ld-linux.so</code> 的 <code>_dl_runtime_resolve</code> 函数，而且在它返回之后，<code>GOT</code> 表的最后一项才变为 <code>printf</code> （<code>puts</code>）的地址。</p>
<p>本来打算通过第一个断点确认第二次调用 <code>printf</code> 时不再需要进行动态符号链接的，不过因为 <code>gcc</code> 把第一个替换成了 <code>puts</code>，所以这里没有办法继续调试。如果想确认这个，你可以通过写两个一样的 <code>printf</code> 语句看看。实际上第一次链接以后，<code>GOT</code> 表的第三项已经修改了，当下次再进入过程链接表，并执行 <code>jmp *(全局偏移表中某一个地址)</code> 指令时，<code>*(全局偏移表中某一个地址)</code> 已经被修改为了对应符号的实际地址，这样 <code>jmp</code> 语句会自动跳转到符号的地址处运行，执行具体的函数代码，因此无须再进行重定位。</p>
<p>到现在 <code>GOT</code> 表中只剩下第二项还没有被确认，通过资料 <a href="http://elfhack.whitecell.org/mydocs/ELF_symbol_resolve_process1.txt">[3]</a> 我们发现，该项指向一个 <code>link_map</code> 类型的数据，是一个鉴别信息，具体作用对我们来说并不是很重要，如果想了解，请参考资料 <a href="http://www.muppetlabs.com/~breadbox/software/ELF.txt">[16]</a> 。</p>
<p>下面通过设置 <code>LD_BIND_NOW</code> 再运行一下 <code>got</code> 程序并查看结果，比较它与默认的动态链接方式（<code>lazy mode</code>）的异同。</p>
<ul>
<li> <p>设置 <code>LD_BIND_NOW</code> 环境变量的运行结果</p> <pre><code>  $ LD_BIND_NOW=1 ./got
  Hello World
  got2: 0x0, got3: 0x0, old_addr: 0xb7e61a20, new_addr: 0xb7e61a20
</code></pre> </li>
<li> <p>默认情况下的运行结果</p> <pre><code>  $ ./got
  Hello World
  got2: 0xb7f806d8, got3: 0xb7f77f10, old_addr: 0x80482da, new_addr: 0xb7e62a20
</code></pre> </li>
</ul>
<p>通过比较容易发现，在非 <code>lazy mode</code> （设置 <code>LD_BIND_NOW</code> 后）下，程序运行之前符号的地址就已经被确定，即调用 <code>printf</code> 之前 <code>GOT</code> 表的最后一项已经被确定为了 <code>printf</code> 函数对应的地址，即 <code>0xb7e61a20</code>，因此在程序运行之后，<code>GOT</code> 表的第二项和第三项就保持为 0，因为此时不再需要它们进行符号的重定位了。通过这样一个比较，就更容易理解 <code>lazy mode</code> 的特点了：在用到的时候才解析。</p>
<p>到这里，符号动态链接的细节基本上就已经清楚了。</p>
<p><span id="toc_23258_14315_17"></span></p>
<h2 id="参考资料">参考资料</h2>
<ul>
<li> <p><a href="http://www.ccw.com.cn/htm/app/linux/develop/01_8_6_2.asp">LINUX 系统中动态链接库的创建与使用</a></p> </li>
<li> <p><a href="http://www.vchome.net/tech/dll/dll9.htm">LINUX 动态链接库高级应用</a></p> </li>
<li> <p><a href="http://elfhack.whitecell.org/mydocs/ELF_symbol_resolve_process1.txt">ELF 动态解析符号过程(修订版)</a></p> </li>
<li> <p><a href="http://unix-cd.com/unixcd12/article_5065.html">如何在 Linux 下调试动态链接库</a></p> </li>
<li> <p><a href="http://www.ibm.com/developerworks/linux/library/l-shlibs.html">Dissecting shared libraries</a></p> </li>
<li> <p><a href="http://fanqiang.chinaunix.net/safe/system/2007-02-01/4870.shtml">关于 Linux 和 Unix 动态链接库的安全</a></p> </li>
<li> <p><a href="http://article.pchome.net/content-323084.html">Linux 系统下解析 ELF 文件 DT_RPATH 后门</a></p> </li>
<li> <p><a href="http://162.105.203.48/web/gaikuang/submission/TN05.ELF.Format.Summary.pdf">ELF 文件格式分析</a></p> </li>
<li> <p><a href="02-chapter5.markdown">缓冲区溢出与注入分析(第二部分：缓冲区溢出和注入实例)</a></p> </li>
<li> <p><a href="02-chapter2.markdown">Gcc 编译的背后(第二部分：汇编和链接)</a></p> </li>
<li> <p><a href="02-chapter3.markdown">程序执行的那一刹那</a></p> </li>
</ul>
<ul>
<li> <p>What is Linux-gate.so.1: <a href="http://www.trilithium.com/johan/2005/08/linux-gate/">[1]</a>, <a href="http://isomerica.net/archives/2007/05/28/what-is-linux-gateso1-and-why-is-it-missing-on-x86-64/">[2]</a>, <a href="http://www.linux010.cn/program/Linux-gateso1-DeHanYi-pcee6103.htm">[3]</a></p> </li>
<li> <p><a href="http://www.ibm.com/developerworks/cn/linux/l-overflow/index.html">Linux 下缓冲区溢出攻击的原理及对策</a></p> </li>
<li> <p>Intel 平台下 Linux 中 ELF 文件动态链接的加载、解析及实例分析 <a href="http://www.ibm.com/developerworks/cn/linux/l-elf/part1/index.html">part1</a>, <a href="http://www.ibm.com/developerworks/cn/linux/l-elf/part2/index.html">part2</a></p> </li>
<li> <p><a href="http://refspecs.linuxbase.org/elf/elf.pdf">ELF file format and ABI</a></p> </li>
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
<a href="/book/102/index.html">
<img class="uk-book-cover" src="/static/icons/48/c_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/102/index.html">C 语言进阶</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/62.html">tzivanmoe</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="c">c</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">32页</span>
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
<a href="/book/25/index.html">
<img class="uk-book-cover" src="/static/icons/48/c_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/25/index.html">笨办法学C</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/15.html">wizardforcel</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="c">c</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">54页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 524个">524</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/3/index.html">
<img class="uk-book-cover" src="/static/icons/48/go_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/3/index.html">深入解析Go</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/3.html">tiancaiamao</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="go">go</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">41页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月1日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 1018个">1018</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/18/index.html">
<img class="uk-book-cover" src="/static/icons/48/go_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/18/index.html">Go社区的知识图谱</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/13.html">golang foundation</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="go">go</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">1页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 1356个">1356</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/199/index.html">
<img class="uk-book-cover" src="/static/icons/48/markdown_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/199/index.html">什么是 Markdown</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/112.html">frank-lam</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="markdown">markdown</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">38页</span>
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
<a href="/book/122/index.html">
<img class="uk-book-cover" src="/static/icons/48/spark_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/122/index.html">Databricks Spark 知识库简体中文版</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/62.html">tzivanmoe</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="spark">spark</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">15页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年7月1日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 1个">1</span>
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
<a href="/book/43/index.html" data-book-page-rel-url="index.html" data-book-page-id="0" title="封面">封面</a>
</li>
<li>
<a class="pjax" href="/book/43/readme.html" data-book-page-rel-url="readme.html" data-book-page-id="0" title="简介">简介</a>
</li>
<li>
<a class="pjax" href="/book/43/README.md" title="简介" data-book-page-rel-url="README.md" data-book-page-id="2868">简介</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/preface/01-chapter0.markdown" title="版本修订历史" data-book-page-rel-url="zh/preface/01-chapter0.markdown" data-book-page-id="2869">版本修订历史</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/preface/01-chapter1.markdown" title="前言" data-book-page-rel-url="zh/preface/01-chapter1.markdown" data-book-page-id="2870">前言</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter1.markdown" title="把 Vim 打造成源代码编辑器" data-book-page-rel-url="zh/chapters/02-chapter1.markdown" data-book-page-id="2871">把 Vim 打造成源代码编辑器</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter2.markdown" title="Gcc 编译的背后" data-book-page-rel-url="zh/chapters/02-chapter2.markdown" data-book-page-id="2872">Gcc 编译的背后</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter3.markdown" title="程序执行的一刹那" data-book-page-rel-url="zh/chapters/02-chapter3.markdown" data-book-page-id="2873">程序执行的一刹那</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter4.markdown" title="动态符号链接的细节" data-book-page-rel-url="zh/chapters/02-chapter4.markdown" data-book-page-id="2874">动态符号链接的细节</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter5.markdown" title="缓冲区溢出与注入分析" data-book-page-rel-url="zh/chapters/02-chapter5.markdown" data-book-page-id="2875">缓冲区溢出与注入分析</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter6.markdown" title="进程的内存映像" data-book-page-rel-url="zh/chapters/02-chapter6.markdown" data-book-page-id="2876">进程的内存映像</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter7.markdown" title="进程和进程的基本操作" data-book-page-rel-url="zh/chapters/02-chapter7.markdown" data-book-page-id="2877">进程和进程的基本操作</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter8.markdown" title="打造史上最小可执行ELF文件(45字节)" data-book-page-rel-url="zh/chapters/02-chapter8.markdown" data-book-page-id="2878">打造史上最小可执行ELF文件(45字节)</a>
</li>
<li>
<a class="pjax" href="/book/43/zh/chapters/02-chapter9.markdown" title="代码测试、调试与优化" data-book-page-rel-url="zh/chapters/02-chapter9.markdown" data-book-page-id="2879">代码测试、调试与优化</a>
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
<script type="text/javascript">var bookId =43;var bookPageId =2874;var bookPageRelUrl ='zh/chapters/02-chapter4.markdown';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>