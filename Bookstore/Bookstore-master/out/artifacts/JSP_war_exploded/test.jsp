<%--
  Created by IntelliJ IDEA.
  User: jackdu
  Date: 12/10/18
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function add(){
            window.location.href="http://localhost:8080/addcart.jsp?id=1";
            alert("wocaonima")
            if(window.XMLHttpRequest){
                xmlhttp = new XMLHttpRequest();
            }else if(window.ActiveXObject){
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }else{
                alert("对象无法被构建");
            }

            username = document.getElementById("username").value;
            password = document.getElementById("password").value;

            xmlhttp.onreadystatechange = handchange;
            xmlhttp.open("POST","Servlet1?username="+username+"&password="+password,true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");  //设置的HTTP头
            xmlhttp.send("task=task&msg=msg");  //此处只是为了证明send()的使用方法，无意义
        }
    </script>
</head>
<body>

<input type="submit" onclick="add()" class="btn btn-primary" value="加入购物车">

</body>
</html>
