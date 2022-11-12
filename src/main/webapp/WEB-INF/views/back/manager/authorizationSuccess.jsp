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
                            <h1 class="text-dark">驗證成功</h1>
                                <p style="text-align:center;"class="mb-0">已發送重設密碼信件至您的email</p>
                                <p style="text-align:center;"class="mb-0 mt-2">請在24小時內重設密碼</p>
                                <div class="row my-0 mt-2">
                                    <div class="col d-flex" style="justify-content:center;">
                                        沒收到驗證信嗎?
                                        <a href="#"
                                           class="text-primary">重新發送</a>
                                    </div>

                                </div>
                            <div class="col d-flex mt-2" style="justify-content:center;">
                                <a href="${contextRoot}/manager/login" id="customer_register_link"
                                   class="text-primary">回到登入畫面</a>
                            </div>

                            </form>
                        </form:form>
                    </div>
                </div>
            </body>

            </html>