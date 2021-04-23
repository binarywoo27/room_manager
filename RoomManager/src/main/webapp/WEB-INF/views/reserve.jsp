<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의실 예약하기</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<style>
body {
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
nav {
	float: left;
	width: 30%;
}
article {
	background-color: lightgray;
	padding: 20px;
	float: left;
	width: 70%;
}
h4 {
	font-size: 20px;
}
button.active {
	background-color: darkgray;
}
button:focus {
	background-color: darkgray;
	color: white;
}
button {
	background-color: white
}
/* .gray{
    background-color: white;
    color: black;
}
.highlight{
    background-color: darkgray;
    color: white;
} */
#lefttitle {
	color: #fff !important;
	background-color: #17a2b8 !important;
	padding: 7px;
	border-radius: 3px;
	margin-left: 150px;
}
table {
	width: 100%;
	border-collapse: collapse;
}
th {
	padding: 0 0 0 20px;
	text-align: left;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
}
td {
	padding: 0 0 0 20px;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
}
button {
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 10px;
	margin: 4px 2px;
	cursor: pointer;
}
button:disabled, button[disabled] {
	opacity: 0.3;
	cursor: not-allowed;
}
</style>

<body onload=showDate();>
	<header>
		<span style="font-weight: bold; font-size: 8pt; color: white"><span
			style="color: skyblue; font-weight: bold; font-size: 15pt">CS</span><span
			style='color: orange; font-weight: bold; font-size: 15pt'>EE</span>
			at Handong Global University </span>
	</header>

	<section>
		<nav
			class="w3-sidebar w3-collapse w3-white w3-bar-block w3-animate-left"
			style="left: 0px; top: 45px; z-index: 3; width: 300px;"
			id="mySidebar">
			<br>
			<!-- <span>Menu</span>
            <span>조회 및 예약하기</span> -->
			<span id="lefttitle">CSEE 강의실대여</span>
			<hr>
			<h3 class="w3-bar-item">Menu</h3>
			<a href="#" class="w3-bar-item w3-button"><i class="fa fa-home fa-fw"></i> Home</a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-eye fa-fw"></i> 조회 및 예약하기</a>
            
		</nav>
	</section>
	<div style="margin-left: 300px">
		<article>
			<div style="float: left; font-family: 'Noto Sans KR', sans-serif">
				<span>예약 정보 입력 </span>
				<form action="addok" method="post">
					<table style="background-color: white; width: 490px;">
						<tbody>
							<tr>
								<td>장소</td>
								<td><input type="text" name="place" value="뉴턴 220호" /></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" value="이진우학부생" /></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email"
									value="21400603@handong.edu" /></td>
							</tr>
							<tr>
								<td>관련 교수*</td>
								<td><input type="text" name="professor"
									placeholder="ex) 용환기 교수님"></td>
							</tr>
							<!-- <tr>
								<td>학부</td>
								<td>
								<select name="department">
									<option value="글로벌리더십학부">글로벌리더십학부</option>
									<option value="국제어문학부">국제어문학부</option>
									<option value="경영경제학부">경영경제학부</option>
									<option value="법학부">법학부</option>
									<option value="언론정보문화학부">언론정보문화학부</option>
									<option value="공간환경시스템학부">공간환경시스템학부</option>
									<option value="기계제어공학부">기계제어공학부</option>
									<option value="콘텐츠융합디자인학부">콘텐츠융합디자인학부</option>
									<option value="생명과학부">생명과학부</option>
									<option value="전산전자공학부" selected>전산전자공학부</option>
									<option value="상담심리사회복지학부">상담심리사회복지학부</option>
									<option value="ICT창업학부">ICT창업학부</option>
									<option value="창의융합교육원">창의융합교육원</option>
								</select>
								</td>


							</tr>
							<tr>
								<td>예약 가능한 기간</td>
								<td><span id="datetime"></span></td>
							</tr>
							<tr>
								<td>날짜 *</td>
								<td><input type='date' id='reserve_date' name='reserve_date' />
								</td>
								<script>
                                    document.getElementById('reserve_date').value = new Date().toISOString().substring(0, 10);;
                                </script>
							</tr>
							<tr>
								<td>시작 시간</td>
								<td><select id="reserve_time" name='start_time'>
										<option value="" id='currentTime' ></option>
								</select> <input type='text' id='currentTime' name='currentTime'/>
								</td>
							</tr>
							<tr>
								<td>종료 시간</td>
								<td><select id="end_time" name='end_time'>
										<option value="" id='endTime' ></option>
								</select> <input type='text' id='currentTime' name='currentTime'/>
								</td>
							</tr>
							<tr>
								<td>목적 *</td>
								<td><input type="text" name="purpose"></td>
							</tr>
							<tr>
								<td>연락처 *</td>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<td>추가사항</td>
								<td><textarea cols="25" rows="2" name="information" placeholder="예상 인원, 구체적인 활동 내용 등"></textarea></td>
							</tr> -->

						</tbody>
					</table>




					<br>
					<h3>개인정보 수집·이용·제공 동의</h3>
					<textarea readonly="readonly" cols="59" name="terms"
						style="height: 100px;">한동대학교 전산전자공학부는 귀하께서 한동대학교 CSEE 강의실 예약 사이트의 이용약관의 내용에 대해 「동의한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여, 「동의한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 간주합니다.

                ※ 본 서비스(사이트)는 만 14세 미만의 아동에 대한 개인정보를 수집하고 있지 않으며, 홈페이지에 아동에게 유해한 정보를 게시하거나 제공하고 있지 않습니다.
                
                한동대학교 CSEE 강의실 예약 사이트는 회원가입 시 서비스 이용을 위해 필요한 최소한의 개인정보만을 수집합니다.
                귀하가 한동대학교 CSEE 강의실 예약 사이트의 서비스를 이용하기 위해서는 회원가입 시 (이름, 휴대폰번호, E-mail 주소, 학번, 학부)를 필수적으로 입력하셔야 합니다.
                개인정보 항목별 구체적인 수집목적 및 이용목적은 다음과 같습니다.
                
                - 성명, 이메일주소 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용
                - 이메일주소, 전화번호 : 고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보, 새로운 서비스 및 뉴스, 이벤트 정보 등의 안내
                
                - 휴대폰번호 : 뉴스 및 이벤트 정보 전달을 위한 확보
                
                - 기타 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료
                
                
                □ 수집하는 개인정보 항목
                ① 필수 개인정보 항목
                이름, 휴대폰번호,  E-mail 주소, 학번, 학부
                
                
                □ 개인정보의 보유기간 및 이용기간
                한동대학교 CSEE 강의실 예약 사이트는 수집된 개인정의 보유기간은 회원가입 하신후 해지(탈퇴신청등)시까지 입니다. 또한 해지시 한동대학교 CSEE 강의실 예약 사이트는 회원님의 개인정보를 재생이 불가능한 방법으로 즉시 파기하며 (개인정보가 제3자에게 제공된 경우에는 제3자에게도 파기하도록 지시합니다.) 다만 다음 각호의 경우에는 각 호에 명시한 기간동안 개인정보를 보유합니다.
                
                ① 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유함
                
                ② 보유기간을 회원님에게 미리 고지하고 그 보유기간이 경과하지 아니한 경우와 개별적으로 회원님의 동의를 받을 경우에는 약속한 보유기간 동안 보유함
                
                □ 동의 거부 권리 및 동의 거부 시 불이익 내용
                귀하는 개인정보의 수집목적 및 이용목적에 대한 동의를 거부할 수 있으며, 동의 거부시 한동대학교 CSEE 강의실 예약 사이트에 회원가입이 되지 않으며, 한동대학교 CSEE 강의실 예약 사이트에서 제공하는 제한적인 서비스를 이용할 수 없습니다.
                
            </textarea>
					<br> <input type="checkbox" id="tickbox"
						onClick="showButton(this)"> <label for="tickbox">
						약관에 동의하시겠습니까? </label> <br>
					<!-- <button type="button" id="btn1" style="background-color: #008CBA;" value="에약하기"> 예약하기 </button>
            <button type="button" class="button" style="background-color: #f44336;"> 취소하기 </button>
             -->
					<div style="float: right">
						<!-- <input type="button" class="button" id="btn1" style="background-color: #008CBA;" value="에약하기" disabled />
                <button type="button" class="button" style="background-color: #f44336;"> 취소하기 </button> -->
						<button type="submit" class="button" id="btn1"
							style="background-color: #008CBA;" disabled>예약하기</button>
						<button type="button" class="button"
							style="background-color: #f44336;">취소하기</button>
					</div>
				</form>
			</div>


			<br>
			<br>
			<div style="float: left;">© 2019 한동대학교 전산전자공학부</div>

		</article>
	</div>

