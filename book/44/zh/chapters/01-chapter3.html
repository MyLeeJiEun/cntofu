
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>布尔运算-Shell 编程范例</title>
<meta content='布尔运算,Shell 编程范例' name='keywords'>
<meta content='布尔运算,Shell 编程范例' name='description'>
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
<a href="/book/44/zh/chapters/01-chapter2.markdown">
<i class="nav-icon-left uk-icon-small  uk-icon-caret-left"></i>
<span class="">数值运算</span>
</a>
</div>
<div class="uk-align-right ">
<a href="/book/44/zh/chapters/01-chapter4.markdown">
<span class="">字符串操作</span>
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
<h1 id="布尔运算">布尔运算</h1>
<ul>
<li><a href="#toc_17877_9500_1">前言</a></li>
<li><a href="#toc_17877_9500_2">常规的布尔运算</a></li>
<li><a href="#toc_17877_9500_3">在 Shell 下如何进行逻辑运算</a></li>
<li><a href="#toc_17877_9500_4">范例：true or false</a></li>
<li><a href="#toc_17877_9500_5">范例：与运算</a></li>
<li><a href="#toc_17877_9500_6">范例：或运算</a></li>
<li><a href="#toc_17877_9500_7">范例：非运算，即取反</a></li>
<li><a href="#toc_17877_9500_8">Bash 里头的 true 和 false 是我们通常认为的 1 和 0 么？</a></li>
<li><a href="#toc_17877_9500_9">范例：返回值 v.s. 逻辑值</a></li>
<li><a href="#toc_17877_9500_10">范例：查看 true 和 false 帮助和类型</a></li>
<li><a href="#toc_17877_9500_11">条件测试</a></li>
<li><a href="#toc_17877_9500_12">条件测试基本使用</a></li>
<li><a href="#toc_17877_9500_13">范例：数值测试</a></li>
<li><a href="#toc_17877_9500_14">范例：字符串测试</a></li>
<li><a href="#toc_17877_9500_15">范例：文件测试</a></li>
<li><a href="#toc_17877_9500_16">各种逻辑测试的组合</a></li>
<li><a href="#toc_17877_9500_17">范例：如果 a，b，c 都等于下面对应的值，那么打印 YES，通过 -a 进行与测试</a></li>
<li><a href="#toc_17877_9500_18">范例：测试某个“东西”是文件或者目录，通过 -o 进行“或”运算</a></li>
<li><a href="#toc_17877_9500_19">范例：测试某个“东西”是否为文件，测试 <code>!</code> 非运算</a></li>
<li><a href="#toc_17877_9500_20">比较 -a 与 &amp;&amp;, -o 与 ||， ! test 与 test !</a></li>
<li><a href="#toc_17877_9500_21">范例：要求某文件可执行且有内容，用 -a 和 &amp;&amp; 分别实现</a></li>
<li><a href="#toc_17877_9500_22">范例：要求某个字符串要么为空，要么和某个字符串相等</a></li>
<li><a href="#toc_17877_9500_23">范例：测试某个数字不满足指定的所有条件</a></li>
<li><a href="#toc_17877_9500_24">命令列表</a></li>
<li><a href="#toc_17877_9500_25">命令列表的执行规律</a></li>
<li><a href="#toc_17877_9500_26">范例：如果 ping 通 www.lzu.edu.cn，那么打印连通信息</a></li>
<li><a href="#toc_17877_9500_27">命令列表的作用</a></li>
<li><a href="#toc_17877_9500_28">范例：在脚本里判断程序的参数个数，和参数类型</a></li>
<li><a href="#toc_17877_9500_29">小结</a></li>
</ul>
<p><span id="toc_17877_9500_1"></span></p>
<h2 id="前言">前言</h2>
<p>上个礼拜介绍了<a href="01-chapter2.markdown">Shell编程范例之数值运算</a>，对 Shell 下基本数值运算方法做了简单的介绍，这周将一起探讨布尔运算，即如何操作“真假值”。</p>
<p>在 Bash 里有这样的常量(实际上是两个内置命令，在这里我们姑且这么认为，后面将介绍)，即 true 和 false，一个表示真，一个表示假。对它们可以进行与、或、非运算等常规的逻辑运算，在这一节，我们除了讨论这些基本逻辑运算外，还将讨论Shell编程中的<strong>条件测试</strong>和<strong>命令列表</strong>，并介绍它们和布尔运算的关系。</p>
<p><span id="toc_17877_9500_2"></span></p>
<h2 id="常规的布尔运算">常规的布尔运算</h2>
<p>这里主要介绍 <code>Bash</code> 里头常规的逻辑运算，与、或、非。</p>
<p><span id="toc_17877_9500_3"></span></p>
<h3 id="在-shell-下如何进行逻辑运算">在 Shell 下如何进行逻辑运算</h3>
<p><span id="toc_17877_9500_4"></span></p>
<h4 id="范例true-or-false">范例：true or false</h4>
<p>单独测试 <code>true</code> 和 <code>false</code>，可以看出 <code>true</code> 是真值，<code>false</code> 为假</p>
<pre><code>$ if true;then echo "YES"; else echo "NO"; fi
YES
$ if false;then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p><span id="toc_17877_9500_5"></span></p>
<h4 id="范例与运算">范例：与运算</h4>
<pre><code>$ if true &amp;&amp; true;then echo "YES"; else echo "NO"; fi
YES
$ if true &amp;&amp; false;then echo "YES"; else echo "NO"; fi
NO
$ if false &amp;&amp; false;then echo "YES"; else echo "NO"; fi
NO
$ if false &amp;&amp; true;then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p><span id="toc_17877_9500_6"></span></p>
<h4 id="范例或运算">范例：或运算</h4>
<pre><code>$ if true || true;then echo "YES"; else echo "NO"; fi
YES
$ if true || false;then echo "YES"; else echo "NO"; fi
YES
$ if false || true;then echo "YES"; else echo "NO"; fi
YES
$ if false || false;then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p><span id="toc_17877_9500_7"></span></p>
<h4 id="范例非运算即取反">范例：非运算，即取反</h4>
<pre><code>$ if ! false;then echo "YES"; else echo "NO"; fi
YES
$ if ! true;then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p>可以看出 <code>true</code> 和 <code>false</code> 按照我们对逻辑运算的理解进行着，但是为了能够更好的理解 Shell 对逻辑运算的实现，我们还得弄清楚，<code>true</code> 和 <code>false</code> 是怎么工作的？</p>
<p><span id="toc_17877_9500_8"></span></p>
<h3 id="bash-里头的-true-和-false-是我们通常认为的-1-和-0-么">Bash 里头的 true 和 false 是我们通常认为的 1 和 0 么？</h3>
<p>回答是：否。</p>
<p><span id="toc_17877_9500_9"></span></p>
<h4 id="范例返回值-vs-逻辑值">范例：返回值 v.s. 逻辑值</h4>
<p><code>true</code> 和 <code>false</code> 它们本身并非逻辑值，它们都是 Shell 的内置命令，只是它们的返回值是一个“逻辑值”：</p>
<pre><code>$ true
$ echo $?
0
$ false
$ echo $?
1
</code></pre>
<p>可以看到 <code>true</code> 返回了 0，而 <code>false</code> 则返回了 1 。跟我们离散数学里学的真值 1 和 0 并不是对应的，而且相反的。</p>
<p><span id="toc_17877_9500_10"></span></p>
<h4 id="范例查看-true-和-false-帮助和类型">范例：查看 true 和 false 帮助和类型</h4>
<pre><code>$ help true false
true: true
     Return a successful result.
