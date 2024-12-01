(function($){

    $(function() {

        $('.uk-offcanvas-bar ul').html($('#nav-wrap').html());

        var ua = navigator.userAgent.toLowerCase(), isMobile = ua.match(/iphone|ipad|android/);
        
        if (!isMobile ) {
         // $.UIkit.offcanvas.show('#menu-id');
        }

        if(navigator.appName == "Microsoft Internet Explorer" 
		&& (navigator.appVersion.split(";")[1].replace(/[ ]/g,"")=="MSIE6.0" || 
				navigator.appVersion.split(";")[1].replace(/[ ]/g,"")=="MSIE7.0" || 
				navigator.appVersion.split(";")[1].replace(/[ ]/g,"")=="MSIE8.0" )) 
        {
            $('body').prepend('<div style="color:red;margin:10px auto;font-size:16px;font-weight:bold;text-align:center;">本网站不支持IE8及以下浏览器。请使用Chrome浏览器或者IE9以上浏览器重新打开网站。</div>');
        } 
       
    });

})(jQuery);

(function(socialShare) {
    socialShare.plugin('qq', function(args) {
        args.title = args.title || document.title;
        args.url = args.url || location.href;
        return {
            url: 'http://connect.qq.com/widget/shareqq/index.html?' + param(args),
            background: '#ED8E7E',
            icon: 'uk-icon-qq',
            target: '_blank'
        };
    });

    socialShare.plugin('qzone', function(args) {
        args.title = args.title || document.title;
        args.url = args.url || location.href;
        return {
            url: 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?' + param(args),
            background: '#FFC028',
            icon: 'uk-icon-qq',
            target: '_blank'
        };
    });

    function param(obj) {
        var ret = '';
        for (var k in obj) {
            if (obj.hasOwnProperty(k)) {
                if (ret.length) {
                    ret += '&';
                }
                ret += k + '=' + encodeURIComponent(obj[k]);
            }
        }
        return ret;
    }
})(window.socialShare);

 window.socialShare(document.getElementById('share-box'),  [
        {plugin: 'wechat',icon: 'uk-icon-wechat', background: "#fff",color:"#333"},
        {plugin: 'qq', icon: 'uk-icon-qq', background: "#fff",color:"#333"},
        {plugin: 'weibo', icon: 'uk-icon-weibo',target: '_blank', background: "#fff",color:"#333"},
        {plugin: 'qrcode', icon: 'uk-icon-qrcode', background: "#fff",color:"#333"},
        ], {size: 'sm'});