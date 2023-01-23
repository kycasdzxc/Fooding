<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- 제이쿼리구문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- 부트스트랩 링크3개 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .outer {width: 1200px; margin:auto;}
    /* 회원가입 문구 */
    .enroll-head {text-align: center; padding-top: 100px;}
    .enroll-head h2 {font-weight:600; color:rgb(83, 83, 83);}
    /* 필수사항입력 */
    .required {width:700px; height:30px; margin:auto; text-align:right;}
    #required {color: rgb(247, 51, 51);}
    /* 라인 */
    .line { width:700px; height:0.5px; margin-top:1px; background-color:rgb(83, 83, 83);}
    /* form */
    .enroll-form { width: 700px; height:1200px; margin: auto;}

    /* 첫번째 칸 */
    th {width:25%; height:80px; text-align: right; padding-right:10px;}
    /* 두번째 칸 input */
    .input-area2 {width:50%;}
    .input-area2 input {width:380px; height:40px; margin:20px; font-size:small; padding-left:10px;}
    .gender-area input {margin:20px;}
    .gender-area {font-weight:600;}
    .birth-area input {margin:20px; width:80px; padding-left:20px; font-weight:600;}
    .check-terms input {margin:20px 10px 0px 20px;}
    /* 세번째 칸 */
    .input-area3 {width:20%;}
    .input-area3-phone button {margin-left:5px;}
    .input-area3-id button, .input-area3-nickname button { margin-left:5px; width:125px;}
    .terms {height: 120px;}
    .terms div {padding-left:20px; margin-top:-10px;}
    .terms a {color:black; text-decoration:none; font-weight:600; font-size:14px;}
    /*  가입버튼 */
    #enroll-btn input {width:160px; height:50px;}

</style>
                                                                                                                                                                                                                                                                                                               
</head>
<body>
    <div class="outer">

        <div class="enroll-head"><h2>회원가입</h2></div>
            
            <div class="required"><span id="required">*</span> 필수사항입력</div>
            <hr class="line">
            <div class="enroll">

                <form action="" method="post" class="enroll-form">
                    
                    <table class="table1">
                        <tr>
                            <th>아이디 <span id="required">*</span></th>
                            <td class="input-area2"><input type="text" size="55" name="userId" placeholder="아이디를 입력해주세요" required></td>
                            <td class="input-area3-id"><button type="button" class="btn btn-danger">중복확인</button></td>
                        </tr>
                        <tr>
                            <th>비밀번호 <span id="required">*</span></th>
                            <td class="input-area2"><input type="password" size="55" name="userPwd" maxlength="15" placeholder="비밀번호를 입력해주세요" required></td>
                            <td class="input-area3"></td>
                        </tr>
                        <tr>
                            <th>비밀번호확인 <span id="required">*</span></th>
                            <td class="input-area2"><input type="password" size="55" maxlength="15" placeholder="비밀번호를 한 번 더 입력해주세요" required></td>
                            <td class="input-area3"></td>
                        </tr>
                        <tr>
                            <th>이름 <span id="required">*</span></th>
                            <td class="input-area2"><input type="text" size="55" name="userName" maxlength="10" placeholder="이름을 입력해주세요" required></td>
                            <td class="input-area3"></td>
                        </tr>
                        <tr>
                            <th>닉네임 <span id="required">*</span></th>
                            <td class="input-area2"><input type="text" size="55" name="nickname" placeholder="닉네임을 입력해주세요" required></td>
                            <td class="input-area3-nickname"><button type="button" class="btn btn-danger">중복확인</button></td>
                        </tr>
                        <tr>
                            <th>이메일 <span id="required">*</span></th>
                            <td class="input-area2"><input type="email" size="55" name="email" placeholder="예:fooding@fooding.com"></td>
                            <td class="input-area3"></td>
                        </tr>
                        <tr>
                            <th>휴대폰 <span id="required">*</span></th>
                            <td class="input-area2"><input type="text" size="55" name="phone" placeholder="숫자만 입력해주세요"></td>
                            <td class="input-area3-phone"><button type="button" class="btn btn-danger">인증번호 받기</button></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td class="input-area2"><input type="text" size="55"></td>
                            <td class="input-area3-phone"><button type="button" class="btn btn-danger">인증번호 확인</button></td>
                        </tr>
                        <tr>
                            <th>성별&nbsp;&nbsp;&nbsp; </th>
                            <td class="gender-area">
                                <input type="radio" style="width:17px; height:17px;" name="gender" value="M">남자
                                <input type="radio" style="width:17px; height:17px;" name="gender" value="W">여자
                                <input type="radio" style="width:17px; height:17px;" name="gender" value="N">선택안함
                            </td>
                            <td class="input-area3"></td>
                        </tr>
                        <tr>
                            <th>생년월일&nbsp;&nbsp;&nbsp; </th>
                            <td class="birth-area" width="500px">
                                <input type="text" size="10" value="YYYY" width="">
                                <span>/</span>
                                <input type="text" size="10" value=" MM">
                                <span>/</span>
                                <input type="text" size="10" value=" DD">
                            </td>
                            <td class="input-area3"></td>
                        </tr>
                        <tr>
                            <th id="term2"><span id="terms">이용약관동의 </span><span id="required">*</span></th>
                            <td class="check-terms">
                                <input type="checkbox" style="width:17px; height:17px;"><b>전체 동의합니다</b><br>
                                <input type="checkbox" style="width:17px; height:17px;">이용약관 동의(필수)<br>
                                <input type="checkbox" style="width:17px; height:17px;">개인정보 수집 이용동의 (필수)<br>
                                <input type="checkbox" style="width:17px; height:17px;">본인은 만 14세이상입니다 (필수)<br>
                                <input type="checkbox" style="width:17px; height:17px;">프로모션 할인 쿠폰 등 혜택/정보 수신 동의 (선택)<br>
                            </td>
                            <td>
                                <div class="terms">
                                    <br>
                                    <div><a href="">약관보기 ></a></div>
                                    <br>
                                    <div><a href="">약관보기 ></a></div>
                                </div>
                            </td>
                        </tr>
                       
                    </table>
                    <br><br>
                    <div align="center" id="enroll-btn">
                        <input type="submit" class="btn btn-danger" value="가입하기">
                    </div>
                    <br><br>

                
                </form>
             
            </div>      
        
        </div>
         
    </div>
</body>
</html>