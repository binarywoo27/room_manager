<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<style>
body{
    margin: 0;
    background-color: lightgray;
}
header {
    background-color: black;
    height: 45px; 
    text-align: right;
    padding: 10px 15px 10px 0;
    left: 0px; 
}
header::before {
   box-sizing: none;
}
nav{
    float: left;
    width: 30%;
}
article{
    background-color: lightgray;
    padding: 31px;
    float:left;
    width:70%;
}
h4{
    font-size:20px;
}
button.active{
    background-color: darkgray;
}
button:focus{
    background-color: darkgray;
    color: white;
}
button{
    background-color:white
}
/* .gray{
    background-color: white;
    color: black;
}
.highlight{
    background-color: darkgray;
    color: white;
} */
#lefttitle{
    color: #fff!important;
	background-color: #17a2b8!important;
    padding: 7px;
    border-radius: 3px;
    margin-left: 150px;
}
</style>

<body>
    <header>
        <span style="font-weight:bold; font-size:8pt; color:white"><span style="color:skyblue; font-weight:bold;font-size:15pt">CS</span><span style='color:orange;font-weight:bold;font-size:15pt'>EE</span> at Handong Global University </span>
    </header>
    
    <section>
        <nav class="w3-sidebar w3-collapse w3-white w3-bar-block w3-animate-left" style="left: 0px; top: 45px; z-index:3; width:300px;" id="mySidebar"><br>
            <!-- <span>Menu</span>
            <span>조회 및 예약하기</span> -->
            <span id="lefttitle">CSEE 강의실대여</span>
            <hr>
            <h3 class="w3-bar-item">Menu</h3>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-home fa-fw"></i> Home</a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-eye fa-fw"></i> 조회 및 예약하기</a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-calendar-check"></i> 내가 예약한 강의실</a>
            
        </nav>
    </section> 
    <div style="margin-left:300px">
        <article>
            <h4>조회/예약하기</h4>
            <button id="first">뉴턴 220호</button>
            <button>뉴턴 310호</button>
            <button>뉴턴 313호</button>
            <button>뉴턴 412호</button>
            <button>뉴턴 413호</button>
            <button>뉴턴 414호</button>
            <button>뉴턴 417호</button>
        </article>
    </div>

    
    <script>
        // function showInfo(id){
        //     var buttons = document.querySelectorAll("button");
        //     for(button in buttons){
        //         buttons[button].onclick = function() {
        //             buttons.forEach(function(btn){
        //                 btn.classList.remove('highlight');
        //             })
        //             this.classList.add('highlight');
        //         }
        //     }
        //     // // document.getElementById("btn1").innerHTML = "뉴톤꺼정";
        //     // if(document.getElementById(id).style.backgroundColor=="white"){
        //     //     document.getElementById(id).style.backgroundColor = "darkgray";
        //     //     document.getElementById(id).style.color = "white";
        //     // }
        //     // else {
        //     //     document.getElementById(id).style.backgroundColor = "white";
        //     //     document.getElementById(id).style.color = "black";
        //     //
        // }
        
    </script>
    <div style="margin-left:300px; padding: 31px;">
    
    <table width="90%">
    	<tr>
    		<td> 장소 </td>
    		<td> 이름 </td>
    		<td> 이메일 </td>
    	</tr>
    	<c:forEach items="${list}" var="u">
    		<tr>
    			<td>
    				${u.place }
    			</td>
    			<td>
    				${u.name }
    			</td>
    			<td>
    				${u.email }
    			</td>
    			
    		</tr>
	    
     	</c:forEach>
    
    </table>
    
    
    </div>
    
    
</body>
</html>