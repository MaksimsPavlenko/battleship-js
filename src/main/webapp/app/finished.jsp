<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: maxim.pavlenko01
  Date: 8/17/2018
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Title</title>


<style>
    table {
        border-collapse: collapse;
    }
    td {
        border-width: 1px;
    }
    td.SHIP {
        background-color: black;
    }
    td.MISS {
        background-color: aqua;
    }
    td.HIT {
        background-color: red;
    }
</style>
</head>
<body onload="checkStatus()">


<h1>The End</h1>
<div id="win" class="w3-hide">
    <h1>You win!</h1>
</div>
<div id="lose" class="w3-hide">
    <h1>You lose!</h1>
</div>
<button type="button" onclick="logout()">Log out</button>
<button type="button" onclick="startGame()">Start Game</button>

<script>

     function checkStatus() {
        console.log("checking status");
        fetch("<c:url value='/api/game/status'/>", {
            "method": "GET",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(function (response) {
            return response.json();
        }).then(function (game) {
            console.log(JSON.stringify(game));
            if (game.playerActive) {
                document.getElementById("lose").classList.add("w3-hide");
                document.getElementById("win").classList.remove("w3-hide");
            } else if (!game.playerActive) {
                document.getElementById("lose").classList.remove("w3-hide");
                document.getElementById("win").classList.add("w3-hide");
            }
        });

    }




    function logout() {
        fetch("<c:url value='/api/auth/logout'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/";
            });
    }

    function startGame() {
        fetch("<c:url value='/api/game'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/app/placement.jsp";
            });
    }


</script>


</body>
</html>
