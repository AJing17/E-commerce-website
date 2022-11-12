<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>忘記密碼</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <!-- <link href="${contextRoot}/css/register.css" rel="stylesheet"> -->

                <link href="${contextRoot}/datePick/css/charliecss.css" rel="stylesheet">
                <style>

                    #login-inside{
                        background-color: #F1EDE6;
                        box-shadow: gray 3px 3px 3px;
                    }
                    #login-inside .row input[type=submit]{
                        width: 50%;
                        background-color: #cfa98d;
                    }
                </style>
            </head>

            <body>
                <div id="login-box" class="container">
                    <div class="container" id="login-inside">
                        <form:form method="post" modelAttribute="manager">
                            <h1 class="text-dark">忘記密碼</h1>
                                <p style="text-align:center;"class="mb-0">請輸入email及手機號碼</p>
                            <p style="text-align:center;" class="mt-0">驗證成功將發送重設密碼信件至您的信箱</p>
                                <h5 class="Msg">${msg}</h5>

                                <div class="row">
                                    <div class="col">
                                        <div>
                                            <input type="email" class="text-field" name="email" id="email"
                                                placeholder="電子郵件" inputmode="email" autocorrect="off"
                                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required="required"
                                                oninput="setCustomValidity('');"
                                                oninvalid="setCustomValidity('請輸入正確的email 例：abc@gmail.com')">
                                        </div>
                                    </div>
                                </div>


                                <div class="row" style="margin-bottom: 0.5rem;">
                                    <div class="col">
                                        <div>
                                            <input type="tel" class="text-field" name="phone" id="phone"
                                                placeholder="手機號碼" inputmode="tel" autocorrect="off" required="required"
                                                maxlength="10" pattern="09\d{2}\d{6}" oninput="setCustomValidity('');"
                                                oninvalid="setCustomValidity('請輸入正確的手機號碼格式：09xxxxxxxx');">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col d-flex" style="justify-content:center ;">
                                        <input type="submit" class="btn-primary text-dark" id="btn-login" value="提交">
                                        <!-- onclick="myFunction()">提交</a> -->
                                        <!--                  <script> -->
                                        <!-- //                     function myFunction() { -->

                                        <!-- //                         alert("已向您發送一封電子郵件，點擊其中的鏈接以便更新您的密碼。"); -->
                                        <!-- //                         location.href = "login.html" -->
                                        <!-- //                     } -->
                                        <!--                  </script> -->
                                    </div>
                                </div>
                                <div class="row my-0">
                                    <div class="col d-flex" style="justify-content:center;">
                                        <a href="${contextRoot}/manager/login" id="customer_register_link"
                                            class="text-primary">取消</a>
                                    </div>
                                </div>

                            </form>
                        </form:form>
                    </div>
                </div>
            </body>

            </html>