false: false
     Return an unsuccessful result.
$ type true false
true is a shell builtin
false is a shell builtin
</code></pre>
<p>说明：<code>$?</code> 是一个特殊变量，存放有上一次进程的结束状态（退出状态码）。</p>
<p>从上面的操作不难联想到在 C 语言程序设计中为什么会强调在 <code>main</code> 函数前面加上 <code>int</code>，并在末尾加上 <code>return 0</code> 。因为在 Shell 里，将把 0 作为程序是否成功结束的标志，这就是 Shell 里头 <code>true</code> 和 <code>false</code> 的实质，它们用以反应某个程序是否正确结束，而并非传统的真假值（1 和 0），相反地，它们返回的是 0 和 1 。不过庆幸地是，我们在做逻辑运算时，无须关心这些。</p>
<p><span id="toc_17877_9500_11"></span></p>
<h2 id="条件测试">条件测试</h2>
<p>从上节中，我们已经清楚地了解了 Shell 下的“逻辑值”是什么：是进程退出时的返回值，如果成功返回，则为真，如果不成功返回，则为假。</p>
<p>而条件测试正好使用了 <code>test</code> 这么一个指令，它用来进行数值测试（各种数值属性测试）、字符串测试（各种字符串属性测试）、文件测试（各种文件属性测试），我们通过判断对应的测试是否成功，从而完成各种常规工作，再加上各种测试的逻辑组合后，将可以完成更复杂的工作。</p>
<p><span id="toc_17877_9500_12"></span></p>
<h3 id="条件测试基本使用">条件测试基本使用</h3>
<p><span id="toc_17877_9500_13"></span></p>
<h4 id="范例数值测试">范例：数值测试</h4>
<pre><code>$ if test 5 -eq 5;then echo "YES"; else echo "NO"; fi
YES
$ if test 5 -ne 5;then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p><span id="toc_17877_9500_14"></span></p>
<h4 id="范例字符串测试">范例：字符串测试</h4>
<pre><code>$ if test -n "not empty";then echo "YES"; else echo "NO"; fi
YES
$ if test -z "not empty";then echo "YES"; else echo "NO"; fi
NO
$ if test -z "";then echo "YES"; else echo "NO"; fi
YES
$ if test -n "";then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p><span id="toc_17877_9500_15"></span></p>
<h4 id="范例文件测试">范例：文件测试</h4>
<pre><code>$ if test -f /boot/System.map; then echo "YES"; else echo "NO"; fi
YES
$ if test -d /boot/System.map; then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p><span id="toc_17877_9500_16"></span></p>
<h3 id="各种逻辑测试的组合">各种逻辑测试的组合</h3>
<p><span id="toc_17877_9500_17"></span></p>
<h4 id="范例如果-abc-都等于下面对应的值那么打印-yes通过--a-进行与测试">范例：如果 a，b，c 都等于下面对应的值，那么打印 YES，通过 -a 进行"与"测试</h4>
<pre><code>$ a=5;b=4;c=6;
$ if test $a -eq 5 -a $b -eq 4 -a $c -eq 6; then echo "YES"; else echo "NO"; fi
YES
</code></pre>
<p><span id="toc_17877_9500_18"></span></p>
<h4 id="范例测试某个东西是文件或者目录通过--o-进行或运算">范例：测试某个“东西”是文件或者目录，通过 -o 进行“或”运算</h4>
<pre><code>$ if test -f /etc/profile -o -d /etc/profile;then echo "YES"; else echo "NO"; fi
YES
</code></pre>
<p><span id="toc_17877_9500_19"></span></p>
<h4 id="范例测试某个东西是否为文件测试--非运算">范例：测试某个“东西”是否为文件，测试 <code>!</code> 非运算</h4>
<pre><code>$ if test ! -f /etc/profile; then echo "YES"; else echo "NO"; fi
NO
</code></pre>
<p>上面仅仅演示了 <code>test</code> 命令一些非常简单的测试，你可以通过 <code>help test</code> 获取 <code>test</code> 的更多用法。需要注意的是，<code>test</code> 命令内部的逻辑运算和 Shell 的逻辑运算符有一些区别，对应的为 <code>-a</code> 和 <code>&amp;&amp;</code>，<code>-o</code> 与 <code>||</code>，这两者不能混淆使用。而非运算都是 <code>!</code>，下面对它们进行比较。</p>
<p><span id="toc_17877_9500_20"></span></p>
<h3 id="比较--a-与---o-与---test-与-test-">比较 -a 与 &amp;&amp;, -o 与 ||， ! test 与 test !</h3>
<p><span id="toc_17877_9500_21"></span></p>
<h4 id="范例要求某文件可执行且有内容用--a-和--分别实现">范例：要求某文件可执行且有内容，用 -a 和 &amp;&amp; 分别实现</h4>
<pre><code>$ cat &gt; test.sh
#!/bin/bash
echo "test"
[CTRL+D]  # 按下组合键CTRL与D结束cat输入，后同，不再注明
$ chmod +x test.sh
$ if test -s test.sh -a -x test.sh; then echo "YES"; else echo "NO"; fi
YES
$ if test -s test.sh &amp;&amp; test -x test.sh; then echo "YES"; else echo "NO"; fi
YES
</code></pre>
<p><span id="toc_17877_9500_22"></span></p>
<h4 id="范例要求某个字符串要么为空要么和某个字符串相等">范例：要求某个字符串要么为空，要么和某个字符串相等</h4>
<pre><code>$ str1="test"
$ str2="test"
$ if test -z "$str2" -o "$str2" == "$str1"; then echo "YES"; else echo "NO"; fi
YES
$ if test -z "$str2" || test "$str2" == "$str1"; then echo "YES"; else echo "NO"; fi
YES
</code></pre>
<p><span id="toc_17877_9500_23"></span></p>
<h4 id="范例测试某个数字不满足指定的所有条件">范例：测试某个数字不满足指定的所有条件</h4>
<pre><code>$ i=5
$ if test ! $i -lt 5 -a $i -ne 6; then echo "YES"; else echo "NO"; fi
YES
$ if ! test $i -lt 5 -a $i -eq 6; then echo "YES"; else echo "NO"; fi
YES
</code></pre>
<p>很容易找出它们的区别，<code>-a</code> 和 <code>-o</code> 作为测试命令的参数用在测试命令的内部，而 <code>&amp;&amp;</code> 和 <code>||</code> 则用来运算测试的返回值，<code>!</code> 为两者通用。需要关注的是：</p>
<ul>
<li>有时可以不用 <code>!</code> 运算符，比如 <code>-eq</code> 和 <code>-ne</code> 刚好相反，可用于测试两个数值是否相等； <code>-z</code> 与 <code>-n</code> 也是对应的，用来测试某个字符串是否为空</li>
<li>在 <code>Bash</code> 里，<code>test</code> 命令可以用[] 运算符取代，但是需要注意，[<code>之后与</code>] 之前需要加上额外的空格</li>
<li>在测试字符串时，所有变量建议用双引号包含起来，以防止变量内容为空时出现仅有测试参数，没有测试内容的情况</li>
</ul>
<p>下面我们用实例来演示上面三个注意事项：</p>
<ul>
<li> <p><code>-ne</code> 和 <code>-eq</code> 对应的，我们有时候可以免去 <code>!</code> 运算</p> <pre><code>$ i=5
$ if test $i -eq 5; then echo "YES"; else echo "NO"; fi
YES
$ if test $i -ne 5; then echo "YES"; else echo "NO"; fi
NO
$ if test ! $i -eq 5; then echo "YES"; else echo "NO"; fi
NO
</code></pre> </li>
<li> <p>用 <code>[ ]</code> 可以取代 <code>test</code>，这样看上去会“美观”很多</p> <pre><code>$ if [ $i -eq 5 ]; then echo "YES"; else echo "NO"; fi
YES
$ if [ $i -gt 4 ] &amp;&amp; [ $i -lt 6 ]; then echo "YES"; else echo "NO"; fi
YES
</code></pre> </li>
<li> <p>记得给一些字符串变量加上 <code>""</code>，记得 <code>[</code> 之后与 <code>]</code> 之前多加一个空格</p> <pre><code>$ str=""
$ if [ "$str" = "test"]; then echo "YES"; else echo "NO"; fi
-bash: [: missing `]'
NO
$ if [ $str = "test" ]; then echo "YES"; else echo "NO"; fi
-bash: [: =: unary operator expected
NO
$ if [ "$str" = "test" ]; then echo "YES"; else echo "NO"; fi
NO
</code></pre> </li>
</ul>
<p>到这里，<strong>条件测试</strong>就介绍完了，下面介绍<strong>命令列表</strong>，实际上在上面我们已经使用过了，即多个test命令的组合，通过 <code>&amp;&amp;</code>，<code>||</code> 和 <code>!</code> 组合起来的命令序列。这种命令序列可以有效替换 <code>if/then</code> 的条件分支结构。这不难想到我们在 C 语言程序设计中经常做的如下的选择题（很无聊的例子，但是有意义）：下面是否会打印 <code>j</code>，如果打印，将打印什么？</p>
<pre><code>#include &lt;stdio.h&gt;
int main()
{
	int i, j;

	i=5;j=1;
	if ((i==5) &amp;&amp; (j=5))&nbsp; printf("%d\n", j);

	return 0;
}
</code></pre>
<p>很容易知道将打印数字 5，因为 <code>i==5</code> 这个条件成立，而且随后是 <code>&amp;&amp;</code>，要判断整个条件是否成立，我们得进行后面的判断，可是这个判断并非常规的判断，而是先把 <code>j</code> 修改为 5，再转换为真值，所以条件为真，打印出 5 。因此，这句可以解释为：如果 <code>i</code> 等于 5，那么把 <code>j</code> 赋值为 5，如果 <code>j</code> 大于 1 （因为之前已经为真），那么打印出 <code>j</code> 的值。这样用 <code>&amp;&amp;</code> 连结起来的判断语句替代了两个 <code>if</code> 条件分支语句。</p>
<p>正是基于逻辑运算特有的性质，我们可以通过 <code>&amp;&amp;</code>，<code>||</code> 来取代 <code>if/then</code> 等条件分支结构，这样就产生了命令列表。</p>
<p><span id="toc_17877_9500_24"></span></p>
<h2 id="命令列表">命令列表</h2>
<p><span id="toc_17877_9500_25"></span></p>
<h3 id="命令列表的执行规律">命令列表的执行规律</h3>
<p>命令列表的执行规律符合逻辑运算的运算规律，用 <code>&amp;&amp;</code> 连接起来的命令，如果前者成功返回，将执行后面的命令，反之不然；用 <code>||</code> 连接起来的命令，如果前者成功返回，将不执行后续命令，反之不然。</p>
<p><span id="toc_17877_9500_26"></span></p>
<h4 id="范例如果-ping-通-wwwlzueducn那么打印连通信息">范例：如果 ping 通 www.lzu.edu.cn，那么打印连通信息</h4>
<pre><code>$ ping -c 1 www.lzu.edu.cn -W 1 &amp;&amp; echo "=======connected======="
</code></pre>
<p>非常有趣的问题出来了，即我们上面已经提到的：为什么要让 C 程序在 <code>main()</code> 函数的最后返回 0 ？如果不这样，把这种程序放入命令列表会有什么样的结果？你自己写个简单的 C 程序，然后放入命令列表看看。</p>
<p><span id="toc_17877_9500_27"></span></p>
<h3 id="命令列表的作用">命令列表的作用</h3>
<p>有时用命令列表取代 <code>if/then</code> 等条件分支结构可以省掉一些代码，而且使得程序比较美观、易读，例如：</p>
<p><span id="toc_17877_9500_28"></span></p>
<h4 id="范例在脚本里判断程序的参数个数和参数类型">范例：在脚本里判断程序的参数个数，和参数类型</h4>
<pre><code>#!/bin/bash

echo $#
echo $1
if [ $# -eq 1 ] &amp;&amp; (echo $1 | grep '^[0-9]*$' &gt;/dev/null);then
	echo "YES"
fi
</code></pre>
<p>说明：上例要求参数个数为 1 并且类型为数字。</p>
<p>再加上 <code>exit 1</code>，我们将省掉 <code>if/then</code> 结构</p>
<pre><code>#!/bin/bash

echo $#
echo $1
! ([ $# -eq 1 ] &amp;&amp; (echo $1 | grep '^[0-9]*$' &gt;/dev/null)) &amp;&amp; exit 1

echo "YES"
</code></pre>
<p>这样处理后，对程序参数的判断仅仅需要简单的一行代码，而且变得更美观。</p>
<p><span id="toc_17877_9500_29"></span></p>
<h2 id="小结">小结</h2>
<p>这一节介绍了 Shell 编程中的逻辑运算，条件测试和命令列表。</p>
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
<a href="/book/136/index.html">
<img class="uk-book-cover" src="/static/icons/48/code_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/136/index.html">Serverless 架构应用开发指南</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/72.html">phodal</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="code">code</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">1页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年8月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 396个">396</span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/195/index.html">
<img class="uk-book-cover" src="/static/icons/48/linux_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/195/index.html">Linux命令大全搜索工具</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/111.html">jaywcjlove</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="linux">linux</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">30页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2021年10月24日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 个"></span>
</div>
</div>
</div>
</li>
<hr>
<li>
<div class="uk-book-item">
<div class="uk-book-header uk-clearfix">
<a href="/book/16/index.html">
<img class="uk-book-cover" src="/static/icons/48/go_48.png" height="48px" alt="">
</a>
<h4 class="uk-book-title uk-margin-small-bottom"><a href="/book/16/index.html">Go语言web编程</a></h4>
<div class="uk-book-meta  uk-text-middle uk-float-left">
<a class="uk-margin-small-right  uk-text-middle user-name " href="/user/9.html">astaxie</a>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-badge uk-badge-notification  book-subject" title="go">go</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">97页</span>
<span class="uk-margin-small-right  uk-text-middle">•</span>
<span class="uk-margin-small-right  uk-text-middle">2018年5月3日</span>
</div>
<div class="uk-book-tip uk-float-right  uk-text-middle">
<span class="uk-badge uk-badge-notification" title="github star 23774个">23774</span>
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
<script type="text/javascript">var bookId =44;var bookPageId =2885;var bookPageRelUrl ='zh/chapters/01-chapter3.markdown';</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38429407-1"></script>
<script>window.dataLayer =window.dataLayer ||[];function gtag(){dataLayer.push(arguments);}
gtag('js',new Date());gtag('config','UA-38429407-1');</script>
<script>var _hmt =_hmt ||[];(function() {var hm =document.createElement("script");hm.src ="https://hm.baidu.com/hm.js?f28e71bd2b5dee3439448dca9f534107";var s =document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
</body>
</html>