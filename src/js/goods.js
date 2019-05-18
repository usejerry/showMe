; (function () {
    //引入header
    $("#header").load("head.html", function () {
        $("#index").attr("href", "../index.html");
        $("#h_login").attr("href", "login.html")
        $(".qrcode").find("img").attr("src", "../img/shop_wechat.png")
        $("#h_reg").attr("href", "reg.html")
        if (getCookie("u_name")) {
            var cooki = getCookie("u_name");
            console.log(cooki)
            $(".h_name").html("<a href='###'>" + cooki + "</a>")
            $("#h_reg").attr("href", "###").css("color", "black").html("退出")
            $("#h_reg").click(function () {
                removeCookie("u_name");
                removeCookie("u_phone");
                $(".h_name").html(" Hi~欢迎来到Z商城，请<a href='login.html'>登录</a>")
                $("#h_reg").html("免费注册").attr("href", "login.html");
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
        $(".nav_cl").on("click", "li", function () {
            var type_name = $(this).attr("data-type");
            location.href = "list.html?" + type_name;
        })
        $(".m_car").click(function () {
            if (getCookie("u_name")) {
                location.href = "car.html?"
            }
        })
        $(".classify").mouseleave(function () {
            $(".nav_cl").toggle();
        })
    });

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
    var c_id = decodeURI(location.search).slice(1);

    function Details() {
        this.c_id = c_id; //商品id
        this.num = parseInt($(".goods_nums input").eq(1).val());//商品数量
        this.isok = false;
    }
    Details.prototype.init = function () {
        this.show();
        this.buy();

        //购物车的数量
        $.ajax({
            type: 'get',
            url: "../api/car.php",
            data: {
                u_phone: getCookie("u_phone")
            },
            success: function (str) {
                var arr = JSON.parse(str);
                $(".my .car_nums").html(arr.content.length)
                $(".h_right .c_nums").html(arr.content.length)
            }
        })
    }
    Details.prototype.glass = function () {
        $("#im").imagezoomsl({

            zoomrange: [2.12, 12],
            magnifiersize: [530, 340],
            scrollspeedanimate: 10,
            loopspeedanimate: 5,
            cursorshadeborder: "10px solid black",
            magnifiereffectanimate: "slideIn"
        });
    }
    Details.prototype.show = function () {
        $.ajax({
            type: "get",
            url: "../api/lists_sort.php",
            data: {
                cid: this.c_id
            },
            success: function (str) {
                var arr = JSON.parse(str);
                // console.log(arr.content6)
                this.big_img = arr.content5[0].images.split("&");//图片
                this.colors = arr.content5[0].color.split("&");//颜色
                this.time = arr.content5[0].buy_time; //时间
                this.original_p = arr.content5[0].original_price;//原价
                this.now_p = arr.content5[0].now_price;//现价
                this.g_title = arr.content5[0].title;//标题
                this.b_magges = arr.content5[0].magges;
                this.g_storeName = arr.content5[0].storeName;//店名
                // console.log()
                this.html1 = `<img src="../img/${this.big_img[0]}" alt="" id="im">`;//大图片
                //小图片  
                this.html2 = this.big_img.map(function (item) {
                    return `<li><a href="###"><img src="../img/${item}" alt=""></a></li>`
                }).join("");
                this.html3 = `${arr.content5[0].title}`
                this.html4 = this.colors.map(function (item) {
                    return `<li>${item}</li>`
                }).join("");

                this.day = $("#day");//倒计时天
                this.hours = $("#hours");//时
                this.s = $("#s");//分
                this.m = $("#m");//秒
                this.timer = setInterval(function () {
                    this.day.html(new ShowTime(this.time).init().days)
                    this.hours.html(new ShowTime(this.time).init().hours)
                    this.s.html(new ShowTime(this.time).init().mins);
                    this.m.html(new ShowTime(this.time).init().secs)
                }.bind(this), 1000)

                //推荐商品
                this.html5 = arr.content6.map(function (item) {
                    return `<li data-id="${item.id}">
                    <a href="###"><img src="../img/${item.images.split("&")[0]}" alt=""></a>
                    <p class="re_title">${item.title}</p>
                    <p class="re_price"><span>￥${item.now_price}</span> <span>￥${item.original_price}</span></p>
                </li>`
                }).join("");

                $(".recommed_box").html(this.html5);
                $("#big_img").html(this.html1);
                $("#small_img").html(this.html2);
                $("#r_title").html(this.html3);
                $("#t_ma").html(arr.content5[0].magges);
                $("#now_p").html(arr.content5[0].now_price);
                $("#original_p").html(arr.content5[0].original_price);
                $("#coupon").html("立省" + arr.content5[0].price_coupon + "元");
                $("#sales").html(arr.content5[0].sales);
                $("#storeName").html(arr.content5[0].storeName);
                $("#g_col").html(this.html4);
                this.glass();
                this.select();
            }.bind(this)
        })

    }

    Details.prototype.select = function () {

        $("#small_img").on("mouseenter", "li", function () {

            $("#im").attr("src", $(this).find("img").attr("src"))
        })

        $("#memory").on("click", "li", function () {
            $(this).addClass("active").siblings().removeClass("active")
        })
        var _this = this;
        $("#g_col").on("click", "li", function () {
            _this.isok = true;
            $(this).addClass("active").siblings().removeClass("active")
        })

        $(".recommed_box").on("click", "li", function () {
            var cid = $(this).attr("data-id");
            location.href = "goods.html?" + cid;
        })

        //减
        $(".goods_nums input").eq(0).click(function () {
            console.log(this.num)
            if (this.num <= 1) {
                $(this).off("click");

            } else {
                this.num--;
                $(".goods_nums input").eq(1).val(this.num);
            }

        }.bind(this))
        //加
        $(".goods_nums input").eq(2).click(function () {
            console.log(this.num)
            if (this.num >= 10) {
                $(this).off("click");
            } else {
                this.num++;
                $(".goods_nums input").eq(1).val(this.num);
            }
        }.bind(this))

    }

    Details.prototype.buy = function () {
        this.goods_buy = $("#goods_buy");

        this.goods_buy.click(function () {
            if (getCookie("u_name")) {
                if (this.isok) {
                    $.ajax({
                        type: "get",
                        url: "../api/lists_sort.php",
                        data: {
                            cid: this.c_id,
                            g_img: this.big_img[0],
                            original_p: this.original_p,
                            now_p: this.now_p,
                            title: this.g_title,
                            magges: this.b_magges,
                            color: $("#g_col .active").html(),
                            storeName: this.g_storeName,
                            goods_num: this.num,
                            time: this.time,
                            u_phone: getCookie("u_phone")
                        },
                        success: function (str) {
                            var arr = JSON.parse(str);
                            $(".car").show();
                            $(".close").click(function () {
                                $(".car").hide();
                            })
                            $(".car_buy input").click(function () {
                                $(".car").hide();
                                location.href = "car.html";
                            })
                            $(".car_buy a").click(function () {
                                $(".car").hide();
                                // console.log(1)
                                location.href = "../index.html";
                            })
                        }

                    })

                } else {
                    alert("请选择颜色")
                }
            } else {
                alert("请登录")
            }
        }.bind(this))


    }

    var datails = new Details();
    datails.init();


    function MessageDoard() {
        this.message = $("#y_mes");//留言信息
        this.sub_but = $("#sub");//提交
        this.x = $(".xing span");
        this.tozi = {
            1: 0,
            2: 0,
            3: 0,
            4: 0,
            5: 0,
            6: 0
        };
        this.isok = true;
    }
    MessageDoard.prototype.init = function () {
        this.xingxing();
        // console.log(this.message)    
        this.sub()
        this.xun("content3");
        this.choose();
    }

    //评价的选择
    MessageDoard.prototype.choose = function () {

        $("#good").click(function () {
            this.isok = false;
            this.xun("content6")
        }.bind(this))
        $("#comon").click(function () {
            this.isok = false;
            this.xun("content4")
        }.bind(this))
        $("#bar").click(function () {
            this.isok = false;
            this.xun("content5")
        }.bind(this))
        $("#all_eva").click(function () {
            this.isok = false;
            this.xun("content3")
        }.bind(this))
    }

    MessageDoard.prototype.xun = function (ele) {



        $.ajax({
            type: "get",
            url: "../api/mes_select.php",
            success: function (str) {
                var arr = JSON.parse(str);

                var html = arr[ele].map(function (item, i) {
                    var num = [];
                    if (this.isok) {
                        this.tozi[parseInt(item.xingxing)]++;
                    }
                    for (var i = 0; i < parseInt(item.xingxing); i++) {
                        num.push(i);
                    }
                    return `<li>
                <h3 class="x_ative">
                ${
                        num.map(function (item) {
                            return `<span class=""></span>`
                        }).join("")
                        }
        <img src="../img/zoler.jpg" alt="">
        <span class="m_name">${item.u_name}</span></h3>
                     <p class="m_content">${item.m_content}</p>
                     <p class="m_time">${item.m_time}</p>
                 </li>`
                }.bind(this)).join("");
                $(".board").html(html);

                $("#all_eva").next().children().eq(0).html(this.tozi[2] + this.tozi[1] + this.tozi[3] + this.tozi[4] + this.tozi[5] + this.tozi[6])
                $("#good").next().children().eq(0).html(this.tozi[5] + this.tozi[6]) //好评个数
                $("#comon").next().children().eq(0).html(this.tozi[3] + this.tozi[4])
                $("#bar").next().children().eq(0).html(this.tozi[2] + this.tozi[1])
                console.log(this.tozi)
            }.bind(this)
        })
    }
    //星星高亮
    MessageDoard.prototype.xingxing = function () {
        var _this = this;
        this.x_num = 0;
        $(".xing").on("click", "span", function () {
            for (var i = 0; i < $(this).index() + 1; i++) {
                $(".xing span").eq(i).addClass("xing_active");
                $(this).nextAll().removeClass("xing_active");
            }
            _this.x_num = $(this).index() + 1;
        })
    }

    //过滤信息
    MessageDoard.prototype.fuck = function (te) {
        var text = ["操", "MMP", "废物", "垃圾", "去你爸", "去你妈", "屌", "叼", "金三胖", "fuck"];
        text.forEach(function (item) {
            var reg = new RegExp(item, 'gi')
            te = te.replace(item, "***")
        })
        return te;
    }

    //提交
    MessageDoard.prototype.sub = function () {
        //过滤过的信息

        this.sub_but.click(function () {
            if (getCookie("u_name")) {
                var uer_name = getCookie("u_name");

                if (this.x.attr("class") == "xing_active") {
                    if (this.message.val() != "") {
                        this.isok = false;
                        this.guo_mes = this.fuck(this.message.val());
                        var time = new Date();
                        this.time = time.getFullYear() + "-" + time.getMonth() + "-" + time.getDate()
                        console.log(this.time)
                        $.ajax({
                            type: "get",
                            url: "../api/mes_board.php",
                            data: {
                                user_name: uer_name,
                                mes_content: this.guo_mes,
                                mes_num: this.x_num,
                                mes_time: this.time

                            },
                            success: function (str) {
                                this.xun("content3");
                                this.message.val("")
                                this.tozi[parseInt(this.x_num)]++;
                                $(".xing span").removeClass("xing_active")
                            }.bind(this)
                        })


                    } else {
                        alert("请写评语")
                    }
                } else {
                    alert("请点星星")
                }
            } else {
                alert("请登录")
            }
        }.bind(this))
    }
    var MDoard = new MessageDoard();
    MDoard.init();
})()

