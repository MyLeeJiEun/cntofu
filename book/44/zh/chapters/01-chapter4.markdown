
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>字符串操作-Shell 编程范例</title>
<meta content='字符串操作,Shell 编程范例' name='keywords'>
<meta content='字符串操作,Shell 编程范例' name='description'>
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
<a href="/book/44/zh/chapters/01-chapter3.markdown">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">布尔运算</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/44/zh/chapters/01-chapter5.markdown">
<span class="">文件操作</span>
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
<h1 id="字符串操作">字符串操作</h1>
<ul>
<li><a href="#toc_1903_12123_1">前言</a></li>
<li><a href="#toc_1903_12123_2">字符串的属性</a></li>
<li><a href="#toc_1903_12123_3">字符串的类型</a></li>
<li><a href="#toc_1903_12123_4">范例：数字或者数字组合</a></li>
<li><a href="#toc_1903_12123_5">范例：字符组合（小写字母、大写字母、两者的组合）</a></li>
<li><a href="#toc_1903_12123_6">范例：字母和数字的组合</a></li>
<li><a href="#toc_1903_12123_7">范例：空格或者 Tab 键等</a></li>
<li><a href="#toc_1903_12123_8">范例：匹配邮件地址</a></li>
<li><a href="#toc_1903_12123_9">范例：匹配 URL 地址(以 http 链接为例）</a></li>
<li><a href="#toc_1903_12123_10">范例：判断字符是否为可打印字符</a></li>
<li><a href="#toc_1903_12123_11">字符串的长度</a></li>
<li><a href="#toc_1903_12123_12">范例：计算某个字符串的长度</a></li>
<li><a href="#toc_1903_12123_13">范例：计算某些指定字符或者字符组合的个数</a></li>
<li><a href="#toc_1903_12123_14">范例：统计单词个数</a></li>
<li><a href="#toc_1903_12123_15">字符串的显示</a></li>
<li><a href="#toc_1903_12123_16">范例：在屏幕控制字符显示位置、颜色、背景等</a></li>
<li><a href="#toc_1903_12123_17">范例：在屏幕的某个位置动态显示当前系统时间</a></li>
<li><a href="#toc_1903_12123_18">范例：过滤掉某些控制字符串</a></li>
<li><a href="#toc_1903_12123_19">字符串的存储</a></li>
<li><a href="#toc_1903_12123_20">范例：把字符串拆分成字符串数组</a></li>
<li><a href="#toc_1903_12123_21">字符串常规操作</a></li>
<li><a href="#toc_1903_12123_22">取子串</a></li>
<li><a href="#toc_1903_12123_23">范例：按照位置取子串</a></li>
<li><a href="#toc_1903_12123_24">范例：匹配字符求子串</a></li>
<li><a href="#toc_1903_12123_25">查询子串</a></li>
<li><a href="#toc_1903_12123_26">范例：查询子串在目标串中的位置</a></li>
<li><a href="#toc_1903_12123_27">范例：查询子串，返回包含子串的行</a></li>
<li><a href="#toc_1903_12123_28">子串替换</a></li>
<li><a href="#toc_1903_12123_29">范例：把变量 var 中的空格替换成下划线</a></li>
<li><a href="#toc_1903_12123_30">插入子串</a></li>
<li><a href="#toc_1903_12123_31">范例：在 var 字符串的空格之前或之后插入一个下划线</a></li>
<li><a href="#toc_1903_12123_32">删除子串</a></li>
<li><a href="#toc_1903_12123_33">范例：把 var 字符串中所有的空格给删除掉。</a></li>
<li><a href="#toc_1903_12123_34">子串比较</a></li>
<li><a href="#toc_1903_12123_35">子串排序</a></li>
<li><a href="#toc_1903_12123_36">子串进制转换</a></li>
<li><a href="#toc_1903_12123_37">子串编码转换</a></li>
<li><a href="#toc_1903_12123_38">字符串操作进阶</a></li>
<li><a href="#toc_1903_12123_39">正则表达式</a></li>
<li><a href="#toc_1903_12123_40">范例：处理 URL 地址</a></li>
<li><a href="#toc_1903_12123_41">范例：匹配某个文件中的特定范围的行</a></li>
<li><a href="#toc_1903_12123_42">处理格式化的文本</a></li>
<li><a href="#toc_1903_12123_43">范例：选取指定列</a></li>
<li><a href="#toc_1903_12123_44">范例：文件关联操作</a></li>
<li><a href="#toc_1903_12123_45">参考资料</a></li>
<li><a href="#toc_1903_12123_46">后记</a></li>
</ul>
<p><span id="toc_1903_12123_1"></span></p>
<h2 id="前言">前言</h2>
<p>忙活了一个礼拜，终于等到周末，可以空下来写点东西。</p>
<p>之前已经完成<a href="01-chapter2.markdown">《数值运算》</a>和<a href="01-chapter3.markdown">《布尔运算》</a>，这次轮到介绍<em>字符串操作</em> 。咱们先得弄明白两个内容：</p>
<ul>
<li>什么是字符串？</li>
<li>对字符串有哪些操作？</li>
</ul>
<p>下面是"在线新华字典"的解释：</p>
<blockquote>
<p>字符串: 简称“串”。有限字符的序列。数据元素为字符的线性表，是一种数据的逻辑结构。在计算机中可有不同的存储结构。在串上可进行求子串、插入字符、删除字符、置换字符等运算。</p>
</blockquote>
<p>而字符呢？</p>
<blockquote>
<p>字符: 计算机程序设计及操作时使用的符号。包括字母、数字、空格符、提示符及各种专用字符等。</p>
</blockquote>
<p>照这样说，之前介绍的<a href="01-chapter2.markdown">数值运算</a>中的数字，<a href="01-chapter3.markdown">布尔运算</a>中的真假值，都是以字符的形式呈现出来的，是一种特别的字符，对它们的运算只不过是字符操作的特例罢了。而这里将研究一般字符的运算，它具有非常重要的意义，因为对我们来说，一般的工作都是处理字符而已。这些运算实际上将围绕上述两个定义来做，它们包括：</p>
<ul>
<li> <p>找出字符或者字符串的类型，是数字、字母还是其他特定字符，是可打印字符，还是不可打印字符（一些控制字符）。</p> </li>
<li> <p>找出组成字符串的字符个数和字符串的存储结构（比如数组）。</p> </li>
<li> <p>对串的常规操作：求子串、插入字符、删除字符、置换字符、字符串的比较等。</p> </li>
<li> <p>对串的一些比较复杂而有趣的操作，这里将在最后介绍一些有趣的范例。</p> </li>
</ul>
<p><span id="toc_1903_12123_2"></span></p>
<h2 id="字符串的属性">字符串的属性</h2>
<p><span id="toc_1903_12123_3"></span></p>
<h3 id="字符串的类型">字符串的类型</h3>
<p>字符有可能是数字、字母、空格、其他特殊字符，而字符串有可能是它们中的一种或者多种的组合，在组合之后还可能形成具有特定意义的字符串，诸如邮件地址，URL地址等。</p>
<p><span id="toc_1903_12123_4"></span></p>
<h4 id="范例数字或者数字组合">范例：数字或者数字组合</h4>
<pre><code>$ i=5;j=9423483247234;
$ echo $i | grep -q "^[0-9]$"
$ echo $?
0
$ echo $j | grep -q "^[0-9]\+$"
$ echo $?
0
</code></pre>
<p><span id="toc_1903_12123_5"></span></p>
<h4 id="范例字符组合小写字母大写字母两者的组合">范例：字符组合（小写字母、大写字母、两者的组合）</h4>
<pre><code>$ c="A"; d="fwefewjuew"; e="fewfEFWefwefe"
$ echo $c | grep -q "^[A-Z]$"
$ echo $d | grep -q "^[a-z]\+$"
$ echo $e | grep -q "^[a-zA-Z]\+$"
</code></pre>
<p><span id="toc_1903_12123_6"></span></p>
<h4 id="范例字母和数字的组合">范例：字母和数字的组合</h4>
<pre><code>$ ic="432fwfwefeFWEwefwef"
$ echo $ic | grep -q "^[0-9a-zA-Z]\+$"
</code></pre>
<p><span id="toc_1903_12123_7"></span></p>
<h4 id="范例空格或者-tab-键等">范例：空格或者 Tab 键等</h4>
<pre><code>$ echo " " | grep " "
$ echo -e "\t" | grep "[[:space:]]" #[[:space:]]会同时匹配空格和TAB键
$ echo -e " \t" | grep "[[:space:]]"
$ echo -e "\t" | grep "" #为在键盘上按下TAB键，而不是字符
</code></pre>
<p><span id="toc_1903_12123_8"></span></p>
<h4 id="范例匹配邮件地址">范例：匹配邮件地址</h4>
<pre><code>$ echo "test2007@lzu.cn" | grep "[0-9a-zA-Z\.]*@[0-9a-zA-Z\.]*"
test2007@lzu.cn
</code></pre>
<p><span id="toc_1903_12123_9"></span></p>
<h4 id="范例匹配-url-地址以-http-链接为例">范例：匹配 URL 地址(以 http 链接为例）</h4>
<pre><code>$ echo "http://news.lzu.edu.cn/article.jsp?newsid=10135" | grep "^http://[0-9a-zA-Z\./=?]\+$"
http://news.lzu.edu.cn/article.jsp?newsid=10135
</code></pre>
<p>说明：</p>
<ul>
<li><code>/dev/null</code> 和 <code>/dev/zero</code> 设备非常有趣，都犹如黑洞，什么东西掉进去都会消失殆尽；后者还是个能源箱，总能从那里取到0，直到退出</li>
<li><code>[[:space:]]</code> 是 <code>grep</code> 用于匹配空格或 TAB 键字符的标记，其他标记请查帮助：<code>man grep</code></li>
<li>上面都是用 <code>grep</code> 来进行模式匹配，实际上 <code>sed</code>，<code>awk</code> 都可用来做模式匹配，关于匹配中用到的正则表达式知识，请参考后面的相关资料</li>
<li>如果想判断字符串是否为空，可判断其长度是否为零，可通过 <code>test</code> 命令的 <code>-z</code> 选项来实现，具体用法见 <code>test</code> 命令，<code>man test</code></li>
</ul>
<p><span id="toc_1903_12123_10"></span></p>
<h4 id="范例判断字符是否为可打印字符">范例：判断字符是否为可打印字符</h4>
<pre><code>$ echo "\t\n" | grep "[[:print:]]"
\t\n
$ echo $?
0
$ echo -e "\t\n" | grep "[[:print:]]"
$ echo $?
1
</code></pre>
<p><span id="toc_1903_12123_11"></span></p>
<h3 id="字符串的长度">字符串的长度</h3>
<p>除了组成字符串的字符类型外，字符串还有哪些属性呢？组成字符串的字符个数。</p>
<p>下面我们来计算字符串的长度，即所有字符的个数，并简单介绍几种求字符串中指定字符个数的方法。</p>
<p><span id="toc_1903_12123_12"></span></p>
<h4 id="范例计算某个字符串的长度">范例：计算某个字符串的长度</h4>
<p>即计算所有字符的个数，计算方法五花八门，择其优着而用之：</p>
<pre><code>$ var="get the length of me"
$ echo ${var}     # 这里等同于$var
get the length of me
$ echo ${#var}
20
$ expr length "$var"
20
$ echo $var | awk '{printf("%d\n", length($0));}'
20
$ echo -n $var |  wc -c
20
</code></pre>
<p><span id="toc_1903_12123_13"></span></p>
<h4 id="范例计算某些指定字符或者字符组合的个数">范例：计算某些指定字符或者字符组合的个数</h4>
<pre><code>$ echo $var | tr -cd g | wc -c
2
$ echo -n $var | sed -e 's/[^g]//g' | wc -c
2
$ echo -n $var | sed -e 's/[^gt]//g' | wc -c
5
</code></pre>
<p><span id="toc_1903_12123_14"></span></p>
<h4 id="范例统计单词个数">范例：统计单词个数</h4>
<p>更多相关信息见<a href="01-chapter2.markdown">《数值计算》</a>的<em>单词统计</em> 相关范例。</p>
<pre><code>$ echo $var | wc -w
5
$ echo "$var" | tr " " "\n" | grep get | uniq -c
1
$ echo "$var" | tr " " "\n" | grep get | wc -l
1
</code></pre>
<p>说明：</p>
<p><code>${}</code> 操作符在 Bash 里头是一个“大牛”，能胜任相当多的工作，具体就看网中人的<a href="http://bbs.chinaunix.net/forum.php?mod=viewthread&amp;tid=218853&amp;page=7#pid1617953">《Shell十三问》之<code>$(())</code>与<code>$()</code> 还有<code>${}</code>差在哪？"</a>吧。</p>
<p><span id="toc_1903_12123_15"></span></p>
<h2 id="字符串的显示">字符串的显示</h2>
<p>接下来讨论如何控制字符在终端的显示。</p>
<p><span id="toc_1903_12123_16"></span></p>
<h3 id="范例在屏幕控制字符显示位置颜色背景等">范例：在屏幕控制字符显示位置、颜色、背景等</h3>
<pre><code>$ echo -e "\033[31;40m" #设置前景色为黑色，背景色为红色
$ echo -e '\033[11;29H Hello, World!' #在屏幕的第11行，29列开始打印字符串Hello,World!
</code></pre>
<p><span id="toc_1903_12123_17"></span></p>
<h3 id="范例在屏幕的某个位置动态显示当前系统时间">范例：在屏幕的某个位置动态显示当前系统时间</h3>
<pre><code>$ while :; do echo -e "\033[11;29H "$(date "+%Y-%m-%d %H:%M:%S"); done
</code></pre>
<p><span id="toc_1903_12123_18"></span></p>
<h3 id="范例过滤掉某些控制字符串">范例：过滤掉某些控制字符串</h3>
<p>用 <code>col</code> 命令过滤某些控制字符，在处理诸如 <code>script</code>，<code>screen</code> 等截屏命令的输出结果时，很有用。</p>
<pre><code>$ screen -L
$ cat /bin/cat
$ exit
$ cat screenlog.0 | col -b   # 把一些控制字符过滤后，就可以保留可读的操作日志
</code></pre>
<p><span id="toc_1903_12123_19"></span></p>
<h2 id="字符串的存储">字符串的存储</h2>
<p>在我们看来，字符串是一连串的字符而已，但是为了操作方便，我们往往可以让字符串呈现出一定的结构。在这里，我们不关心字符串在内存中的实际存储结构，仅仅关系它呈现出来的逻辑结构。比如，这样一个字符串： <code>"get the length of me"</code>，我们可以从不同的方面来呈现它。</p>
<ul>
<li>通过字符在串中的位置来呈现它</li>
</ul>
<p>这样我们就可以通过指定位置来找到某个子串。这在 C 语言中通常可以利用指针来做。而在 Shell 编程中，有很多可用的工具，诸如 <code>expr</code>，<code>awk</code> 都提供了类似方法来实现子串的查询动作。两者都几乎支持模式匹配 <code>match</code> 和完全匹配 <code>index</code>。这在后面的字符串操作中将详细介绍。</p>
<ul>
<li>根据某个分割符来取得字符串的各个部分</li>
</ul>
<p>这里最常见的就是行分割符、空格或者 <code>TAB</code> 分割符了，前者用来当行号，我们似乎已经司空见惯了，因为我们的编辑器就这样“莫名”地处理着行分割符（在 UNIX 下为 <code>\n</code>，在其他系统下有一些不同，比如 Windows 下为 <code>\r\n</code> ）。而空格或者 <code>TAB</code> 键经常用来分割数据库的各个字段，这似乎也是司空见惯的事情。</p>
<p>正因为这样，所以产生了大量优秀的行编辑工具，诸如 <code>grep</code>，<code>awk</code>，<code>sed</code> 等。在“行内”（姑且这么说吧，就是处理单行，即字符串中不再包含行分割符）的字符串分割方面，<code>cut</code> 和 <code>awk</code> 提供了非常优越的“行内”（处理单行）处理能力。</p>
<ul>
<li>更方便地处理用分割符分割好的各个部分</li>
</ul>
<p>同样是用到分割符，但为了更方便的操作分割以后的字符串的各个部分，我们抽象了“数组”这么一个数据结构，从而让我们更加方便地通过下标来获取某个指定的部分。 <code>bash</code> 提供了这么一种数据结构，而优秀的 <code>awk</code> 也同样提供了它，我们这里将简单介绍它们的用法。</p>
<p><span id="toc_1903_12123_20"></span></p>
<h3 id="范例把字符串拆分成字符串数组">范例：把字符串拆分成字符串数组</h3>
<ul>
<li> <p>Bash 提供的数组数据结构，以数字为下标的，和 C 语言从 0 开始的下标一样</p> <pre><code>$ var="get the length of me"
$ var_arr=($var)    #把字符串var存放到字符串数组var_arr中，默认以空格作为分割符
$ echo ${var_arr[0]} ${var_arr[1]} ${var_arr[2]} ${var_arr[3]} ${var_arr[4]}
get the length of me
$ echo ${var_arr[@]}    #整个字符串，可以用*代替@，下同
get the length of me
$ echo ${#var_arr[@]}   #类似于求字符串长度，`#`操作符也可用来求数组元素个数
5
</code></pre> <p>也可以直接给某个数组元素赋值</p> <pre><code>$ var_arr[5]="new_element"
$ echo ${#var_arr[@]}
6
$ echo ${var_arr[5]}
new_element
</code></pre> <p>Bash 实际上还提供了一种类似于“数组”的功能，即 <code>for i in</code>，它可以很方便地获取某个字符串的各个部分，例如：</p> <pre><code>$ for i in $var; do echo -n $i"_"; done
get_the_length_of_me_
</code></pre> </li>
<li> <p><code>awk</code> 里的数组，注意比较它和 <code>Bash</code> 里的数组的异同</p> <p><code>split</code> 把一行按照空格分割，存放到数组 <code>var_arr</code> 中，并返回数组长度。注意：这里第一个元素下标不是 0，而是 1</p> <pre><code>$ echo $var | awk '{printf("%d %s\n", split($0, var_arr, " "), var_arr[1]);}'
5 get
</code></pre> <p>实际上，上述操作很类似 <code>awk</code> 自身的行处理功能： <code>awk</code> 默认把一行按照空格分割为多个域，并可以通过 <code>$1</code>，<code>$2</code>，<code>$3</code> <code>...</code> 来获取，<code>$0</code> 表示整行。</p> <p>这里的 <code>NF</code> 是该行的域的总数，类似于上面数组的长度，它同样提供了一种通过类似“下标”访问某个字符串的功能。</p> <pre><code>$ echo $var | awk '{printf("%d | %s %s %s %s %s | %s\n", NF, $1, $2, $3, $4, $5, $0);}'
5 | get the length of me | get the length of me
</code></pre> <p><code>awk</code> 的“数组”功能何止于此呢，看看它的 <code>for</code> 引用吧，注意，这个和 <code>Bash</code> 里头的 <code>for</code> 不太一样，<code>i</code> 不是元素本身，而是下标：</p> <pre><code>$ echo $var | awk '{split($0, var_arr, " "); for(i in var_arr) printf("%s ",var_arr[i]);}'
of me get the length
4 5 1 2 3
</code></pre> <p>另外，从上述结果可以看到，经过 <code>for</code> 处理后，整个结果没有按照原理的字符顺序排列，不过如果仅仅是迭代出所有元素这个同样很有意义。</p> </li>
</ul>
<p><code>awk</code> 还有更“厉害”的处理能力，它的下标可以不是数字，可以是字符串，从而变成了“关联”数组，这种“关联”在某些方面非常方便。 比如，把某个文件中的某个系统调用名根据另外一个文件中的函数地址映射表替换成地址，可以这么实现：</p>
<pre><code>$ cat symbol
sys_exit
sys_read
sys_close
$ ls /boot/System.map*
/boot/System.map-2.6.20-16-generic
$ awk '{if(FILENAME ~ "System.map") map[$3]=$1; else {printf("%s\n", map[$1])}}' \
    /boot/System.map-2.6.20-16-generic symbol
c0129a80
c0177310
c0175d80
</code></pre>
<p>另外，awk还支持用delete函数删除某个数组元素。如果某些场合有需要的话，别忘了awk还支持二维数组。</p>
<p><span id="toc_1903_12123_21"></span></p>
<h2 id="字符串常规操作">字符串常规操作</h2>
<p>字符串操作包括取子串、查询子串、插入子串、删除子串、子串替换、子串比较、子串排序、子串进制转换、子串编码转换等。</p>
<p><span id="toc_1903_12123_22"></span></p>
<h3 id="取子串">取子串</h3>
<p>取子串的方法主要有：</p>
<ul>
<li>直接到指定位置求子串</li>
<li>字符匹配求子串</li>
</ul>
<p><span id="toc_1903_12123_23"></span></p>
<h4 id="范例按照位置取子串">范例：按照位置取子串</h4>
<p>比如从什么位置开始，取多少个字符</p>
<pre><code>$ var="get the length of me"
$ echo ${var:0:3}
get
$ echo ${var:(-2)}   # 方向相反呢
me

$ echo `expr substr "$var" 5 3` #记得把$var引起来，否则expr会因为空格而解析错误
the

$ echo $var | awk '{printf("%s\n", substr($0, 9, 6))}'
length
</code></pre>
<p><code>awk</code> 把 <code>$var</code> 按照空格分开为多个变量，依次为 <code>$1</code>，<code>$2</code>，<code>$3</code>，<code>$4</code>，<code>$5</code></p>
<pre><code>$ echo $var | awk '{printf("%s\n", $1);}'
get
$ echo $var | awk '{printf("%s\n", $5);}'
me
</code></pre>
<p>差点略掉<code>cut</code>小工具，它用起来和awk类似，<code>-d</code>指定分割符，如同<code>awk</code>用<code>-F</code>指定分割符一样；<code>-f</code>指定“域”，如同awk的<code>$数字</code>。</p>
<pre><code>$ echo $var | cut -d" " -f 5
</code></pre>
<p><span id="toc_1903_12123_24"></span></p>
<h4 id="范例匹配字符求子串">范例：匹配字符求子串</h4>
<p>用 Bash 内置支持求子串：</p>
<pre><code>$ echo ${var%% *} #从右边开始计算，删除最左边的空格右边的所有字符
get
$ echo ${var% *} #从右边开始计算，删除第一个空格右边的所有字符
get the length of
$ echo ${var##* }  #从左边开始计算，删除最右边的空格左边的所有字符
me
$ echo ${var#* }  #从左边开始计算，删除第一个空格左边的所有字符
the length of me
</code></pre>
<p>删除所有 <code>空格＋字母组合</code> 的字符串：</p>
<pre><code>$ echo $var | sed 's/ [a-z]*//g'
get
$ echo $var | sed 's/[a-z]* //g'
me
</code></pre>
<p><code>sed</code> 有按地址（行）打印(p)的功能，记得先用 <code>tr</code> 把空格换成行号：</p>
<pre><code>$ echo $var | tr " " "\n" | sed -n 1p
get
$ echo $var | tr " " "\n" | sed -n 5p
me
</code></pre>
<p><code>tr</code> 也可以用来取子串，它可以类似<code>#</code>和 <code>%</code> 来“拿掉”一些字符串来实现取子串：</p>
<pre><code>$ echo $var | tr -d " "
getthelengthofme
$ echo $var | tr -cd "[a-z]" #把所有的空格都拿掉了，仅仅保留字母字符串，注意-c和-d的用法
getthelengthofme
</code></pre>
<p>说明：</p>
<ul>
<li><code>%</code> 和<code>#</code>删除字符的方向不一样，前者在右，后者在左，<code>%%</code> 和 <code>%</code>， <code>##</code> 和 <code>#</code> 的方向是前者是最大匹配，后者是最小匹配。（好的记忆方法见网中人的键盘记忆法：<code>#</code>，<code>$</code>，<code>%</code> 是键盘依次从左到右的三个键）</li>
<li><code>tr</code> 的 <code>-c</code> 选项是 <code>complement</code> 的缩写，即 <code>invert</code>，而 <code>-d</code> 选项是删除，<code>tr -cd "[a-z]"</code> 这样一来就变成保留所有的字母</li>
</ul>
<p>对于字符串的截取，实际上还有一些命令，如果 <code>head</code>，<code>tail</code> 等可以实现有意思的功能，可以截取某个字符串的前面、后面指定的行数或者字节数。例如：</p>
<pre><code>$ echo "abcdefghijk" | head -c 4
abcd
$ echo -n "abcdefghijk" | tail -c 4
hijk
</code></pre>
<p><span id="toc_1903_12123_25"></span></p>
<h3 id="查询子串">查询子串</h3>
<p>子串查询包括：</p>
<ul>
<li>返回符合某个模式的子串本身</li>
<li>返回子串在目标串中的位置</li>
</ul>
<p>准备：在进行下面的操作之前，请准备一个文件 test.txt，里头有内容 "consists of"，用于下面的范例。</p>
<p><span id="toc_1903_12123_26"></span></p>
<h4 id="范例查询子串在目标串中的位置">范例：查询子串在目标串中的位置</h4>
<p><code>expr index</code>貌似仅仅可以返回某个字符或者多个字符中第一个字符出现的位置</p>
<pre><code>$ var="get the length of me"
$ expr index "$var" t
3
</code></pre>
<p>awk却能找出字串，match还可以匹配正则表达式</p>
<pre><code>$ echo $var | awk '{printf("%d\n", match($0,"the"));}'
5
</code></pre>
<p><span id="toc_1903_12123_27"></span></p>
<h4 id="范例查询子串返回包含子串的行">范例：查询子串，返回包含子串的行</h4>
<p><code>awk</code>，<code>sed</code> 都可以实现这些功能，但是 <code>grep</code> 最擅长</p>
<pre><code>$ grep "consists of" test.txt   # 查询文件包含consists of的行，并打印这些行
$ grep "consists[[:space:]]of" -n -H test.txt # 打印文件名，子串所在行的行号和该行的内容
$ grep "consists[[:space:]]of" -n -o test.txt # 仅仅打印行号和匹配到的子串本身的内容

$ awk '/consists of/{ printf("%s:%d:%s\n",FILENAME, FNR, $0)}' text  #看到没？和grep的结果一样
$ sed -n -e '/consists of/=;/consists of/p' text #同样可以打印行号
</code></pre>
<p>说明：</p>
<ul>
<li><code>awk</code>，<code>grep</code>，<code>sed</code> 都能通过模式匹配查找指定字符串，但它们各有所长，将在后续章节中继续使用和比较它们，进而发现各自优点</li>
<li>在这里姑且把文件内容当成了一个大的字符串，在后面章节中将专门介绍文件操作，所以对文件内容中存放字符串的操作将会有更深入的分析和介绍</li>
</ul>
<p><span id="toc_1903_12123_28"></span></p>
<h3 id="子串替换">子串替换</h3>
<p>子串替换就是把某个指定的子串替换成其他的字符串，这里蕴含了“插入子串”和“删除子串”的操作。例如，想插入某个字符串到某个子串之前，就可以把原来的子串替换成”子串+新的字符串“，如果想删除某个子串，就把子串替换成空串。不过有些工具提供了一些专门的用法来做插入子串和删除子串的操作，所以呆伙还会专门介绍。另外，要想替换掉某个子串，一般都是先找到子串（查询子串），然后再把它替换掉，实质上很多工具在使用和设计上都体现了这么一点。</p>
<p><span id="toc_1903_12123_29"></span></p>
<h4 id="范例把变量-var-中的空格替换成下划线">范例：把变量 var 中的空格替换成下划线</h4>
<p>用 <code>{}</code> 运算符，还记得么？网中人的教程</p>
<pre><code>$ var="get the length of me"
$ echo ${var/ /_}        #把第一个空格替换成下划线
get_the length of me
$ echo ${var// /_}       #把所有空格都替换成下划线
get_the_length_of_me
</code></pre>
<p>用 <code>awk</code>，<code>awk</code> 提供了转换的最小替换函数 <code>sub</code> 和全局替换函数 <code>gsub</code>，类似 <code>/</code> 和 <code>//</code></p>
<pre><code>$ echo $var | awk '{sub(" ", "_", $0); printf("%s\n", $0);}'
get_the length of me
$ echo $var | awk '{gsub(" ", "_", $0); printf("%s\n", $0);}'
get_the_length_of_me
</code></pre>
<p>用 <code>sed</code>，子串替换可是 <code>sed</code> 的特长：</p>
<pre><code>$ echo $var | sed -e 's/ /_/'    #s &lt;= substitude
get_the length of me
$ echo $var | sed -e 's/ /_/g'   #看到没有，简短两个命令就实现了最小匹配和最大匹配g &lt;= global
get_the_length_of_me
</code></pre>
<p>有忘记 <code>tr</code> 命令么？可以用替换单个字符的：</p>
<pre><code>$ echo $var | tr " " "_"
get_the_length_of_me
$ echo $var | tr '[a-z]' '[A-Z]'   #这个可有意思了，把所有小写字母都替换为大写字母
GET THE LENGTH OF ME
</code></pre>
<p>说明： <code>sed</code> 还有很有趣的标签用法呢，下面再介绍吧。</p>
<p>有一种比较有意思的字符串替换是：整个文件行的倒置，这个可以通过 <code>tac</code> 命令实现，它会把文件中所有的行全部倒转过来。在某种意义上来说，排序实际上也是一个字符串替换。</p>
<p><span id="toc_1903_12123_30"></span></p>
<h3 id="插入子串">插入子串</h3>
<p>在指定位置插入子串，这个位置可能是某个子串的位置，也可能是从某个文件开头算起的某个长度。通过上面的练习，我们发现这两者之间实际上是类似的。</p>
<p>公式：插入子串=把"old子串"替换成"old子串+new子串"或者"new子串+old子串"</p>
<p><span id="toc_1903_12123_31"></span></p>
<h4 id="范例在-var-字符串的空格之前或之后插入一个下划线">范例：在 var 字符串的空格之前或之后插入一个下划线</h4>
<p>用{}：</p>
<pre><code>$ var="get the length of me"
$ echo ${var/ /_ }        #在指定字符串之前插入一个字符串
get_ the length of me
$ echo ${var// /_ }
get_ the_ length_ of_ me
$ echo ${var/ / _}        #在指定字符串之后插入一个字符串
get _the length of me
$ echo ${var// / _}
get _the _length _of _me
</code></pre>
<p>其他的还用演示么？这里主要介绍sed怎么用来插入字符吧，因为它的标签功能很有趣 说明：<code>(</code> 和 <code>)</code> 将匹配到的字符串存放为一个标签，按匹配顺序为<code>\1</code>,<code>\2</code>...</p>
<pre><code>$ echo $var | sed -e 's/\( \)/_\1/'
get_ the length of me
$ echo $var | sed -e 's/\( \)/_\1/g'
get_ the_ length_ of_ me
$ echo $var | sed -e 's/\( \)/\1_/'
get _the length of me
$ echo $var | sed -e 's/\( \)/\1_/g'
get _the _length _of _me
</code></pre>
<p>看看 <code>sed</code> 的标签的顺序是不是 <code>\1</code>,<code>\2</code>...，看到没？<code>\2</code> 和 <code>\1</code> 调换位置后，<code>the</code> 和 <code>get</code> 的位置掉换了：</p>
<pre><code>$ echo $var | sed -e 's/\([a-z]*\) \([a-z]*\) /\2 \1 /g'
the get of length me
</code></pre>
<p><code>sed</code> 还有专门的插入指令，<code>a</code> 和 <code>i</code>，分别表示在匹配的行后和行前插入指定字符</p>
<pre><code>$ echo $var | sed '/get/a test'
get the length of me
test
$ echo $var | sed '/get/i test'
test
get the length of me
</code></pre>
<p><span id="toc_1903_12123_32"></span></p>
<h3 id="删除子串">删除子串</h3>
<p>删除子串：应该很简单了吧，把子串替换成“空”（什么都没有）不就变成了删除么。还是来简单复习一下替换吧。</p>
<p><span id="toc_1903_12123_33"></span></p>
<h4 id="范例把-var-字符串中所有的空格给删除掉">范例：把 var 字符串中所有的空格给删除掉。</h4>
<p>鼓励：这样一替换不知道变成什么单词啦，谁认得呢？但是中文却是连在一起的，所以中文有多难，你想到了么？原来你也是个语言天才，而英语并不可怕，你有学会它的天赋，只要有这个打算。</p>
<p>再用 <code>{}</code></p>
<pre><code>$ echo ${var// /}
getthelengthofme
</code></pre>
<p>再用 <code>awk</code></p>
<pre><code>$ echo $var | awk '{gsub(" ","",$0); printf("%s\n", $0);}'
</code></pre>
<p>再用 <code>sed</code></p>
<pre><code>$ echo $var | sed 's/ //g'
getthelengthofme
</code></pre>
<p>还有更简单的 <code>tr</code> 命令，<code>tr</code> 也可以把空格给删除掉，看</p>
<pre><code>$ echo $var | tr -d " "
getthelengthofme
</code></pre>
<p>如果要删除第一个空格后面所有的字符串该怎么办呢？还记得 <code>{}</code> 的 <code>#</code> 和 <code>%</code> 用法么？如果不记得，回到这节的开头开始复习吧。（实际上删除子串和取子串未尝不是两种互补的运算呢，删除掉某些不想要的子串，也就同时取得另外那些想要的子串——这个世界就是一个“二元”的世界，非常有趣）</p>
<p><span id="toc_1903_12123_34"></span></p>
<h3 id="子串比较">子串比较</h3>
<p>这个很简单：还记得 <code>test</code> 命令的用法么？ <code>man test</code> 。它可以用来判断两个字符串是否相等。另外，有发现“字符串是否相等”和“字符串能否跟另外一个字符串匹配 <code>"</code> 两个问题之间的关系吗？如果两个字符串完全匹配，那么这两个字符串就相等了。所以呢，上面用到的字符串匹配方法，也同样可以用到这里。</p>
<p><span id="toc_1903_12123_35"></span></p>
<h3 id="子串排序">子串排序</h3>
<p>差点忘记这个重要内容了，子串排序可是经常用到，常见的有按字母序、数字序等正序或反序排列。 <code>sort</code> 命令可以用来做这个工作，它和其他行处理命令一样，是按行操作的，另外，它类似 <code>cut</code> 和 <code>awk</code>，可以指定分割符，并指定需要排序的列。</p>
<pre><code>$ var="get the length of me"
$ echo $var | tr ' ' '\n' | sort   #正序排
get
length
me
of
the
$ echo $var | tr ' ' '\n' | sort -r #反序排
the
of
me
length
get
$ cat &gt; data.txt
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
41 45 44 44 26 44 42 20 20 38 37 25 45 45 45
16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
44 20 30 39 35 38 38 28 25 30 36 20 24 32 33
31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
41 33 51 39 20 20 44 37 38 39 42 40 37 50 50
46 47 48 49 50 51 52 53 54 55 56
42 43 41 42 45 42 19 39 75 17 17
$ cat data.txt | sort -k 2 -n
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
44 20 30 39 35 38 38 28 25 30 36 20 24 32 33
31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
41 33 51 39 20 20 44 37 38 39 42 40 37 50 50
42 43 41 42 45 42 19 39 75 17 17
41 45 44 44 26 44 42 20 20 38 37 25 45 45 45
46 47 48 49 50 51 52 53 54 55 56
</code></pre>
<p><span id="toc_1903_12123_36"></span></p>
<h3 id="子串进制转换">子串进制转换</h3>
<p>如果字母和数字字符用来计数，那么就存在进制转换的问题。在<a href="01-chapter2.markdown">《数值计算》</a>一节，已经介绍了 <code>bc</code> 命令，这里再复习一下。</p>
<pre><code>$ echo "ibase=10;obase=16;10" | bc
A
</code></pre>
<p>说明： <code>ibase</code> 指定输入进制，<code>obase</code> 指出输出进制，这样通过调整 <code>ibase</code> 和 <code>obase</code>，你想怎么转就怎么转啦！</p>
<p><span id="toc_1903_12123_37"></span></p>
<h3 id="子串编码转换">子串编码转换</h3>
<p>什么是字符编码？这个就不用介绍了吧，看过那些乱七八糟显示的网页么？大多是因为浏览器显示时的”编码“和网页实际采用的”编码“不一致导致的。字符编码通常是指：把一序列”可打印“字符转换成二进制表示，而字符解码呢则是执行相反的过程，如果这两个过程不匹配，则出现了所谓的”乱码“。</p>
<p>为了解决”乱码“问题呢？就需要进行编码转换。在 Linux 下，我们可以使用 <code>iconv</code> 这个工具来进行相关操作。这样的情况经常在不同的操作系统之间移动文件，不同的编辑器之间交换文件的时候遇到，目前在 Windows 下常用的汉字编码是 <code>gb2312</code>，而在 Linux 下则大多采用 <code>utf8</code> 。</p>
<pre><code>$ nihao_utf8=$(echo "你好")
$ nihao_gb2312=$(echo $nihao_utf8 | iconv -f utf8 -t gb2312)
</code></pre>
<p><span id="toc_1903_12123_38"></span></p>
<h2 id="字符串操作进阶">字符串操作进阶</h2>
<p>实际上，在用 Bash 编程时，大部分时间都是在处理字符串，因此把这一节熟练掌握非常重要。</p>
<p><span id="toc_1903_12123_39"></span></p>
<h3 id="正则表达式">正则表达式</h3>
<p><span id="toc_1903_12123_40"></span></p>
<h4 id="范例处理-url-地址">范例：处理 URL 地址</h4>
<p>URL 地址(URL（Uniform Resoure Locator：统一资源定位器）是WWW页的地址)几乎是我们日常生活的玩伴，我们已经到了无法离开它的地步啦，对它的操作很多，包括判断 URL 地址的有效性，截取地址的各个部分（服务器类型、服务器地址、端口、路径等）并对各个部分进行进一步的操作。</p>
<p>下面我们来具体处理这个URL地址：ftp://anonymous:ftp@mirror.lzu.edu.cn/software/scim-1.4.7.tar.gz</p>
<pre><code>$ url="ftp://anonymous:ftp@mirror.lzu.edu.cn/software/scim-1.4.7.tar.gz"
</code></pre>
<p>匹配URL地址，判断URL地址的有效性</p>
<pre><code>$ echo $url | grep "ftp://[a-z]*:[a-z]*@[a-z\./-]*"
</code></pre>
<p>截取服务器类型</p>
<pre><code>$ echo ${url%%:*}
ftp
$ echo $url | cut -d":" -f 1
ftp
</code></pre>
<p>截取域名</p>
<pre><code>$ tmp=${url##*@} ; echo ${tmp%%/*}
mirror.lzu.edu.cn
</code></pre>
<p>截取路径</p>
<pre><code>$ tmp=${url##*@} ; echo ${tmp%/*}
mirror.lzu.edu.cn/software
</code></pre>
<p>截取文件名</p>
<pre><code>$ basename $url
scim-1.4.7.tar.gz
$ echo ${url##*/}
scim-1.4.7.tar.gz
</code></pre>
<p>截取文件类型（扩展名）</p>
<pre><code>$ echo $url | sed -e 's/.*[0-9].\(.*\)/\1/g'
tar.gz
</code></pre>
<p><span id="toc_1903_12123_41"></span></p>
<h4 id="范例匹配某个文件中的特定范围的行">范例：匹配某个文件中的特定范围的行</h4>
<p>先准备一个测试文件README</p>
<pre><code>Chapter 7 -- Exercises

7.1 please execute the program: mainwithoutreturn, and print the return value
of it with the command "echo $?", and then compare the return of the printf
function, they are the same.

7.2 it will depend on the exection mode, interactive or redirection to a file,
if interactive, the "output" action will accur after the \n char with the line
buffer mode, else, it will be really "printed" after all of the strings have
been stayed in the buffer.

7.3 there is no another effective method in most OS. because argc and argv are
not global variables like environ.
</code></pre>
<p>然后开始实验，</p>
<p>打印出答案前指定行范围：第 7 行到第 9 行，刚好找出了第 2 题的答案</p>
<pre><code>$ sed -n 7,9p README
7.2 it will depend on the exection mode, interactive or redirection to a file,
if interactive, the "output" action will accur after the \n char with the line
buffer mode, else, it will be really "printed" after all of the strings have
</code></pre>
<p>其实，因为这个文件内容格式很有特色，有更简单的办法</p>
<pre><code>$ awk '/7.2/,/^$/ {printf("%s\n", $0);}' README
7.2 it will depend on the exection mode, interactive or redirection to a file,
if interactive, the "output" action will accur after the \n char with the line
buffer mode, else, it will be really "printed" after all of the strings have
been stayed in the buffer.
</code></pre>
<p>有了上面的知识，就可以非常容易地进行这些工作啦：修改某个文件的文件名，比如调整它的编码，下载某个网页里头的所有 <code>pdf</code> 文档等。这些就作为练习自己做吧。</p>
<p><span id="toc_1903_12123_42"></span></p>
<h3 id="处理格式化的文本">处理格式化的文本</h3>
<p>平时做工作，大多数时候处理的都是一些“格式化”的文本，比如类似 <code>/etc/passwd</code> 这样的有固定行和列的文本，也有类似 <code>tree</code> 命令输出的那种具有树形结构的文本，当然还有其他具有特定结构的文本。</p>
<p>关于树状结构的文本的处理，可以参考我早期写的另外一篇博客文章：<a href="http://www.tinylab.org/callgraph-draw-the-calltree-of-c-functions/">源码分析：静态分析 C 程序函数调用关系图</a></p>
<p>实际上，只要把握好特性结构的一些特点，并根据具体的应用场合，处理起来就不会困难。</p>
<p>下面来介绍具体文本的操作，以 <code>/etc/passwd</code> 文件为例。关于这个文件的帮忙和用法，请通过 <code>man 5 passwd</code> 查看。下面对这个文件以及相关的文件进行一些有意义的操作。</p>
<p><span id="toc_1903_12123_43"></span></p>
<h4 id="范例选取指定列">范例：选取指定列</h4>
<p>选取/etc/passwd文件中的用户名和组ID两列</p>
<pre><code>$ cat /etc/passwd | cut -d":" -f1,4
</code></pre>
<p>选取/etc/group文件中的组名和组ID两列</p>
<pre><code>$ cat /etc/group | cut -d":" -f1,3
</code></pre>
<p><span id="toc_1903_12123_44"></span></p>
<h4 id="范例文件关联操作">范例：文件关联操作</h4>
<p>如果想找出所有用户所在的组，怎么办？</p>
<pre><code>$ join -o 1.1,2.1 -t":" -1 4 -2 3 /etc/passwd /etc/group
root:root
bin:bin
daemon:daemon
adm:adm
lp:lp
pop:pop
nobody:nogroup
falcon:users
</code></pre>
<p>说明： <code>join</code> 命令用来连接两个文件，有点类似于数据库的两个表的连接。 <code>-t</code> 指定分割符，<code>-1 4 -2 3</code> 指定按照第一个文件的第 4 列和第二个文件的第 3 列，即组 <code>ID</code> 进行连接，<code>-o</code> <code>1.1,2.1</code> 表示仅仅输出第一个文件的第一列和第二个文件的第一列，这样就得到了我们要的结果，不过，可惜的是，这个结果并不准确，再进行下面的操作，你就会发现：</p>
<pre><code>$ cat /etc/passwd | sort -t":" -n -k 4 &gt; /tmp/passwd
$ cat /etc/group | sort -t":" -n -k 3 &gt; /tmp/group
$ join -o 1.1,2.1 -t":" -1 4 -2 3 /tmp/passwd /tmp/group
halt:root
operator:root
root:root
shutdown:root
sync:root
bin:bin
daemon:daemon
adm:adm
lp:lp
pop:pop
nobody:nogroup
falcon:users
games:users
</code></pre>
<p>可以看到这个结果才是正确的，所以以后使用 <code>join</code> 千万要注意这个问题，否则采取更保守的做法似乎更能保证正确性，更多关于文件连接的讨论见参考后续资料。</p>
<p>上面涉及到了处理某格式化行中的指定列，包括截取（如 <code>SQL</code> 的 <code>select</code> 用法），连接（如 <code>SQL</code> 的 <code>join</code> 用法），排序（如 <code>SQL</code> 的 <code>order by</code> 用法），都可以通过指定分割符来拆分某个格式化的行，另外，“截取”的做法还有很多，不光是 <code>cut</code>，<code>awk</code>，甚至通过 <code>IFS</code> 指定分割符的 <code>read</code> 命令也可以做到，例如：</p>
<pre><code>$ IFS=":"; cat /etc/group | while read C1 C2 C3 C4; do echo $C1 $C3; done
</code></pre>
<p>因此，熟悉这些用法，我们的工作将变得非常灵活有趣。</p>
<p>到这里，需要做一个简单的练习，如何把按照列对应的用户名和用户 ID 转换成按照行对应的，即把类似下面的数据：</p>
<pre><code>$ cat /etc/passwd | cut -d":" -f1,3 --output-delimiter=" "
root 0
bin 1
daemon 2
</code></pre>
<p>转换成：</p>
<pre><code>$ cat a
root    bin     daemon
0       1       2
</code></pre>
<p>并转换回去，有什么办法呢？记得诸如 <code>tr</code>，<code>paste</code>，<code>split</code> 等命令都可以使用。</p>
<p>参考方法：</p>
<ul>
<li>正转换：先截取用户名一列存入文件 <code>user</code>，再截取用户 <code>ID</code> 存入 <code>id</code>，再把两个文件用 <code>paste -s</code> 命令连在一起，这样就完成了正转换</li>
<li>逆转换：先把正转换得到的结果用 <code>split -1</code> 拆分成两个文件，再把两个拆分后的文件用 <code>tr</code> 把分割符 <code>\t</code> 替换成 <code>\n</code>，只有用 <code>paste</code> 命令把两个文件连在一起，这样就完成了逆转换。</li>
</ul>
<p><span id="toc_1903_12123_45"></span></p>
<h2 id="参考资料">参考资料</h2>
<ul>
<li>《高级 Bash 脚本编程指南》之操作字符串，之指定变量的类型</li>
<li><a href="http://bbs.chinaunix.net/forum.php?mod=viewthread&amp;tid=218853&amp;page=7#pid1617953">《Shell十三问》之<code>$(())</code>与<code>$()</code>还有<code>${}</code>差在哪？</a></li>
<li><a href="http://www.zytrax.com/tech/web/regex.htm">Regular Expressions - User guide</a></li>
<li>Regular Expression Tutorial</li>
<li><a href="http://www.panix.com/~elflord/unix/grep.html">Grep Tutorial</a></li>
<li><a href="http://www.panix.com/~elflord/unix/sed.html">Sed Tutorial</a></li>
<li>awk Tutorial</li>
<li>sed Tutorial</li>
<li><a href="http://www.vectorsite.net/tsawk.html">An awk Primer</a></li>
<li><a href="http://www.linuxsir.org/bbs/showthread.php?t=24264">一些奇怪的 UNIX 指令名字的由来</a></li>
<li><a href="http://www.ibm.com/developerworks/cn/aix/library/au-expressions.html">磨练构建正则表达式模式的技能</a></li>
<li><a href="http://blog.chinaunix.net/u/9465/showart_144700.html">基础11：文件分类、合并和分割(sort,uniq,join,cut,paste,split)</a></li>
<li><a href="http://linux.chinaunix.net/docs/2006-09-22/2803.shtml">使用 Linux 文本工具简化数据的提取</a></li>
<li><a href="http://sed.sourceforge.net/sed1line_zh-CN.html">SED 单行脚本快速参考（Unix流编辑器）</a></li>
</ul>
<p><span id="toc_1903_12123_46"></span></p>
<h2 id="后记">后记</h2>
<ul>
<li>这一节本来是上个礼拜该弄好的，但是这些天太忙了，到现在才写好一个“初稿”，等到有时间再补充具体的范例。这一节的范例应该是最最有趣的，所有得好好研究一下几个有趣的范例。</li>
<li>写完上面的部分貌似是 1 点多，刚 <code>check</code> 了一下错别字和语法什么的，再添加了一节，即“字符串的存储结构”，到现在已经快 <code>half past 2</code> 啦，晚安，朋友们。</li>
<li>26 号，添加“子串进制转换”和“子串编码转换”两小节以及一个处理 <code>URL</code> 地址的范例。</li>
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
<a href="/book/27/index.html">
<img class="uk-book-cover" src="/static/icons/48/tensorflow_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/27/index.html">Sklearn 与 TensorFlow 机器学习实用指南</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/18.html">ApacheCN</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="tensorflow">tensorflow</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">20页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 916个">916</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/19/index.html">
<img class="uk-book-cover" src="/static/icons/48/go_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/19/index.html">Go命令教程</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/14.html">hyper0x</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="go">go</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">15页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 1478个">1478</span>
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
<script type="text/javascript">var bookId =44;var bookPageId =2886;var bookPageRelUrl ='zh/chapters/01-chapter4.markdown';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>