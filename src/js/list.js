; (function () {
    $("#header").load("head.html", function () {
        $("#index").attr("href", "../index.html");
        $("#h_login").attr("href", "login.html")
        $(".qrcode").find("img").attr("src", "../img/shop_wechat.png")
        $("#h_reg").attr("href", "reg.html")
        if (getCookie("u_name")) {
            var cooki = getCookie("u_name");
            $(".h_name").html("<a href='###'>" + cooki + "</a>")
            $("#h_reg").attr("href", "###").css("color", "black").html("退出")
            $("#h_reg").click(function () {
                removeCookie("u_name");
                removeCookie("u_phone");
                $(".h_name").html(" Hi~欢迎来到Z商城，请<a href='login.html'>登录</a>")
                $("#h_reg").html("免费注册").attr("href", "html/login.html");
            });
        }

    });
    //引入 title
    $("#title").load("title.html", function () {

        $(".t_logo").find("img").attr("src", "../img/zol-tuan.png");
        $(".classify").mouseenter(function () {
            $(".nav_cl").toggle().on("mouseenter", "li", function () {
                $(this).css("backgroundColor", "white").children().css("color", "black");
                $(this).siblings().css("backgroundColor", "#454545").children().css("color", "white");
            });

        })
        $(".m_car").click(function () {
            if (getCookie("u_name")) {
                location.href = "../html/car.html?"
            } else {
                alert("请登录")
            }
        })
        $(".t_logo img").click(function () {
            location.href = "../index.html?";
        })
        $(".nav_cl").on("click", "li", function () {
            var type_name = $(this).attr("data-type");
            location.href = "list.html?" + type_name;
        })

        $(".classify").mouseleave(function () {
            $(".nav_cl").toggle();
            console.log(33)
        })
    });

    var g_typeName = decodeURI(location.search).slice(1);
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

    function G_lists() {
        this.list = $("#goodsList")
    }
    G_lists.prototype.init = function () {

        this.show(g_typeName, "content")
        this.sort()
        for (var i = 0; i < 7; i++) {
            if ($(".nav p").eq(i).attr("data-type") == g_typeName) {
                $(".nav p").eq(i).addClass("active").siblings().removeClass("active")
            }
        }


    }

    G_lists.prototype.show = function (type, con) {
        this.time = [];

        $.ajax({
            type: "get",
            url: "../api/type.php",
            data: {
                g_type: type,
                sort: this.sorts,

            },
            success: function (str) {
                var arr = JSON.parse(str);

                var html = arr[con].map(function (item) {
                    this.time.push(item.buy_time)

                    return `<li data-id="${item.id}">
                     <a href="###">
                         <div class="img_box"> <img src="../img/${item.images.split("&")[0]}" alt=""></div>
                         <p class="title">${item.title}</p>
                         <p class="title_m">${item.magges}</p>
                         <h4>
                             <span>￥${item.now_price}</span>
                             <span>￥${item.original_price}</span>
                             <span>立省${item.price_coupon}元</span>
                             <p>马上抢</p>
                         </h4>
                         <h3>剩余
                             <span class="day"></span>天
                             <span class="hours"></span>时
                             <span class="m"></span>分
                             <span class="s"></span>秒
                         </h3>
                     </a>
                 </li>`
                }.bind(this)).join("")

                $("#goodsList").html(html)

                setInterval(function () {
                    for (var i = 0; i < this.time.length; i++) {
                        $(".day").eq(i).html(new ShowTime(this.time[i]).init().days);
                        $(".hours").eq(i).html(new ShowTime(this.time[i]).init().hours);
                        $(".m").eq(i).html(new ShowTime(this.time[i]).init().mins);
                        $(".s").eq(i).html(new ShowTime(this.time[i]).init().secs);
                    }
                }.bind(this), 1000)
            }.bind(this)
        })

    }

    G_lists.prototype.sort = function () {
        var _this = this;
        this.t_name = g_typeName;


        $(".nav").on("click", "p", function () {
            $(this).addClass("active").siblings().removeClass("active");

            //点击全部
            if ($(this).html() == $(".nav p").eq(0).html()) {
                _this.show("", "content")
                _this.t_name = "";
            } else {
                _this.show($(this).attr("data-type"), "content")
                _this.t_name = $(this).attr("data-type");
            }
        })
        //销量
        $(".g_sort p").eq(2).click(function () {
            $(".g_sort p").eq(2).addClass("click").siblings().removeClass("click");
            this.sorts = $(".g_sort p").eq(2).attr("data-price")//获取排序
            if (this.sorts == "desc") {
                this.show(this.t_name, "content3");
                $(".g_sort p").eq(3).attr("data-price", "asc")
            } else {
                this.show(this.t_name, "content3")
                $(".g_sort p").eq(3).attr("data-price", "desc");
            }

            //全部商品的销售量
            if ($(".nav p").eq(0).attr("class") == "active") {
                this.show(this.t_name, "content5");
            } else {
            }

        }.bind(this));
        //跳转

        $("#goodsList").on("click", "li", function () {
            var c_id = $(this).attr("data-id");
            location.href = "goods.html?" + c_id;
        })

        //默认 
        $(".g_sort p").eq(0).click(function () {
            $(".g_sort p").eq(0).addClass("click").siblings().removeClass("click");
            this.show(this.t_name, "content")

        }.bind(this));

        //价格排序 
        $(".g_sort p").eq(3).click(function () {
            $(".g_sort p").eq(3).addClass("click").siblings().removeClass("click");
            this.sorts = $(".g_sort p").eq(3).attr("data-price")//获取排序
            if (this.sorts == "desc") {
                this.show(this.t_name, "content2");
                $(".g_sort p").eq(3).attr("data-price", "asc")
            } else {
                this.show(this.t_name, "content2")
                $(".g_sort p").eq(3).attr("data-price", "desc");
            }
            //全部商品价格排序
            if ($(".nav p").eq(0).attr("class") == "active") {
                this.show(this.t_name, "content4");
            } else {
                console.log(1)
            }
        }.bind(this));
    }
    var g_lists = new G_lists();
    g_lists.init();
})()