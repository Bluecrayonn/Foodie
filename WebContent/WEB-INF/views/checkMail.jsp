<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>



<script>

    function checkMail() {

        var email = document.getElementById("email").value;

 

        if (email == "") {

            alert("메일을 입력해 주세요.")

            return false;

        }

 

        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {

            if (xhttp.readyState == 4) {

                var data = JSON.parse(xhttp.responseText);

                if (data != null) {

                    alert("이미 가입한 메일 입니다.");

                    $("#joincode").css("display", "none");

                } else {

                    sendMail(email);

                    $("#joincode").css("display", "");

                }

            }

        };

        xhttp.open("POST", 'checkMail/', true);

        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

        xhttp.send('email=' + email);

        return false;

    }

 

    function sendMail(email) {

        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {

            if (xhttp.readyState == 4) {

                if (xhttp.status == 200)

                    alert("메일을 정상적으로 보냇습니다.");

                else

                    alert("올바른 메일 형식이 아닙니다.");

            }

        };

        xhttp.open("POST", 'sendMail/', true);

        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

        xhttp.send('email=' + email);

        return false;

    }

</script>





</head>
<body>

</body>
</html>