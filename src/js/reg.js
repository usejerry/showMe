$(function () {

    function Reg() {
        this.p_number = $("#p_number");//手机号
        this.img_code = $("#img_code");//拖拽验证
        this.p_code = $("#p_code");//验证输入框
        this.p_mes = $("#p_mes");//验证码
        this.pass = $("#pass");//密码
        this.con_pass = $("#con_pass");//确认密码
        this.sub = $("#sub");//提交注册
        this.f_agree = $("#f_agree");//同意框
        this.p_isok = false; //登录开光
        this.pass_isok = false;
        this.passTwo_isok = false;
        this.p_number_ms = false;
        this.ranNum = ''//随机验证码
        this.name = "zol_"; //随机名
        /* 拖拽验证 */
        this.box = $(".box");
        this.span1 = $(".box span").eq(0);
        this.span2 = $(".box span").eq(1);
        this.checkReg = {
            phone: function (str) {//验证手机号码
                var reg = /^1[3-9]\d{9}$/;
                return reg.test(str);
            },
            password: function (str) { //密码 
                var reg = /^\w{6,16}$/;
                return reg.test(str);;
            },
            phone_mes: function (str) { //手机验证码
                var reg = /^\d{4}$/;
                return reg.test(str);
            },
            con_pass: function (str) {
                var ps = $("#pass").val()
                if (str == ps) {
                    return true;
                } else {
                    return false;
                }
            }

        }
    }
    //初始化
    Reg.prototype.init = function () {
        console.log($("#p_code").parent().find("i"))

        this.img_code.click(function () {
            this.box.css('display', "block");
            this.img_code.css('display', 'none');
        }.bind(this))
        this.vill();
        //验证数据库是否存在
        this.p_number.blur(function () {
            $.ajax({
                type: "get",
                url: "../api/reg_select.php",
                data: {
                    user_phone: this.p_number.val()
                },
                success: function (str) {
                    if (str == 1) {
                        this.p_number.next().removeClass("ok").addClass("no").html("手机号已经注册")
                        this.p_mes_isok = false;
                    }
                }.bind(this)
            })
        }.bind(this))

        this.ranName();//生成随机名


        //判断手机验证码
        this.p_code.blur(function () {

            if (this.p_code.val() != "" && this.p_code.val() == this.ranNum) {
                this.p_code.next().removeClass("no").addClass("ok").html("")
                this.p_number_ms = true;
            } else {
                this.p_code.next().removeClass("ok").addClass("no").html("验证码不正确");
                this.p_number_ms = false;
            }
        }.bind(this))

        this.regExp(this.p_number, "phone", "请填写有效的11位手机号码", "请填写手机号码", "p_isok");
        this.regExp(this.pass, "password", "6-16位字符，可使用字母、数字或符号的组合", "请填写密码", "pass_isok")
        // this.regExp(this.p_code, "phone_mes", "", "请填写手机验证码")
        this.regExp(this.con_pass, "con_pass", "两次填写的密码不一致", "请填写确认密码", "passTwo_isok");
        //获取手机验证码
        this.p_mes_isok = true;
        this.p_mes.click(function () {
            if (!this.p_number.val() == "") {//不为空
                if (this.img_code.attr("data-nice")) {//是否图片验证
                    this.img_code.next().removeClass("no").addClass('ok').html(" ");
                    if (this.p_mes_isok) {//如果为true就执行
                        var time = 60;
                        //随机生成四位数字
                        for (var i = 0; i < 4; i++) {
                            this.ranNum += parseInt(Math.random() * 10);
                        }
                        console.log(this.ranNum)
                        $.ajax({
                            type: "get",
                            url: "../api/phoneMes.php",
                            data: {
                                mobile: this.p_number.val(),
                                tpl_id: 156985,
                                tpl_value: this.ranNum,
                                key: "eeed7cc6040dbde772969dce2b18cab8"
                            },
                            success: function (str) {

                            }
                        })
                        this.p_mes_isok = false;
                        this.p_mes.html(time)
                        var timer = setInterval(function () {
                            time--;
                            this.p_mes.html(time)
                            if (time == 0) {
                                clearInterval(timer);
                                this.ranNum = '';
                                this.p_mes_isok = true;
                                this.p_mes.html("获取验证码")
                            }
                        }.bind(this), 1000)
                    } else {
                        return false;
                    }
                } else {
                    this.img_code.next().removeClass("ok").addClass('no').html("请图片验证")
                }
            } else {
                this.p_number.next().removeClass("ok").addClass('no').html("请填写手机号")
            }
        }.bind(this))

        //注册
        this.sub.click(function () {
            // console.log(this.p_isok, this.p_number_ms, this.pass_isok, this.passTwo_isok)
            if (this.f_agree.prop('checked')) {
                if (this.p_isok && this.p_number_ms && this.pass_isok && this.passTwo_isok) {
                    this.sub.val("正在注册")
                    this.ranName();
                    this.p_mes.html("");
                    $.ajax({
                        type: "post",
                        url: "../api/reg_insert.php",
                        data: {
                            user_name: this.name,
                            user_phone: this.p_number.val(),
                            password: this.pass.val()
                        },
                        success: function (str) {
                            var u_name = setCookie("u_name", this.name);
                            var user_phone = setCookie("u_phone", this.p_number.val())
                            location.href = "../index.html?";
                            // console.log($("input").attr("data-nice"))
                            console.log(str);
                            $("p input").each(function (i, item) {
                                $(item).val("");
                                $(item).parent().find("i").removeClass("ok").html("");
                                if (i == 1) {
                                    $(item).val("点击按钮进行验证")
                                } else if (i == 6) {
                                    $(item).prop('checked', "flase");
                                } else if (i == 7) {
                                    $(item).val("注册");
                                }
                            })
                        }.bind(this)
                    })
                } else {
                    alert("请完善信息");
                }
            } else {
                alert("你还没同意")
            }
        }.bind(this))
    }

    Reg.prototype.ranName = function () {
        var arr = "123456789zxcvbnmasdfghjklqwertyuiop";
        for (var i = 0; i < 5; i++) {
            this.name += arr.charAt(parseInt(Math.random() * (arr.length - 1)));
        }
    }

    //图片拖拽验证
    Reg.prototype.vill = function () {
        this.span2.mousedown(function (ev) {
            console.log(1);
            var spanLeft = this.box.outerWidth() - this.span2.outerWidth();
            var boxLeft = this.box.offset().left;
            document.onmousemove = function (ev) {
                var sx = ev.clientX - boxLeft;
                if (sx < 0) {
                    sx = 0
                } else if (sx > spanLeft - 20) {
                    sx = spanLeft;
                    this.span1.html("成功");
                    this.img_code.css("display", "").val("验证成功").attr("data-nice", true);
                    this.img_code.next().removeClass("no").addClass('ok').html("");
                    this.box.css("display", "none");

                }
                this.span1.css('width', sx);
                this.span2.css('left', sx);
            }.bind(this)

            document.onmouseup = function () {
                var s2Left = parseInt(this.span2.css('left'))
                if (s2Left < spanLeft - 100) {
                    this.span2.css('left', 0);
                    this.span1.css('width', 0);
                } else if (s2Left > spanLeft - 20) {
                    this.span2.unbind('mousedown');
                }
                document.onmousemove = null;
            }.bind(this);
        }.bind(this))

    }

    //信息验证方法
    Reg.prototype.regExp = function (node, fun, mes1, mes2, is) {
        if (node.val() == '') {
            this.isok = false;
            node.attr("data-nice", false);
        }
        node.blur(function () {
            if (node.val() != '') {
                if (this.checkReg[fun](node.val())) {
                    node.next().removeClass("no").addClass("ok").html("");
                    node.attr("data-nice", true);
                    this[is] = true;
                } else {
                    node.next().removeClass("ok").addClass('no').html(mes1);
                    node.attr("data-nice", false);
                    this[is] = false;
                }
            } else {
                this[is] = false;
                node.next().removeClass("ok").addClass('no').html(mes2);
                node.attr("data-nice", false);
            }
        }.bind(this))
    }

    var reg_1 = new Reg();
    reg_1.init();
})
