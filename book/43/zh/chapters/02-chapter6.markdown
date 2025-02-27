
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>进程的内存映像-C 语言编程透视</title>
<meta content='进程的内存映像,C 语言编程透视' name='keywords'>
<meta content='进程的内存映像,C 语言编程透视' name='description'>
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
<a href="/book/43/zh/chapters/02-chapter5.markdown">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">缓冲区溢出与注入分析</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/43/zh/chapters/02-chapter7.markdown">
<span class="">进程和进程的基本操作</span>
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
<h1 id="进程的内存映像">进程的内存映像</h1>
<ul>
<li><a href="#toc_14856_6356_1">前言</a></li>
<li><a href="#toc_14856_6356_2">进程内存映像表</a></li>
<li><a href="#toc_14856_6356_3">在程序内部打印内存分布信息</a></li>
<li><a href="#toc_14856_6356_4">在程序内部获取完整内存分布信息</a></li>
<li><a href="#toc_14856_6356_5">后记</a></li>
<li><a href="#toc_14856_6356_6">参考资料</a></li>
</ul>
<p><span id="toc_14856_6356_1"></span></p>
<h2 id="前言">前言</h2>
<p>在阅读《<a href="https://en.wikipedia.org/wiki/Advanced_Programming_in_the_Unix_Environment">UNIX 环境高级编程</a>》的第 14 章时，看到一个“打印不同类型的数据所存放的位置”的例子，它非常清晰地从程序内部反应了“进程的内存映像”，通过结合它与<a href="02-chapter2.markdown">《Gcc 编译的背后》</a>和<a href="02-chapter5.markdown">《缓冲区溢出与注入分析》</a>的相关内容，可以更好地辅助理解相关的内容。</p>
<p><span id="toc_14856_6356_2"></span></p>
<h2 id="进程内存映像表">进程内存映像表</h2>
<p>首先回顾一下<a href="02-chapter5.markdown">《缓冲区溢出与注入》</a>中提到的"进程内存映像表"，并把共享内存的大概位置加入该表：</p>
<table>
<thead>
<tr>
<th>地址</th>
<th>内核空间</th>
<th>描述</th>
</tr>
</thead>
<tbody>
<tr>
<td>0xC0000000</td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td>(program flie) 程序名</td>
<td>execve 的第一个参数</td>
</tr>
<tr>
<td></td>
<td>(environment) 环境变量</td>
<td>execve 的第三个参数，main 的第三个参数</td>
</tr>
<tr>
<td></td>
<td>(arguments) 参数</td>
<td>execve 的第二个参数，main 的形参</td>
</tr>
<tr>
<td></td>
<td>(stack) 栈</td>
<td>自动变量以及每次函数调用时所需保存的信息都</td>
</tr>
<tr>
<td></td>
<td></td>
<td>存放在此，包括函数返回地址、调用者的</td>
</tr>
<tr>
<td></td>
<td></td>
<td>环境信息等，函数的参数，局部变量都存放在此</td>
</tr>
<tr>
<td></td>
<td>(shared memory) 共享内存</td>
<td>共享内存的大概位置</td>
</tr>
<tr>
<td></td>
<td>...</td>
<td></td>
</tr>
<tr>
<td></td>
<td>...</td>
<td></td>
</tr>
<tr>
<td></td>
<td>(heap) 堆</td>
<td>主要在这里进行动态存储分配，比如 malloc，new 等。</td>
</tr>
<tr>
<td></td>
<td>...</td>
<td></td>
</tr>
<tr>
<td></td>
<td>.bss (uninitilized data)</td>
<td>没有初始化的数据（全局变量哦）</td>
</tr>
<tr>
<td></td>
<td>.data (initilized global data)</td>
<td>已经初始化的全局数据（全局变量）</td>
</tr>
<tr>
<td></td>
<td>.text (Executable Instructions)</td>
<td>通常是可执行指令</td>
</tr>
<tr>
<td>0x08048000</td>
<td></td>
<td></td>
</tr>
<tr>
<td>0x00000000</td>
<td></td>
<td>...</td>
</tr>
</tbody>
</table>
<p><span id="toc_14856_6356_3"></span></p>
<h2 id="在程序内部打印内存分布信息">在程序内部打印内存分布信息</h2>
<p>为了能够反应上述内存分布情况，这里在《<a href="https://en.wikipedia.org/wiki/Advanced_Programming_in_the_Unix_Environment">UNIX 环境高级编程</a>》的程序 14-11 的基础上，添加了一个已经初始化的全局变量（存放在已经初始化的数据段内），并打印了它以及 <code>main</code> 函数(处在代码正文部分)的位置。</p>
<pre><code>/**
&nbsp;* showmemory.c -- print the position of different types of data in a program in the memory
&nbsp;*/

