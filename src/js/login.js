$(function () {

    function A_Login() {
        this.teg_rote1 = $(".l_nav");//切换角色
        this.role1 = $("#role1");
        this.l_phone = $("#l_phone2 input");//手机号
        this.l_pas = $("#l_pas2 input");//密码
        this.l_but = $("#l_but input");//登录
        this.l_but2 = $("#l_but2 input")//手机验证登录
        this.isOk = false;
        this.dynamic = $("#dynamic");
        this.l_p_code = $("#l_p_code");//手机验证输入框
        this.l_p_mes = $("#l_p_mes");//获取验证
        this.l_p_mes_isok = true;//验证开关
        this.ranNum = ''//随机验证码
        this.l_p_number = $("#l_p_number");
    }
    A_Login.prototype.init = function () {
        this.teg();
        this.u_phone();
        this.but();
        // console.log($("#m3").css("display"))
        this.u_pass()
        this.code();
    }
    A_Login.prototype.teg = function () {
        //切换角色
        this.teg_rote1.on("click", "span", function () {

            if ($(this).html() == $("#role1").html()) {
                $(this).parent().parent().toggleClass("hide");
                // // $("#login_m3").addClass("hide");

                $("#m2").toggleClass("hide");
            }
            if ($(this).html() == $("#role2").html()) {
                $(this).parent().parent().toggleClass("hide");
                $("#m1").toggleClass("hide");
            }
        })


        this.dynamic.click(function () {

            $("#m1").addClass("hide");
            $("#m2").addClass("hide");
            $("#m3").removeClass("hide");
            // console.log($("#m3").css("display"))
        })
    }

    //手机输入
    A_Login.prototype.u_phone = function () {
        this.l_phone.blur(function () {
            // console.log(this.isOk)
            if ($("#l_phone2 input").val() == "") {
                this.isOk = false;
            } else {
                this.isOk = true;
            }
        }.bind(this))
    }
    //密码输入
    A_Login.prototype.u_pass = function () {
        this.l_pas.blur(function () {
            // console.log(this.isOk)
            if ($("#l_pas input").val() == "") {
                this.isOk = false;
            } else {
                this.isOk = true;
            }
        }.bind(this))
    }

    //短信验证登录
    A_Login.prototype.code = function () {
        this.l_p_mes.click(function () {
            if (this.l_p_number.val() != "") {

                if (this.l_p_mes_isok) {//如果为true就执行
                    var time = 60;
                    this.isOk = true;
                    console.log(this.l_p_mes_isok);
                    this.l_p_mes_isok = false;
                    //随机生成四位数字
                    for (var i = 0; i < 4; i++) {
                        this.ranNum += parseInt(Math.random() * 10);
                    }
                    console.log(this.ranNum);
                    $.ajax({
                        type: "get",
                        url: "../api/phoneMes.php",
                        data: {
                            mobile: this.l_p_number.val(),
                            tpl_id: 156985,
                            tpl_value: this.ranNum,
                            key: "eeed7cc6040dbde772969dce2b18cab8"
                        },
                        success: function (str) {

                        }
                    })


                    this.l_p_mes.html(time)
                    var timer = setInterval(function () {
                        time--;
                        this.l_p_mes.html(time)
                        if (time == 0) {
                            clearInterval(timer);
                            this.ranNum = '';
                            this.l_p_mes_isok = true;
                            this.l_p_mes.html("发送验证码")
                        }
                    }.bind(this), 1000)
                } else {
                    return false;
                }
            } else {
                this.l_p_mes_isok = false;
            }
        }.bind(this))
    }
    //登录按键
    A_Login.prototype.but = function () {
        this.l_but.click(function () {
            if (this.isOk) {
                $.ajax({
                    type: "get",
                    url: "../api/login.php",
                    data: {
                        user_pass: $("#l_pas2 input").val(),
                        user_phone: $("#l_phone2 input").val()
                    },
                    success: function (str) {
                        console.log(str)
                        var arr = JSON.parse(str);
                        console.log(arr);
                        var u_name = setCookie("u_name", arr[0].user_name);
                        var u_phone = setCookie("u_phone", $("#l_phone2 input").val())
                        location.href = "../index.html?";
                    }.bind(this)
                })
            }
        }.bind(this))

        this.l_but2.click(function () {
            var ranNum = "zol_";
            if (this.isOk) {
                // console.log(this.l_phone)
                if (this.l_p_code.val() == this.ranNum) {
                    $.ajax({
                        type: "get",
                        url: "../api/reg_select.php",
                        data: {
                            user_phone: $("#l_p_number").val()
                        },
                        success: function (str) {

                            if (str == 1) {
                                var u_name = setCookie("u_name", ranNum);
                                var u_phone = setCookie("u_phone", $("#l_p_number").val())
                                location.href = "../index.html?";
                            } else {
                                alert("还没注册")
                                location.href = "reg.html?"
                            }
                        }.bind(this)
                    })


                } else {
                    alert("登录失败")
                }
            }
        }.bind(this))
    }


    var a_login = new A_Login();
    a_login.init();
})