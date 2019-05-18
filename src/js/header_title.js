; (function () {
    //引入header
    $("#header").load("html/head.html", function () {
        if (getCookie("u_name")) {
            var cooki = getCookie("u_name");
            // console.log(cooki)
            $(".h_name").html("<a href='###'>" + cooki + "</a>")
            $("#h_reg").attr("href", "###").css("color", "black").html("退出")
            $("#h_reg").click(function () {
                removeCookie("u_name");
                removeCookie("u_phone");
                $(".h_name").html(" Hi~欢迎来到Z商城，请<a href='html/login.html'>登录</a>")
                $("#h_reg").html("免费注册").attr("href", "html/login.html");
            });


        }
    });
    $("#title").load("html/title.html", function () {
        $(".classify").mouseenter(function () {
            $(".nav_cl").toggle().on("mouseenter", "li", function () {
                $(this).css("backgroundColor", "white").children().css("color", "black");
                $(this).siblings().css("backgroundColor", "#454545").children().css("color", "white");
            });

        })
        $(".m_car").click(function () {
            if (getCookie("u_name")) {
                location.href = "html/car.html?"
            } else {
                alert("请登录")
            }
        })

        $(".nav_cl").on("click", "li", function () {
            var type_name = $(this).attr("data-type");
            location.href = "html/list.html?" + type_name;
        })
        $(".classify").mouseleave(function () {
            $(".nav_cl").toggle();
        })

    });
})()