#include &lt;sys/types.h&gt;
#include &lt;sys/ipc.h&gt;
#include &lt;sys/shm.h&gt;
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

#define ARRAY_SIZE 4000
#define MALLOC_SIZE 100000
#define SHM_SIZE 100000
#define SHM_MODE (SHM_R | SHM_W)&nbsp;&nbsp;&nbsp; /* user read/write */

int init_global_variable = 5;&nbsp;&nbsp;&nbsp; /* initialized global variable */
char array[ARRAY_SIZE];&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; /* uninitialized data = bss */

int main(void)
{
&nbsp;&nbsp;&nbsp; int shmid;
&nbsp;&nbsp;&nbsp; char *ptr, *shmptr;

&nbsp;&nbsp;&nbsp; printf("main: the address of the main function is %x\n", main);
&nbsp;&nbsp;&nbsp; printf("data: data segment is from %x\n", &amp;init_global_variable);
&nbsp;&nbsp;&nbsp; printf("bss: array[] from %x to %x\n", &amp;array[0], &amp;array[ARRAY_SIZE]);
&nbsp;&nbsp;&nbsp; printf("stack: around %x\n", &amp;shmid);&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; /* shmid is a local variable, which is stored in the stack, hence, you
&nbsp;&nbsp;&nbsp; &nbsp;* can get the address of the stack via it*/

&nbsp;&nbsp;&nbsp; if ( (ptr = malloc(MALLOC_SIZE)) == NULL) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("malloc error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; printf("heap: malloced from %x to %x\n", ptr, ptr+MALLOC_SIZE);

&nbsp;&nbsp;&nbsp; if ( (shmid = shmget(IPC_PRIVATE, SHM_SIZE, SHM_MODE)) &lt; 0) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("shmget error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; if ( (shmptr = shmat(shmid, 0, 0)) == (void *) -1) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("shmat error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; printf("shared memory: attached from %x to %x\n", shmptr, shmptr+SHM_SIZE);

&nbsp;&nbsp;&nbsp; if (shmctl(shmid, IPC_RMID, 0) &lt; 0) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("shmctl error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; exit(0);
}
</code></pre>
<p>该程序的运行结果如下：</p>
<pre><code>$  make showmemory
cc     showmemory.c   -o showmemory
$ ./showmemory
main: the address of the main function is 804846c
data: data segment is from 80498e8
bss: array[] from 8049920 to 804a8c0
stack: around bfe3e224
heap: malloced from 804b008 to 80636a8
shared memory: attached from b7da7000 to b7dbf6a0
</code></pre>
<p>上述运行结果反应了几个重要部分数据的大概分布情况，比如 <code>data</code> 段（那个初始化过的全局变量就位于这里）、bss 段、stack、heap，以及 shared memory 和main（代码段）的内存分布情况。</p>
<p><span id="toc_14856_6356_4"></span></p>
<h2 id="在程序内部获取完整内存分布信息">在程序内部获取完整内存分布信息</h2>
<p>不过，这些结果还是没有精确和完整地反应所有相关信息，如果要想在程序内完整反应这些信息，结合<a href="02-chapter2.markdown">《Gcc编译的背后》</a>，就不难想到，我们还可以通过扩展一些已经链接到可执行文件中的外部符号来获取它们。这些外部符号全部定义在可执行文件的符号表中，可以通过 <code>nm/readelf -s/objdump -t</code> 等查看到，例如：</p>
<pre><code>$ nm showmemory
080497e4 d _DYNAMIC
080498b0 d _GLOBAL_OFFSET_TABLE_
080486c8 R _IO_stdin_used
         w _Jv_RegisterClasses
080497d4 d __CTOR_END__
080497d0 d __CTOR_LIST__
080497dc d __DTOR_END__
080497d8 d __DTOR_LIST__
080487cc r __FRAME_END__
080497e0 d __JCR_END__
080497e0 d __JCR_LIST__
080498ec A __bss_start
080498dc D __data_start
08048680 t __do_global_ctors_aux
08048414 t __do_global_dtors_aux
080498e0 D __dso_handle
         w __gmon_start__
0804867a T __i686.get_pc_thunk.bx
080497d0 d __init_array_end
080497d0 d __init_array_start
08048610 T __libc_csu_fini
08048620 T __libc_csu_init
         U __libc_start_main@@GLIBC_2.0
080498ec A _edata
0804a8c0 A _end
080486a8 T _fini
080486c4 R _fp_hw
08048328 T _init
080483f0 T _start
08049920 B array
08049900 b completed.1
080498dc W data_start
         U exit@@GLIBC_2.0
08048444 t frame_dummy
080498e8 D init_global_variable
0804846c T main
         U malloc@@GLIBC_2.0
080498e4 d p.0
         U printf@@GLIBC_2.0
         U shmat@@GLIBC_2.0
         U shmctl@@GLIBC_2.2
         U shmget@@GLIBC_2.0
</code></pre>
<p>第三列的符号在我们的程序中被扩展以后就可以直接引用，这些符号基本上就已经完整地覆盖了相关的信息了，这样就可以得到一个更完整的程序，从而完全反应上面提到的内存分布表的信息。</p>
<pre><code>/**
&nbsp;* showmemory.c -- print the position of different types of data in a program in the memory
&nbsp;*/

#include &lt;sys/types.h&gt;
#include &lt;sys/ipc.h&gt;
#include &lt;sys/shm.h&gt;
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

#define ARRAY_SIZE 4000
#define MALLOC_SIZE 100000
#define SHM_SIZE 100000
#define SHM_MODE (SHM_R | SHM_W)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* user read/write */

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* declare the address relative variables */
extern char _start, __data_start, __bss_start, etext, edata, end;
extern char **environ;

char array[ARRAY_SIZE];&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* uninitialized data = bss */

int main(int argc, char *argv[])
{
    int shmid;
    char *ptr, *shmptr;

    printf("===== memory map =====\n");
    printf(".text:\t0x%x-&gt;0x%x (_start, code text)\n", &amp;_start, &amp;etext);
    printf(".data:\t0x%x-&gt;0x%x (__data_start, initilized data)\n", &amp;__data_start, &amp;edata);
    printf(".bss: \t0x%x-&gt;0x%x (__bss_start, uninitilized data)\n", &amp;__bss_start, &amp;end);

    /* shmid is a local variable, which is stored in the stack, hence, you
&nbsp;&nbsp;&nbsp; &nbsp;* can get the address of the stack via it*/

&nbsp;&nbsp;&nbsp; if ( (ptr = malloc(MALLOC_SIZE)) == NULL) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("malloc error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; printf("heap: \t0x%x-&gt;0x%x (address of the malloc space)\n", ptr, ptr+MALLOC_SIZE);

&nbsp;&nbsp;&nbsp; if ( (shmid = shmget(IPC_PRIVATE, SHM_SIZE, SHM_MODE)) &lt; 0) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("shmget error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; if ( (shmptr = shmat(shmid, 0, 0)) == (void *) -1) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("shmat error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; printf("shm&nbsp; :\t0x%x-&gt;0x%x (address of shared memory)\n", shmptr, shmptr+SHM_SIZE);

&nbsp;&nbsp;&nbsp; if (shmctl(shmid, IPC_RMID, 0) &lt; 0) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; printf("shmctl error!\n");
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; exit(-1);
&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; printf("stack:\t &lt;--0x%x--&gt; (address of local variables)\n", &amp;shmid);&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; printf("arg:&nbsp; \t0x%x (address of arguments)\n", argv);
&nbsp;&nbsp;&nbsp; printf("env:&nbsp; \t0x%x (address of environment variables)\n", environ);

&nbsp;&nbsp;&nbsp; exit(0);
}
</code></pre>
<p>运行结果：</p>
<pre><code>$ make showmemory
$ ./showmemory
===== memory map =====
.text:    0x8048440-&gt;0x8048754 (_start, code text)
.data:    0x8049a3c-&gt;0x8049a48 (__data_start, initilized data)
.bss:     0x8049a48-&gt;0x804aa20 (__bss_start, uninitilized data)
heap:     0x804b008-&gt;0x80636a8 (address of the malloc space)
shm  :    0xb7db6000-&gt;0xb7dce6a0 (address of shared memory)
stack:     &lt;--0xbff85b64--&gt; (address of local variables)
arg:      0xbff85bf4 (address of arguments)
env:      0xbff85bfc (address of environment variables)
</code></pre>
<p><span id="toc_14856_6356_5"></span></p>
<h2 id="后记">后记</h2>
<p>上述程序完整地勾勒出了进程的内存分布的各个重要部分，这样就可以从程序内部获取跟程序相关的所有数据了，一个非常典型的例子是，在程序运行的过程中检查代码正文部分是否被恶意篡改。</p>
<p>如果想更深地理解相关内容，那么可以试着利用 <code>readelf</code>，<code>objdump</code> 等来分析 ELF 可执行文件格式的结构，并利用 <code>gdb</code> 来了解程序运行过程中的内存变化情况。</p>
<p><span id="toc_14856_6356_6"></span></p>
<h2 id="参考资料">参考资料</h2>
<ul>
<li><a href="02-chapter2.markdown">Gcc 编译的背后（第二部分：汇编和链接）</a></li>
<li><a href="02-chapter5.markdown">缓冲区溢出与注入分析</a></li>
<li>《<a href="https://en.wikipedia.org/wiki/Advanced_Programming_in_the_Unix_Environment">Unix 环境高级编程</a>》第 14 章，程序 14-11</li>
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
<a href="/book/164/index.html">
<img class="uk-book-cover" src="/static/icons/48/go_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/164/index.html">Go 开发者路线图</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/93.html">Alikhll</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="go">go</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2019年5月26日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 4583个">4583</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/111/index.html">
<img class="uk-book-cover" src="/static/icons/48/kubernetes_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/111/index.html">和我一步步部署 kubernetes 集群</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/62.html">tzivanmoe</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="kubernetes">kubernetes</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">17页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年7月1日</span>
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
<a href="/book/98/index.html">
<img class="uk-book-cover" src="/static/icons/48/visualstudio_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/98/index.html">Microsoft Visual Studio Code 中文手册</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/60.html">likebeta</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="visualstudio">visualstudio</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">66页</span>
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
<a href="/book/144/index.html">
<img class="uk-book-cover" src="/static/icons/48/gulp_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/144/index.html">gulp 入门指南</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/39.html">onface</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="gulp">gulp</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">8页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2019年3月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 1780个">1780</span>
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
<script type="text/javascript">var bookId =43;var bookPageId =2876;var bookPageRelUrl ='zh/chapters/02-chapter6.markdown';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>