</body>
<script>
    //document.getElementById('btn1').setAttribute("disabled","disabled");
    function showButton(box){
        if(box.checked == true) {
            document.getElementById("btn1").disabled = false;
        }
        else {
            document.getElementById("btn1").disabled = true;
        }
    } 
    function showDate() {
        var n = new Date();
        var y = n.getFullYear();
        var m = n.getMonth()+1;
        var d = n.getDate();
        document.getElementById("datetime").innerHTML= y +"-"+ m +"-"+ d +" ~ "+ "2021-06-18";
    }
    var today = new Date();
    var min = today.getMinutes();
    if(min <= 30){
        document.getElementById('currentTime').innerHTML = today.getHours()+":"+"30";
        document.getElementById('endTime').innerHTML = today.getHours()+1+":"+"00";
        document.getElementById('currentTime').value = today.getHours()+":"+"30";
        document.getElementById('endTime').value = today.getHours()+1+":"+"00";
    }
    else{
        document.getElementById('currentTime').innerHTML = today.getHours()+1+":"+"00";
        document.getElementById('endTime').innerHTML = today.getHours()+1+":"+"30";
        document.getElementById('currentTime').value = today.getHours()+1+":"+"00";
        document.getElementById('endTime').value = today.getHours()+1+":"+"30";
    }
</script>
</html>