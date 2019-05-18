; (function () {
    var outtu = new OutlineDrawing("b_left")// 大轮播图
    outtu.init();

    //小轮播
    function Doutique() {
        this.but_prev = $("#boutique_prev");//上
        this.but_next = $("#boutique_next");//下
        this.b_goods = $("#boutique_goods");//ul
        this.timer = null;
        this.num = 0;
    }

    Doutique.prototype.init = function () {
        this.remove();
        this.prev();
        this.next();
        this.apply();
        this.timerTwo = null;

        $(".goods_box").mouseenter(function () {
            clearInterval(this.timer)
            // this.remove();
        }.bind(this))
        $(".goods_box").mouseleave(function () {
            this.remove();
            // clearInterval(this.timer)
        }.bind(this))

        $(".goods_box").on("click", "li", function () {
            var c_id = $(this).attr("data-id");
            location.href = "html/goods.html?" + c_id;
        })
    }

    //自动轮播
    Doutique.prototype.remove = function () {
        this.timer = setInterval(function () {
            // console.log(this.data)
            // this.b_goods.css({ right: 0, left: -300 });
            this.b_goods.animate({ "margin-left": -300 }, 1000, function () {
                $(".boutique_goods li").eq(0).appendTo($(".boutique_goods"));
                $(".boutique_goods").css("margin-left", 0);
            })

        }.bind(this), 2000)
    }

    //上一张
    Doutique.prototype.prev = function () {
        this.but_prev.click(function () {
            clearInterval(this.timer);
            // this.b_goods.css({ right: 0, left: -300 });
            this.b_goods.animate({ "margin-left": -300 }, 1000, function () {
                $(".boutique_goods li").eq(0).appendTo($(".boutique_goods"));
                $(".boutique_goods").css("margin-left", 0);
            })
        }.bind(this))
    }
    //下一张
    Doutique.prototype.next = function () {
        this.but_next.click(function () {
            console.log(1)
            clearInterval(this.timer);
            // this.b_goods.css({ left: 0, right: -300 });
            this.b_goods.animate({ "margin-right": -300 }, 1000, function () {
                $(".boutique_goods li").eq(5).prependTo($(".boutique_goods"));
                $(".boutique_goods").css("margin-right", 0);
            })
        }.bind(this))
    }
    Doutique.prototype.apply = function () {

        // this.data = [];
        $.ajax({
            type: 'get',
            url: "api/lists_sort.php",
            success: function (str) {
                var arr = JSON.parse(str);
                // console.log(arr.con)
                var html = arr.content4.map(function (item) {
                    return `<li data-id="${item.id}">
                      <p><a href="###"><img src="img/${item.images.split("&")[0]}" alt=""></a></p>
                      <p><a href="###">${item.title}</a></p>
                      <p><span>￥${item.now_price}</span><span>￥${item.original_price}</span></p>
                      <h4>
                          <div class="s_left">
                              <p><a href="###">${item.storeName}</a></p>
                              <p id="s_time">
                                 </p>
                          </div>
                          <div class="s_but_buy"><a href="###">马上抢</a></div>
                      </h4>
                  </li>`
                }.bind(this)).join("");
                this.b_goods.html(html)
            }.bind(this)
        })
    }
    var doutique = new Doutique();//小轮播图
    doutique.init();

    //倒计时
    function ShowTime(data) {

        this.endTime = new Date(data);// 结束时间
        this.nowtime;//现在时间
        this.diffTime;//两个时间差
        this.timer = null;

    }

    ShowTime.prototype.init = function () {
        this.nowtime = new Date();
        this.diffTime = parseInt((this.endTime - this
            .nowtime) / 1000);
        var numT = setTime(this.diffTime);
        return numT;
    }

    var time = new ShowTime("2019-05-20 15:25:00")
    time.init()

    //列表渲染
    function Goods_list() {
        this.goodsList = $("#goodsList");//商品框
        this.page = 1; //第几页
        this.num = 3; //每页多少条
        this.pages = 0;//总页
        this.isok = true;
        this.isok2 = true;
    }

    Goods_list.prototype.init = function () {
        this.show();
        this.skip();
        this.timer4 = setInterval(this.show.bind(this), 1000)
        //鼠标滚轮 懒加载
        $(window).scroll(function () {
            if (this.isok2) {
                // console.log(1);
                if (window.scrollY >= 630) {
                    if (window.scrollY >= 1021) {
                        $(".today_nav").addClass("firm");
                        $("#t_g").addClass("firm2")
                    } else {
                        $(".today_nav").removeClass("firm");
                        $("#t_g").removeClass("firm2")
                    }

                    if (this.page == this.pages) {
                        //到达最后一页了
                        $(".bottom").show();
                        return;
                    } else {

                        if (this.isok) {
                            this.isok = false; //关闭
                            this.page++;
                            setTimeout(function () {
                                this.show(); //直到一页数据加载完了，才把开关打开，才能加载下一页，这样写能控制数据是一页一页的过来
                                this.isok = true;
                            }.bind(this), 1000);
                        }
                    }
                }
            }
        }.bind(this))
    }
    //渲染
    Goods_list.prototype.show = function () {
        $.ajax({
            type: "get",
            url: "api/lists.php",
            data: {
                page: this.page,
                num: this.num
            },
            success: function (str) {
                var arr = JSON.parse(str)

                var html = arr.goodslist.map(function (item) {
                    // console.log(new ShowTime(item.buy_time).init())
                    return ` <li data-id="${item.id}">
                    <a href="###">
                        <div class="img_box"> <img src="img/${item.images.split("&")[0]}" alt=""></div>
                        <p class="title">${item.title}</p>
                        <p class="title_m">${item.magges}</p>
                        <h4>
                            <span>￥${item.now_price}</span>
                            <span>￥${item.original_price}</span>
                            <span>立省${item.price_coupon}元</span>
                            <p>马上抢</p>
                        </h4>
                        <h3 class="time">
                           剩余
                           ${new ShowTime(item.buy_time).init().days}天
                           ${new ShowTime(item.buy_time).init().hours}时
                           ${new ShowTime(item.buy_time).init().mins}分
                           ${new ShowTime(item.buy_time).init().secs}秒
                        </h3>
                    </a>
                </li>`
                }).join("")
                this.goodsList.html(html);
                this.pages = Math.ceil(arr.total / arr.num);

            }.bind(this)
        })
    }
    Goods_list.prototype.skip = function () {
        this.goodsList.on("click", "li", function () {
            var c_id = $(this).attr("data-id");
            location.href = "html/goods.html?" + c_id;

        })
    }

    var goods = new Goods_list();

    //商品排序
    function Goods_nav() {
        this.today_nav = $(".today_nav");
        this.isok = true;
    }
    Goods_nav.prototype.init = function () {

        $.ajax({
            type: 'get',
            url: "api/car.php",
            data: {
                u_phone: getCookie("u_phone")
            },
            success: function (str) {
                var arr = JSON.parse(str);
                $(".my .car_nums").html(arr.content.length)
                $(".h_right .c_nums").html(arr.content.length)
            }
        })

        //初始化 默认
        if ($(".today_nav p").eq(0).attr("class") == "click") {
            goods.init()
        } else {
            clearInterval(goods.timer4)
        }

        //点击销量排序
        $(".today_nav p").eq(2).click(function () {
            $(".today_nav p").eq(2).addClass("click").siblings().removeClass("click");//高亮
            clearInterval(goods.timer4)
            clearInterval(this.timer3);
            goods.isok2 = false;
            $(".bottom").show();
            this.show("content2")
        }.bind(this))
        //点击最近团购
        $(".today_nav p").eq(1).click(function () {
            $(".today_nav p").eq(1).addClass("click").siblings().removeClass("click");//高亮
            clearInterval(goods.timer4)
            clearInterval(this.timer3);
            goods.isok2;
            $(".bottom").show();
            this.show("content3")
        }.bind(this))

        //默认按钮
        $(".today_nav p").eq(0).click(function () {
            goods.isok2 = true;
            $(".today_nav p").eq(0).addClass("click").siblings().removeClass("click");//高亮
            goods.init()
            $(".bottom").show();
            clearInterval(this.timer3)
        }.bind(this)
        )
        //点击价格  按照价格排序
        $(".today_nav p").eq(3).click(function () {
            goods.isok2 = false;
            $(".bottom").show();
            $(".today_nav p").eq(3).addClass("click").siblings().removeClass("click");//高亮
            clearInterval(goods.timer4)
            this.sort = $(".today_nav p").eq(3).attr("data-sort")//获取排序
            if (this.sort == "desc") {
                clearInterval(this.timer3)
                this.show("content");
                $(".today_nav p").eq(3).attr("data-sort", "asc")
            } else {
                clearInterval(this.timer3)
                this.show("content")
                $(".today_nav p").eq(3).attr("data-sort", "desc");
            }
        }.bind(this)
        )
    }
    Goods_nav.prototype.show = function (con) {
        this.timer3 = setInterval(function () {
            // console.log(con);
            $.ajax({
                type: "get",
                url: "api/lists_sort.php",
                data: {
                    sort: this.sort
                },
                success: function (str) {

                    var arr = JSON.parse(str)
                    var html = arr[con].map(function (item) {
                        // console.log(new ShowTime(item.buy_time).init())
                        return ` <li data-id="${item.id}">
                        <a href="###">
                            <div class="img_box"> <img src="img/${item.images.split("&")[0]}" alt=""></div>
                            <p class="title">${item.title}</p>
                            <p class="title_m">${item.magges}</p>
                            <h4>
                                <span>￥${item.now_price}</span>
                                <span>￥${item.original_price}</span>
                                <span>立省${item.price_coupon}元</span>
                                <p>马上抢</p>
                            </h4>
                            <h3 class="time">
                               剩余
                               ${new ShowTime(item.buy_time).init().days}天
                               ${new ShowTime(item.buy_time).init().hours}时
                               ${new ShowTime(item.buy_time).init().mins}分
                               ${new ShowTime(item.buy_time).init().secs}秒
                            </h3>
                        </a>
                    </li>`
                    }).join("")
                    goods.goodsList.html(html);
                }
            })
        }.bind(this), 1000)
    }
    Goods_nav.prototype.skip = function () {

    }
    var goods_nav = new Goods_nav();
    goods_nav.init()

})();