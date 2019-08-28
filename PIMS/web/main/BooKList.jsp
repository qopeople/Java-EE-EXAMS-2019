<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <title>iview example</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>
<div id="app" class="log-but">
<div class="main-box">
    <!--顶部通栏开始-->
    <div id="navHeader" class="nav-header-box">
        <div class="header-wrap">
            <div class="index-link-box clearfix">
                <div class="item-info">
                    <a href="http://www.kongfz.com/" class="info-link">
                        <span class="info-text">首页</span>
                    </a>
                </div>
                <div class="item-info">
                    <a href="http://shop.kongfz.com/" class="info-link">
                        <span class="info-text">书店区</span>
                    </a>
                </div>
                <div class="item-info">
                    <a href="http://tan.kongfz.com/" class="info-link">
                        <span class="info-text">书摊区</span>
                    </a>
                </div>
                <div class="item-info">
                    <a href="http://item.kongfz.com/" class="info-link">
                        <span class="info-text">新书</span>
                    </a>
                </div>
                <div class="item-info">
                    <a href="http://www.kongfz.cn/" class="info-link">
                        <span class="info-text">在线拍卖</span>
                    </a>
                </div>
                <div class="item-info">
                    <a href="http://www.kongfz.cn/special/" class="info-link">
                        <span class="info-text">艺术品专场</span>
                    </a>
                </div>
            </div>
            <div class="user-info-box clearfix">
                <div class="item-info login-win">
                    <!--                    <span class="line-left">|</span>-->
                    <!--                    <span class="line-right">|</span>-->
                    <span id="nickName" class="info-normal">
                        <span class="info-text">登录</span>
                        <span class="info-text">/</span>
                        <span class="info-text">注册</span>
                    </span>
                    <div id="loginWin" class="info-win"></div>
                </div>
                <div class="item-info message-win">
                    <a id="msgNum" href="http://message.kongfz.com/Index/myMessage/#inbox" class="info-link msg-normal no-win" target="_blank" rel="nofollow">
                        <span class="iconfont icon-xiaoxi un-read-style"></span>
                        <span class="info-text un-read-style">未读消息 <span id="unReadNum" class="num"></span></span>
                        <span class="info-text normal-style">消息</span>
                    </a>
                </div>
                <div class="item-info">
                    <a id="cartLink" href="http://cart.kongfz.com/list" class="info-link" target="_blank" rel="nofollow">
                        <span class="iconfont icon-gouwuche1"></span>
                        <span class="info-text">购物车 <span id="cartNum" class="num"></span></span>
                    </a>
                    <div id="cartListWin" class="info-win">
                        <div class="load-box"></div>
                    </div>
                </div>
                <div class="item-info">
                    <a href="http://shop.kongfz.com/buyer/order/order_list.html" class="info-link no-win" target="_blank" rel="nofollow">
                        <span class="info-text">我的订单</span>
                    </a>
                </div>
                <div class="item-info">
                    <a href="http://user.kongfz.com/" class="info-link" target="_blank" rel="nofollow">
                        <span class="info-text">个人中心</span>
                    </a>
                    <div class="info-win">
                        <div class="personal-center">
                            <div class="info-domain">
                                <div class="title">
                                    <span class="iconfont icon-dianpu"></span>
                                    <span class="text">店铺</span>
                                </div>
                                <a href="http://shop.kongfz.com/buyer/order/order_list.html" class="item" target="_blank" rel="nofollow">我的订单</a>
                                <a href="http://user.kongfz.com/buyer/favorite_manage.html#product" class="item" target="_blank" rel="nofollow">收藏</a>
                                <!--                                <a href="#" class="item" target="_blank">足迹</a>-->
                            </div>
                            <div class="info-domain">
                                <div class="title">
                                    <span class="iconfont icon-paimai"></span>
                                    <span class="text">拍卖</span>
                                </div>
                                <a href="http://www.kongfz.cn/buyer/trade_list.html" class="item" target="_blank" rel="nofollow">拍卖交易</a>
                                <a href="http://www.kongfz.cn/buyer/bidding_manage.html" class="item" target="_blank" rel="nofollow">我的竞拍</a>
                                <a href="http://www.kongfz.cn/buyer/favorite_manage.html" class="item" target="_blank" rel="nofollow">收藏</a>
                                <!--                                <a href="#" class="item" target="_blank">足迹</a>-->
                            </div>
                            <div class="info-domain">
                                <div class="title"></div>
                                <a href="http://message.kongfz.com/Index/myFriend/" class="item" target="_blank" rel="nofollow">我的好友</a>
                                <a href="https://pay.kongfz.com/" class="item" target="_blank" rel="nofollow">资金账户</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item-info">
                    <a href="http://shop.kongfz.com/seller/" class="info-link" target="_blank">
                        <span class="info-text">卖家中心</span>
                    </a>
                    <div id="sellerWin" class="info-win"></div>
                </div>
                <div class="item-info">
                    <span class="info-normal">
                        <span class="info-text">客服</span>
                    </span>
                    <div class="info-win">
                        <div class="help-center">
                            <div class="other_info_inner">
                                <a href="http://help.kongfz.com/" class="help_btn" target="_blank" rel="nofollow">
                                <span class="ico">
                                  <span class="iconfont icon-bangzhuzhongxin"></span>
                                </span>
                                    帮助中心
                                </a>
                                <span class="tip">9:00-20:30</span>
                                <a href="http://message.kongfz.com/#customerService" class="help_btn" target="_blank" rel="nofollow">
                                <span class="ico">
                                  <span class="iconfont icon-kefuliuyan"></span>
                                </span>
                                    在线留言
                                </a>
                                <div class="text">
                                    <div class="item">
                                        <div class="">客服电话 <span style="color:#9c9c9c;">(8:00-21:00)</span></div>
                                        <div class="phone">010-62620698</div>
                                        <div class="phone">010-64755951</div>
                                    </div>
                                    <div class="item">
                                        <div class="">纠纷处理 <span style="color:#9c9c9c;">(9:00-18:00)</span></div>
                                        <div class="phone">010-64726856</div>
                                    </div>
                                    <div class="item last">
                                        <div class="">图书审核 <span style="color:#9c9c9c;">(9:00-18:00)</span></div>
                                        <div class="phone">010-62620918</div>
                                    </div>
                                </div>
                                <div>
                                    <a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=800036147&aty=1&a=0&curl=&ty=1" class="help_qq" target="_blank" rel="nofollow">
                                  <span class="ico">
                                    <span class="iconfont icon-kefuqq"></span>
                                  </span>
                                        客服QQ
                                    </a>
                                </div>
                                <div>
                                    <a href="http://message.kongfz.com/?talkId=1654692" class="help_qq" target="_blank" rel="nofollow">
                                  <span class="ico">
                                    <span class="iconfont icon-jiandu"></span>
                                  </span>
                                        监督与建议
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item-info mobile-win">
                     <span class="info-normal">
                        <a href="https://m.kongfz.com/" class="info-link-test" target="_blank">
                            <span class="info-text">手机版</span>
                        </a>
                     </span>
                    <span class="line-right-test">|</span>
                    <div id="codeWim" class="info-win"></div>
                </div>
                <!--                <div class="item-info login-win">-->
                <!--                    <span class="line-left">|</span>-->
                <!--                    <span class="line-right">|</span>-->
                <!--                    <span id="nickName" class="info-normal">-->
                <!--                        <span class="info-text">登录</span>-->
                <!--                        <span class="info-text">/</span>-->
                <!--                        <span class="info-text">注册</span>-->
                <!--                    </span>-->
                <!--                    <div id="loginWin" class="info-win"></div>-->
                <!--                </div>-->
                <div class="item-info area-win dest">
                    <span class="info-normal">
                        <span id="areaText" class="info-text">请选择</span>
                    </span>
                    <div id="areaWin" class="info-win"></div>
                </div>
            </div>
        </div>
    </div>

    <!--公共顶部模板开始-->
    <!--所在地模板-->
    <script id="area-tpl" type="text/x-dot-template">
        <div class="area-box clearfix">
            {{for(var code in it.areaList) { }}
            {{? code == it.active}}
            <div class="item active"><span class="text" code="{{= code}}">{{= it.areaList[code]}}</span></div>
            {{??}}
            <div class="item"><span class="text" code="{{= code}}">{{= it.areaList[code]}}</span></div>
            {{?}}
            {{ } }}
        </div>
    </script>
    <!--用户名模板-->
    <script id="nick-name-tpl" type="text/x-dot-template">
        <span class="info-text user-name-text">{{= it.nickName}}</span>
    </script>
    <!--未登录时登录注册模板-->
    <script id="no-login-tpl" type="text/x-dot-template">
        <div class="login-box">
            <div class="login-btn">登&nbsp;&nbsp;&nbsp;&nbsp;录</div>
            <div class="register-btn">免费注册</div>
            <div class="other-login">
                <div class="title">其他方式</div>
                <div class="login-list clearfix">
                    <div class="login-weixin icon-btn" type="weixin">
                        <div class="icon-box">
                            <span class="iconfont icon-weixin"></span>
                        </div>
                        <div class="text">微信</div>
                    </div>
                    <div class="login-qq icon-btn" type="qq">
                        <div class="icon-box">
                            <span class="iconfont icon-qq"></span>
                        </div>
                        <div class="text">QQ</div>
                    </div>
                    <div class="login-weibo icon-btn" type="weibo">
                        <div class="icon-box">
                            <span class="iconfont icon-weibo"></span>
                        </div>
                        <div class="text">微博</div>
                    </div>
                </div>
            </div>
        </div>
    </script>
    <!--登录后账户信息模板-->
    <script id="login-tpl" type="text/x-dot-template">
        <div class="account-box clearfix">
            <a href="http://user.kongfz.com/person/person_info.html" class="pic-box" target="_blank">
                <img class="pic-img hide" src="" alt="">
                <span class="iconfont icon-yonghutouxiang pic-ico"></span>
            </a>
            <div class="btn-group">
                <a href="http://user.kongfz.com/person/person_info.html" class="btn" target="_blank">账号管理</a>
                <span class="btn-split">|</span>
                <span class="btn logout-btn">退出</span>
            </div>
        </div>
    </script>
    <!--已开通卖家中心模板-->
    <script id="seller-center-tpl" type="text/x-dot-template">
        <div class="{{= ((it.userType.indexOf('shopkeeper') != -1 || it.userType.indexOf('bookstaller') != -1) && (it.userType.indexOf('auctioneer') != -1)) ? 'seller-center' : 'no-seller-center' }}">
            <div class="info-domain">
                <div class="title">
                    <span class="iconfont icon-dianpu"></span>
                    <span class="text">店铺</span>
                </div>
                {{? it.userType.indexOf('shopkeeper') != -1 || it.userType.indexOf('bookstaller') != -1}}
                <a href="http://seller.kongfz.com/pc/upbook/index#/" class="item" target="_blank">添加商品</a>
                <a href="http://seller.kongfz.com/shop/item.html#unsold_9743" class="item" target="_blank">商品管理</a>
                <a href="http://shop.kongfz.com/seller/order/order_list.html" class="item" target="_blank">订单管理</a>
                {{??}}
                <a href="http://shop.kongfz.com/seller/apply/tan.html" class="item" target="_blank">免费摆书摊</a>
                <a href="http://shop.kongfz.com/seller/apply/shop.html" class="item" target="_blank">申请开店</a>
                {{?}}
            </div>
            <div class="info-domain">
                <div class="title">
                    <span class="iconfont icon-paimai"></span>
                    <span class="text">拍卖</span>
                </div>
                {{? it.userType.indexOf('auctioneer') != -1}}
                <a href="http://www.kongfz.cn/seller/product.html#add" class="item" target="_blank">添加拍品</a>
                <a href="http://www.kongfz.cn/seller/product_list.html" class="item" target="_blank">拍品管理</a>
                <a href="http://www.kongfz.cn/seller/trade_list.html" class="item" target="_blank">交易管理</a>
                {{??}}
                <a href="http://www.kongfz.cn/index/apply/" class="item" target="_blank" rel="nofollow">申请拍卖会员</a>
                {{?}}
            </div>
        </div>
    </script>
    <!--未登录状态下购物车为空模板-->
    <script id="no-login-cart-none-tpl" type="text/x-dot-template">
        <div class="no-login-cart-none-box">
            <div class="tip">
                <span class="text">您的购物车是空的，</span>
                <span class="text">登录后可以同步购物车中的商品哦</span>
            </div>
            <div class="login-btn">登录</div>
        </div>
    </script>
    <!--登录状态下购物车为空模板-->
    <script id="cart-none-tpl" type="text/x-dot-template">
        <div class="cart-none-box">
            <div class="iconfont icon-gouwuche11"></div>
            <div class="tip">您的购物车是空的，快去挑点好书放进来吧。</div>
        </div>
    </script>
    <!--购物车列表模板-->
    <script id="cart-list-tpl" type="text/x-dot-template">
        <div class="cart-list-box">
            <div class="title">最近加入的商品:</div>
            <div class="item-list">
                {{~it.cartList :item:index}}
                <div class="item clearfix" shopid="{{= item.shopId}}" itemid="{{= item.itemId}}" cartid="{{= item.id}}">
                    <a class="img-box" href="http://book.kongfz.com/{{= item.shopId + '/' + item.itemId + '/' }}" target="_blank">
                        <img src="{{= item.imgUrl}}" alt="" onerror="this.src='{{= it.base}}static/kfz-navHeader/error.jpg';">
                    </a>
                    <a href="http://book.kongfz.com/{{= item.shopId + '/' + item.itemId + '/' }}" class="name" target="_blank">{{! item.itemName}}</a>
                    <div class="info">
                        <div class="price">￥{{= item.price}}</div>
                        <div class="del-box">
                            <span class="del-btn">删除</span>
                        </div>
                    </div>
                </div>
                {{~}}
            </div>
            <div class="revoke-btn">误删了？点击这里找回商品</div>
            <div class="btn-box clearfix">
                {{? it.cartNum > 5}}
                <div class="tip">
                    <span>购物车里还有</span>
                    <span class="num">{{= it.cartNum - 5}}</span>
                    <span>件商品</span>
                </div>
                {{?}}
                <a href="http://cart.kongfz.com/list" class="btn" target="_blank">查看我的购物车</a>
            </div>
        </div>
    </script>
    <!--load模板-->
    <script id="nav-load-tpl" type="text/x-dot-template">
        <img src="{{= it.base}}static/kfz-navHeader/loading.gif" alt="">
    </script>
    <!--二维码模板-->
    <script id="qr-code-tpl" type="text/x-dot-template">
        <div class="mobile-code clearfix">
            <div class="app-box">
                <div class="text">APP客户端</div>
                <div class="code">
                    <a href="http://app.kongfz.com/kfz.html" class="code-link" target="_blank">
                        <img src="{{= it.base}}static/kfz-navHeader/app.jpg" alt="">
                    </a>
                </div>
                <div class="tip">
                    <span>iOS</span>
                    <span> • </span>
                    <span>Android</span>
                </div>
            </div>
        </div>
    </script>
    <!--公共顶部模板结束-->

    <ul>
        <li><a href="#home">主页</a></li>
        <li><a href="#news">新闻</a></li>
        <li><a href="#contact">联系</a></li>
        <li style="float:right"><a class="active" href="#about">关于</a></li>
    </ul>


</div>
</body>
</html>
<!-- import Vue before Element -->
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>

<script>
    new Vue({
        el: '#app',
        data: function() {
            return {
                activeName: 'first',

                checked: false
            }
        },

    });


    function otherlogin() {

        response.sendRedirect("https://cas.dgut.edu.cn?appid=javaee&state=STATE");
    }
    function checkform2() {
        console.log("ddd")
    }
</script>
<style>

    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #333;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    /*鼠标移动到选项上修改背景颜色 */
    li a:hover {
        background-color: #111;
    }



</style>