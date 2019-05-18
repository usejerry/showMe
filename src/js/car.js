; (function () {
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
                $("#h_reg").html("免费注册").attr("href", "html/login.html");
            });
        }
    });
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

    //购物车
    function Car() {
        this.car_goods = $(".car_goods");
        this.all_p = 0;
        this.goo_num = 0;
    }

    Car.prototype.init = function () {
        this.apply();
        //购物车的数量
        $.ajax({
            type: 'get',
            url: "../api/car.php",
            data: {
                u_phone: getCookie("u_phone")
            },
            success: function (str) {
                var arr = JSON.parse(str);
                $(".h_right .c_nums").html(arr.content.length)
                $(".state .car_nums").html(arr.content.length)
            }
        })
        // setInterval(this.apply.bind(this), 1000)
    }
    Car.prototype.apply = function () {
        var obj = {};
        var ojb_cid = {}
        var ojb_num = {};
        var time = [];
        $.ajax({
            type: "get",
            url: "../api/car.php",
            data: {
                u_phone: getCookie("u_phone")
            },
            success: function (str) {
                var arr = JSON.parse(str);
                arr.content.forEach(function (item) {
                    if (!obj[item.storeName]) {
                        obj[item.storeName] = 1;
                        var html = `<h3 class="stort">
                        <input type="radio" name="" id="">店铺：<a href="###">${item.storeName}</a>
                        <span><img src="../img/tag-security.png" alt=""></span>
                        <span><img src="../img/button_121.gif" alt=""></span>
                    </h3>
                    <ul>`
                        $.ajax({
                            type: "get",
                            url: "../api/car.php",
                            data: {
                                storeName: item.storeName,
                                u_phone: getCookie("u_phone")
                            },
                            success: function (str) {

                                var arr = JSON.parse(str);
                                html += arr.content2.map(function (item, i) {
                                    var s = new ShowTime(item.buy_time).init().secs;
                                    time.push(item.buy_time)

                                    if (!ojb_cid[item.c_id]) {
                                        ojb_cid[item.c_id] = 1;
                                        ojb_num[item.c_id] = item.sale_num;

                                        return ` <li data-id="${item.c_id}">
                                    <div class="g_left">
                                        <input type="checkbox" class="select">
                                        <a href="goods.html?${item.c_id}" id="g_img"><img src="../img/${item.images.split("&")[0]}" alt=""></a>
                                        <h4>
                                            <p class="g_title"><a href="goods.html?${item.c_id}">${item.title}</a></p>
                
                                            <span></span>
                                            <p class="color">颜色：${item.color}</p>
                                            <p>套装：官方标配</p>
                                        </h4>
                                    </div>
                                    <h3 class="g_price">
                                        <p>${item.original_price}</p>
                                        <p>${item.now_price}</p>
                                    </h3>
                                    <h3 class="up">
                                        <input type="button" value="-" class="prve">
                                        <input type="text" value="" class="text">
                                        <input type="button" value="+" class="add">
                                    </h3>
                                    <h3 class="g_time">
                                        <p><img src="../img/group.png" alt=""></p>
                                        <p>
                                            <span class="hours"></span>小时
                                            <span class="m"></span>分
                                            <span class="s">${s}</span>秒
                                        </p>
                                    </h3>
                                    <h3 class="x_price">
                                         ${item.sale_num * item.now_price}
                                    </h3>
                                    <h3 class="favorite">
                                        <a href="###" >移入收藏夹</a>
                                        <a href="###" class="remove">删除</a>
                                    </h3>
                
                                </li>  `

                                    } else {

                                        ojb_num[item.c_id] = parseInt(ojb_num[item.c_id]) + item.sale_num * 1

                                        // console.log(ojb_num[item.c_id], i)

                                    }
                                }).join("");
                                // console.log($(".hours"))
                                html += "</ul>"

                                $(".car_goods").html($(".car_goods").html() + html)
                                // console.log($(".car_goods li"))

                                for (var i = 0; i < $(".car_goods li").size(); i++) {
                                    // console.log(ojb_num[$(".car_goods li").eq(i).attr("data-id")])
                                    // console.log(i)
                                    $(".car_goods .text").eq(i).val(ojb_num[$(".car_goods li").eq(i).attr("data-id")])
                                }




                                setInterval(function () {
                                    for (var i = 0; i < $(".hours").size(); i++) {
                                        $(".hours").eq(i).html(new ShowTime(time[i]).init().hours);
                                        $(".m").eq(i).html(new ShowTime(time[i]).init().mins);
                                        $(".s").eq(i).html(new ShowTime(time[i]).init().secs);
                                    }
                                }, 1000)
                            }.bind(this)


                        })

                    }


                }.bind(this))
                this.show();
            }.bind(this)
        })
    }

    Car.prototype.show = function () {

        //加
        this.car_goods.on("click", ".add", function () {
            var num = parseInt($(this).prev().val())
            if (num >= 100) {
                $(this).off("click");
            } else {
                num++;
                // console.log(parseInt(this.price.html()) * this.num)
                $(this).parent().next().next().html(parseInt($(this).parent().prev().children().eq(1).html()) * num);
                $(this).prev().val(num)
            }
        })



        //减
        this.car_goods.on("click", ".prve", function () {
            var num = parseInt($(this).next().val())
            if (num <= 1) {
                $(this).off("click");
            } else {
                num--;
                $(this).parent().next().next().html(parseInt($(this).parent().prev().children().eq(1).html()) * num);
                $(this).next().val(num);
            }

        })
        //提够
        var _this = this;

        this.car_goods.on("click", ".select", function () {
            var all = $(this).parent().parent().parent().children().size() / 2;

            var gp = $(this).parent().next().children().eq(1).html() * $(this).parent().next().next().children().eq(1).val()
            if ($(this).prop("checked")) {
                _this.all_p += gp * 1;
                $(".all_price").html("￥" + _this.all_p)
                $(".t_zong").html("￥" + _this.all_p)
                $(this).parent().parent().parent().prev().children().eq(0).prop("checked", true)

            } else {
                _this.all_p -= gp * 1;
                $(".all_price").html("￥" + _this.all_p)
                $(".total .t_zong").html("￥" + _this.all_p)
                $(this).parent().parent().parent().prev().children().eq(0).prop("checked", false)
            }


        })
        //删除商品
        this.car_goods.on("click", ".remove", function () {
            if ($(this).parent().parent().parent().children().size() <= 1) {
                $(this).parent().parent().parent().prev().remove();
                $(this).parent().parent().remove();

            } else {
                $(this).parent().parent().remove();

            }
            $.ajax({
                type: "get",
                url: "../api/car.php",
                data: {
                    c_id: $(this).parent().parent().attr("data-id")
                },
                success: function (str) {
                    var arr = JSON.parse(str);



                }
            })


        })
        //点击跳转

    }

    var car = new Car();
    car.init();

})()