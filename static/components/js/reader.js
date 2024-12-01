
(function($){

    $(function() {

        hljs.initHighlightingOnLoad();

        var ua = navigator.userAgent.toLowerCase(), isMobile = ua.match(/iphone|ipad|android/);
        var width = window.innerWidth;

        $.UIkit.on('show.uk.offcanvas', function(){
          var marginLeft = $('#menu-id .uk-offcanvas-bar:first').outerWidth();
          $('.bottom-nav').css('margin-left', marginLeft);
          if (isMobile ) {
            $('.bottom-nav').hide();
            $('.uk-navbar-brand').hide();
          }else{
            $('.bottom-nav').show();
            if( width <= 1366){
                $('.book-main-wrap').addClass('small-width');
            }else{
                $('.book-main-wrap').removeClass('small-width');
            }
          }
        }).on('hide.uk.offcanvas', function(){
          $('.bottom-nav').css('margin-left', '');
          $('.bottom-nav').show();
          $('.uk-navbar-brand').show();

          $('.book-main-wrap').removeClass('small-width');

        });

        

        // if ($.support.pjax) {
        //       $(document).on('click', '.book-menu-bar li a.pjax, .bottom-nav a', function(event) {
        //           bookPageId = $(this).attr('data-book-page-id');
        //           bookPageRelUrl = $(this).attr('data-book-page-rel-url');
        //           $.pjax.click(event, {container: '.reader-wrap',fragment:'.reader-wrap' })
        //       })
        //       $(document).on('pjax:complete', function() {
        //          if (isMobile ) {
        //             $.UIkit.offcanvas.hide(false);
        //          }
        //          reActive();
		// 		 initMathJax();
        //       })

        //       $(document).on('pjax:beforeReplace', function() {
        //          var str = window.location.pathname;

        //          var reg = /\/book\/([^/]+)\/(.*)/g;
        //          var result = reg.exec(str);
        //          bookPageRelUrl = result[2];

        //          if (isMobile ) {
        //           $.UIkit.offcanvas.hide(false);
        //          }

        //          reActive();
        //          initMathJax();
        //       })
        // };


        var fontSizeIndex = 2;
        var fontFamilyIndex = 1;
        var colorThemeIndex = 1;
        var showMenu = 1;

        var historyStr = $.cookie('his-d');
        if(historyStr!= null && historyStr!=''){
            var history = JSON.parse(historyStr);
            if(history['us'] != null){
                var userSetting = history['us'];
                if(userSetting['fs'] != null){
                    fontSizeIndex = userSetting['fs'];
                }
                if(userSetting['ff'] != null){
                    fontFamilyIndex = userSetting['ff'];
                }
                if(userSetting['ct'] != null){
                    colorThemeIndex = userSetting['ct'];
                }
                if(userSetting['sm'] != null){
                    showMenu = userSetting['sm'];
                }
            }
        }

        var saveHistory = function(){
            var historyStr = $.cookie('his-d');
            var history = {};
            if(historyStr!= null && historyStr!=''){
                history = JSON.parse(historyStr);
            }
            var userSetting = {};
            if(history['us'] != null){
                userSetting = history['us'];
            }
            userSetting['fs'] = fontSizeIndex;
            userSetting['ff'] = fontFamilyIndex;
            userSetting['ct'] = colorThemeIndex;
            userSetting['sm'] = showMenu;
            history['us'] = userSetting;
            var str = JSON.stringify(history);
            $.cookie('his-d',str, { expires: 90, path: '/' });
        };


        function reActive() {
            if(window['bookPageRelUrl']!= undefined && bookPageRelUrl != null){
                $('.book-menu-bar li a').removeClass('active');
                $('a[data-book-page-rel-url="'+bookPageRelUrl+'"]').addClass('active');
                if(!$('.reader-offcanvas').is(":hidden")){
                    var marginLeft = $('#menu-id .uk-offcanvas-bar:first').outerWidth();
                    $('.bottom-nav').css('margin-left', marginLeft);
                }
            }
        };

        
        if (showMenu == 1) {
            $.UIkit.offcanvas.show('#menu-id');
        }else{
            $.UIkit.offcanvas.hide(false);
        }


        reActive();

        $('.show-menu').on('click',  function (e) {
            if($('#menu-id').is(":hidden")){
                // 通过CSS选择器匹配抽屉显示状态
                $.UIkit.offcanvas.show('#menu-id');
                showMenu = 1;
                saveHistory();
            }else{
                // 隐藏当前所有抽屉。如果你不需要任何动画效果，设置为 true。
                $.UIkit.offcanvas.hide(false);
                showMenu = 0;
                saveHistory();
            }
        });


        $('body').addClass('font-size-'+fontSizeIndex);
        $('body').addClass('font-family-'+fontFamilyIndex);
        $('body').addClass('color-theme-'+colorThemeIndex);

        $('.dropdown-menu .font-reduce').on('click',  function (e) {
            var tt = fontSizeIndex -1;
            if(tt < 0){
                tt = 0;
            }
            $('body').removeClass('font-size-'+fontSizeIndex).addClass('font-size-'+(tt));
            fontSizeIndex = tt;
            saveHistory();
        });
        $('.dropdown-menu .font-enlarge').on('click',  function (e) {
            var tt = fontSizeIndex + 1;
            if(tt > 4){
                tt = 4;
            }
            $('body').removeClass('font-size-'+fontSizeIndex).addClass('font-size-'+(tt));
            fontSizeIndex = tt;
            saveHistory();
        });

        $('.dropdown-menu .font-1').on('click',  function (e) {
            $('body').removeClass('font-family-2').addClass('font-family-1');
            fontFamilyIndex = 1;
        });
        $('.dropdown-menu .font-2').on('click',  function (e) {
            $('body').removeClass('font-family-1').addClass('font-family-2');
            fontFamilyIndex = 2;
            saveHistory();
        });

        $('.dropdown-menu .color-theme-sun').on('click',  function (e) {
            $('body').removeClass('color-theme-'+colorThemeIndex).addClass('color-theme-1');
            colorThemeIndex = 1;
            saveHistory();
        });
        $('.dropdown-menu .color-theme-eye').on('click',  function (e) {
            $('body').removeClass('color-theme-'+colorThemeIndex).addClass('color-theme-2');
            colorThemeIndex = 2;
            saveHistory();
        });
        $('.dropdown-menu .color-theme-moon').on('click',  function (e) {
            $('body').removeClass('color-theme-'+colorThemeIndex).addClass('color-theme-3');
            colorThemeIndex = 3;
            saveHistory();
        });



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
