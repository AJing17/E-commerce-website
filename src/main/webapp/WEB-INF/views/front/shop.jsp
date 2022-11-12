<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Chezmoi</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="Free HTML Templates" name="keywords">
                <meta content="Free HTML Templates" name="description">

                <!-- Favicon -->
                <link href="https://img.onl/fUrHvw" rel="icon">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.gstatic.com">
                <link
                    href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
                    rel="stylesheet">

                <!-- Font Awesome -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="${contextRoot}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                <!-- Customized Bootstrap Stylesheet -->
                <link href="${contextRoot}/css/style.css" rel="stylesheet">

                <!-- jQ -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            </head>

            <body>
                <!-- Topbar Start -->
<%--                <nav>--%>
<%--                    <input type="checkbox" id="check"> <label for="check" class="checkbtn"> <i class="fa fa-bars"></i>--%>
<%--                    </label> <label class="logo" style="padding-left: 30px"><a href="${contextRoot}/"><img--%>
<%--                                src="https://img.onl/fUrHvw" width="50" height="50"></a></label>--%>
<%--                    <ul style="margin-bottom: 0px;z-index:20">--%>
<%--                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="" role="button"--%>
<%--                                data-toggle="dropdown" aria-expanded="false"> Shop </a>--%>
<%--                            <ul class="dropdown-menu"--%>
<%--                                style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 96px, 0px); margin-top: 0px; border-top-width: 0px; padding-top: 0px;">--%>
<%--                                <li><a class="dropdown-item" id="loadAllProduct" href="${contextRoot}/shop">All</a></li>--%>
<%--                                <li><a class="dropdown-item" id="loadTopProduct" href="${contextRoot}/shop/top">Top</a>--%>
<%--                                </li>--%>
<%--                                <li><a class="dropdown-item" href="${contextRoot}/shop/bottom">Bottom</a></li>--%>
<%--                                <li><a class="dropdown-item" href="${contextRoot}/shop/outer">Outer</a></li>--%>
<%--                                <li><a class="dropdown-item" href="${contextRoot}/shop/dress">Dress</a></li>--%>
<%--                                <li><a class="dropdown-item" href="${contextRoot}/shop/acc">Accessories</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li><a href="${contextRoot}/notice">Notice</a></li>--%>
<%--                        <li><a href="${contextRoot}/contact">Contact</a></li>--%>
<%--                        <li><a href="https://www.instagram.com/chezmoiiiiiii/?hl=en">Instagram</a></li>--%>
<%--                        <li><a class="position-relative" href="${contextRoot}/cartAll"> <i--%>
<%--                                    class="fas fa-shopping-cart fa-1x" style="font-size:20px"></i> <span--%>
<%--                                    class="cartQuantity text-white bg-warning"></span>--%>
<%--                            </a></li>--%>
<%--                        <li><a href="#" class="nav-item nav-link fas fa-user fa-1x" style="font-size:20px"></a></li>--%>
<%--                    </ul>--%>

<%--                    </nav>--%>
<%--                    <section></section>--%>
                <jsp:include page="layout/navbar.jsp"></jsp:include>

                    <br>
                    <!-- category start -->
                    <%-- <jsp:include page="layout/category.jsp">
                        </jsp:include> --%>
                        <!-- 				<br> -->
                        <!-- accounce start -->
                        <jsp:include page="layout/announce.jsp"></jsp:include>
                        <br>

                        <!-- Shop Product Start -->
                        <div class="container-products align-items-center">
                            <ul class="pros-ul justify-content-around align-items-center">


                                <div class="row px-xl-5 pb-3" id="tbody">
                                    <%-- <c:forEach var="products" items="${page.content}">--%>
                                        <%-- <div class="col-lg-3 col-md-6 col-sm-12 pb-1">--%>
                                            <%-- <div class="card product-item border-0 mb-4">--%>
                                                <%-- <div
                                                    class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                    --%>
                                                    <%-- <img class="img-fluid w-300" --%>
                                                        <%-- src="http://localhost:8080/Chezmoi/getMainPic/${products.photo.photoId}"
                                                            --%>
                                                            <%-- style="height:278px ; width:226px" alt="">--%>
                                                                <%-- </div> --%>
                                                                    <%-- <div
                                                                        class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                                                        --%>
                                                                        <%-- <a
                                                                            href="${contextRoot}/shop/productDetail?series=${products.series}">
                                                                            --%>
                                                                            <%-- <h6 class="text-truncate mb-3">
                                                                                ${products.name}</h6>--%>
                                                                                <%-- </a>--%>
                                                                                    <%-- <div
                                                                                        class="d-flex justify-content-center">
                                                                                        --%>
                                                                                        <%-- <h6 id="saleprice">
                                                                                            ${products.price}</h6>--%>
                                                                                            <%-- </div>--%>
                                                                                                <%-- </div>--%>
                                                                                                    <%-- </div>--%>
                                                                                                        <%-- </div>--%>
                                                                                                            <%--
                                                                                                                </c:forEach>
                                                                                                                --%>
                                </div>
                            </ul>
                        </div>

                        <!-- 換頁功能-->
                        <div class="pageNumberhover" id="pageNumber">
                            <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                                <c:choose>
                                    <c:when test="${pageNumber !=pageNumber+1}">
                                        <a href="${contextRoot}/shop?p=${pageNumber}">${pageNumber}</a>

                                    </c:when>
                                    <c:otherwise>${pageNumber}</c:otherwise>

                                </c:choose>

                            </c:forEach>
                        </div>




                        <!-- footer頁面 -->
                        <jsp:include page="layout/footer.jsp"></jsp:include>

                        <!-- Template Javascript -->
                        <script src="${contextRoot}/js/shopAjax.js"></script>

            </body>

            </html>