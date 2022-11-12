<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="utf-8">
                    <title>Chezmoi 後台管理中心</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="Free HTML Templates" name="keywords">
                    <meta content="Free HTML Templates" name="description">

                    <!-- Favicon -->
                    <link href="${contextRoot}/img/logo.jpg" rel="icon">

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
                    <link href="${contextRoot}/css/back_style.css" rel="stylesheet">

                    <style>
                        li,
                        ul {
                            list-style: none;
                            padding: 0%;
                        }

                        li,
                        ul {
                            list-style: none;
                        }
                    </style>
                </head>

                <body>
                    <!-- Topbar  -->
                    <jsp:include page="../layout/topbar.jsp"></jsp:include>


                    <div class="container-fluid mb-5">
                        <div class="row border-top px-xl-3">
                            <!-- Navbar  -->
                            <jsp:include page="../layout/navbar.jsp"></jsp:include>

                            <div class="col-lg-9">
                                <form:form method="POST" modelAttribute="product" enctype="multipart/form-data"
                                    class="border-0">
                                    <div class="col-lg-12 border-secondary border mb-5 mt-3"
                                        style="padding-left: 0; padding-right:0;">
                                        <div class="card-header bg-secondary border-0">
                                            <h4 class="font-weight-semi-bold m-0">新增商品</h4>
                                        </div>

                                        <div class="card-body">
                                            <span class="btn btn-sm btn-secondary" id="testF1">測試-未輸入類別</span>
                                            <span class="btn btn-sm btn-secondary" id="testF3">測試-名稱未輸入並送出</span>
                                            <span class="btn btn-sm btn-secondary" id="clean">清空記錄</span>
                                            <span class="btn btn-sm" style="background-color: #b21f2d;color: white" id="test">測試-成功上架</span>
                                        </div>

                                        <div class="card-body">
                                            <form method="POST" enctype="multipart/form-data">
                                                <div class="d-flex justify-content-between pt-1 mb-2">
                                                    <h5 class=" font-weight-semi-bold">商品圖片
                                                        <span style='color:red;font-size: 15px' class="font-weight-semi-bold border">${msgPic}</span></h5>
                                                </div>
                                                <div>
                                                    <div class="mb-2"><img id="output1" width="250" height="auto"
                                                            style="display: none"></div>
                                                    <label class="title btn btn-sm btn-secondary">主要商品圖片
                                                        <input style="display:none" type="file"
                                                            accept="image/gif, image/jpeg, image/png"
                                                            name="mainProduct_pic" id="mainPic" />
                                                    </label>
                                                </div>
                                                <div class="mt-2">
                                                    <div class="mb-2"><img id="output2" width="250" height="auto"
                                                            style="display: none"></div>
                                                    <label class="title btn btn-sm btn-secondary">平拍圖片
                                                        <input style="display:none"
                                                            class="btn btn-sm btn-outline-secondary " type="file"
                                                            accept="image/gif, image/jpeg, image/png" name="fit_pic"
                                                            id="fitPic" />
                                                    </label>
                                                </div>
                                                <div class="mt-2">
                                                    <div class="mb-2" id="output3"></div>
                                                    <label class="title btn btn-sm btn-secondary">細節圖片
                                                        <input style="display:none"
                                                            class="btn btn-sm btn-outline-secondary" type="file"
                                                            accept="image/gif, image/jpeg, image/png" name="detail_pic"
                                                            id="detailPics" multiple />
                                                    </label><label id="error">*最多上傳4張圖片(接受*.JPEG/.JPG)</label>
                                                </div>
                                            </form>


                                            <div class="d-flex justify-content-between pt-1 mb-2 mt-1">
                                                <h5 class=" font-weight-semi-bold">類別
                                                    <span style='color:red;font-size: 15px' class="font-weight-semi-bold border" id="msgCate">${msgCate}</span></h5>
                                            </div>
                                            <div class="dropdown mb-1">
                                                <input type="radio" name="category" value="Top"id="top"> Top
                                                <input type="radio" name="category" value="Bottom"> Bottom
                                                <input type="radio" name="category" value="Outer"> Outer
                                                <input type="radio" name="category" value="Dress"> Dress
                                                <input type="radio" name="category" value="Accessories"> Accessories
                                                <input type="hidden" id="cate" value="${product.category}">
                                            </div>
                                            <div class="d-flex justify-content-between pt-1 mb-2 mt-3"
                                                style="clear:both;">
                                                <h5 class=" font-weight-semi-bold">商品名稱
                                                    <span style='color:red;font-size: 15px' class="font-weight-semi-bold border" id="idsp1">${msgN}</span></h5>
                                            </div>
                                            <div class="input-group">
                                                <form:input path="name" type="text" class="form-control p-4 mb-3"
                                                    placeholder="商品名稱" id="product_name" />
                                            </div>

                                            <div class="d-flex justify-content-between pt-1 mb-2">
                                                <h5 class=" font-weight-semi-bold">商品描述
                                                    <span style='color:red;font-size: 15px' class="font-weight-semi-bold border" id="idsp2">${msgDesc}</span></h5>
                                            </div>
                                            <div class="input-group">
                                                <textarea name="descriptText" type="text" class="form-control p-4"
                                                    placeholder="商品描述" id="product_describe">${descriptText}</textarea>
                                            </div>


                                        </div>

                                        <div class="col-lg-12 border-secondary  border mb-5"
                                            style="padding-left: 0; padding-right:0;">
                                            <div class="card-header bg-secondary border-0">
                                                <h4 class="font-weight-semi-bold m-0">商品資訊 </h4>
                                            </div>
                                            <div class="pl-3 mt-2">
                                                <span><u>*商品類別為Accessories請至少選一項尺寸或一項顏色!</u></span>
                                            </div>

                                            <div class="card-body">
                                                <div class="d-flex justify-content-between pt-1 mb-2">
                                                    <h5 class=" font-weight-semi-bold">尺寸
                                                        <span style='color:red;font-size: 15px' class="font-weight-semi-bold border" >${msgCS}</span></h5>
                                                </div>
                                                <div class="size">
                                                    <input type="checkbox" name="size" value="S"> S
                                                    <input type="checkbox" name="size" value="M"> M
                                                    <input type="checkbox" name="size" value="L"> L
                                                    <input type="checkbox" name="size" value="XL"> XL
                                                    <input type="checkbox" name="size" value="F" id="F"> F
                                                    <input type="hidden" id="size" value="${sizeList}">
                                                </div>
                                            </div>

                                            <div class="card-body">
                                                <div class="d-flex justify-content-between pt-1 mb-2">
                                                    <h5 class=" font-weight-semi-bold">顏色
                                                        <span style='color:red;font-size: 15px' class="font-weight-semi-bold border" >${msgCS}</span></h5>
                                                    <!-- <span><input value="addColor" type="button"></span> -->
                                                </div>
                                                <!-- 後續前台要增加addColor的功能!! -->
                                                <div class="color">
                                                    <input type="checkbox" name="color" value="Cream"> Cream
                                                    <input type="checkbox" name="color" value="Pink"> Pink
                                                    <input type="checkbox" name="color" value="Blue"> Blue
                                                    <input type="checkbox" name="color" value="Black" id="black"> Black
                                                    <input type="checkbox" name="color" value="White" id="white"> White
                                                    <input type="checkbox" name="color" value="Gray"> Gray
                                                    <input type="checkbox" name="color" value="Green"> Green
                                                    <input type="checkbox" name="color" value="Oatmeal"> Oatmeal
                                                    <input type="checkbox" name="color" value="Navy"> Navy
                                                    <input type="checkbox" name="color" value="Brown"> Brown
                                                    <input type="checkbox" name="color" value="Beige"> Beige
                                                    <input type="checkbox" name="color" value="Ivory"> Ivory
                                                    <input type="checkbox" name="color" value="Sora"> Sora
                                                    <input type="checkbox" name="color" value="Mint"> Mint
                                                    <input type="checkbox" name="color" value="Purple"> Purple
                                                    <input type="hidden" id="col" value="${colorList}">
                                                </div>
                                            </div>

                                            <div class="card-body">
                                                <div class="d-flex justify-content-between pt-1 mb-2">
                                                    <h5 class=" font-weight-semi-bold">商品價格
                                                        <span style='color:red;font-size: 15px' class="font-weight-semi-bold border" id="idsp3">${msgP}</span></h5>
                                                </div>
                                                <div class="input-group">
                                                    <form:input path="price" type="number" class="form-control p-4 mb-2"
                                                        placeholder="商品價格"  onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" id="product_price" />
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="d-flex align-content-center  ">
                                                    <h5 class="font-weight-semi-bold">立即上架</h5><br>
                                                    <div class="align-content-center ml-1">
                                                        <input type="radio" name="state" value="ON" checked> ON
                                                        <input type="radio" name="state" value="OFF"> OFF
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <input class="btn btn-sm btn-secondary" type="submit" value="上架商品">
                                            </div>
                                        </div>

                                </form:form>
                            </div>

                        </div>
                    </div>
                    <c:if test="${param.msg!='' && !(empty param.msg) }">
                        <script>confirm("${param.get("msg")}");</script>
                    </c:if>

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script
                        src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
                    <script src="${contextRoot}/lib/easing/easing.min.js"></script>
                    <script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Contact Javascript File -->
                    <script src="${contextRoot}/mail/jqBootstrapValidation.min.js"></script>
                    <script src="${contextRoot}/mail/contact.js"></script>

                    <!-- Template Javascript -->
                    <script src="${contextRoot}/js/main.js"></script>
                    <script>
                        $(document).ready(function () {
                            $('.menu>li>a').click(function (e) {
                                e.preventDefault();
                                //點選到的.menu>li>a顯示裡面的.inmenu 
                                $(this).siblings('.inmenu').slideDown().parent().siblings().find('.inmenu').slideUp();
                                //點選到的.menu>li>a 顯示動態active
                                $(this).addClass('active').parent().siblings().find('a').removeClass('active');
                            });

                            $('#mainPic').on('change', function (e) {
                                const file = this.files[0];
                                const fr = new FileReader();
                                fr.onload = function (e) {
                                    $('#output1').attr('src', e.target.result).show();
                                };
                                fr.readAsDataURL(file);
                            });
                            $('#fitPic').on('change', function (e) {
                                const file = this.files[0];
                                const fr = new FileReader();
                                fr.onload = function (e) {
                                    $('#output2').attr('src', e.target.result).show();
                                };
                                fr.readAsDataURL(file);
                            });
                            $('#detailPics').change(function () {
                                readURL(this);
                            });
                            function readURL(input) {
                                if (input.files && input.files.length >= 0) {
                                    if (input.files.length <= 4) {

                                        for (var i = 0; i < input.files.length; i++) {
                                            const fr = new FileReader();
                                            fr.onload = function (e) {
                                                const img = $("<img width='250' height='auto' class='mr-1 mt-1'>").attr('src', e.target.result);
                                                $('#output3').append(img);

                                            }
                                            fr.readAsDataURL(input.files[i]);
                                        }
                                        $('#error').hide();
                                    } else {
                                        $('#error').append($("<span class='border font-weight-semi-bold' style='color: red'>已超過上限的4張照片，請重新選擇</span>"))
                                    }
                                }
                            }





                        });
                    </script>
                    <script>
                        document.getElementById("product_name").addEventListener("blur", checkName);
                        function checkName() {
                            let theObj = document.getElementById("product_name");
                            let theObjVal = theObj.value;
                            let idsp = document.getElementById("idsp1")
                            let theObjLen = theObj.length;
                            if (theObjVal == "") {
                                idsp.innerHTML = "<span style='color:red' /> 此欄不可空白";
                            }
                            return false;
                        }
                    </script>
                    <script>
                        document.getElementById("product_describe").addEventListener("blur", checkName);
                        function checkName() {
                            let theObj = document.getElementById("product_describe");
                            let theObjVal = theObj.value;
                            let idsp = document.getElementById("idsp2")
                            let theObjLen = theObj.length;
                            if (theObjVal == "") {
                                idsp.innerHTML = "<span style='color:red' /> 此欄不可空白";
                            }
                            return false;
                        }
                    </script>
                    <script>
                        document.getElementById("product_price").addEventListener("blur", checkName);
                        function checkName() {
                            let theObj = document.getElementById("product_price");
                            let theObjVal = theObj.value;
                            let idsp = document.getElementById("idsp3")
                            let theObjLen = theObj.length;
                            if (theObjVal == "") {
                                idsp.innerHTML = "<span style='color:red' /> 此欄不可空白";
                            }
                            return false;
                        }
                    </script>
                        <script>
                            var sList =$('#size').val().split(",");
                            for (var i=0;i<sList.length;i++){
                                var sizeV = sList[i].replace("[","").replace("]","").replace(" ","");
                                $('input[name="size"][value="'+sizeV+'"]').attr("checked",true);
                            }
                            var cList =$('#col').val().split(",");
                            for (var i=0;i<cList.length;i++){
                                var colV = cList[i].replace("[","").replace("]","").replace(" ","");
                                $('input[name="color"][value="'+colV+'"]').attr("checked",true);
                            }cate
                            var cate =$('#cate').val();
                            $('input:radio[value="'+cate+'"]').attr("checked",true);

                        </script>
                        <script>
                            $(document).ready(function (){
                                $('#test').click(function (){
                                    $('#top').attr('checked',true);
                                    $('#product_name').val("Jasmine blouse");
                                    $('#product_describe').val("今年春初有介紹類似的款式，廠商隔了幾個月稍為改良，這件我覺得版型更挺了也不容易皺，是純棉的材質，長度我覺得很剛好，即使不紮也不會顯得沒精神，衣領的蝴蝶結可以自由決定，綁或不綁都非常好看，不綁有種隨性的感覺💗💎價格又很優惠這次連線必入手的一款唷✅size:肩39/胸44/長57 fabric:cotton ");
                                    $('#F').attr("checked",true);
                                    $('#white').attr("checked",true);
                                    $('#black').attr("checked",true);
                                    $('#product_price').val(1080);
                                });

                                $('#clean').click(function (){
                                    $('#top').attr('checked',false);
                                    $('#product_name').val("");
                                    $('#product_describe').val("");
                                    $('#F').attr("checked",false);
                                    $('#white').attr("checked",false);
                                    $('#black').attr("checked",false);
                                    $('#product_price').val("");

                                });

                                $('#testF1').click(function (){
                                    $('#product_name').val("Jasmine blouse");
                                    $('#product_describe').val("今年春初有介紹類似的款式，廠商隔了幾個月稍為改良，這件我覺得版型更挺了也不容易皺，是純棉的材質，長度我覺得很剛好，即使不紮也不會顯得沒精神，衣領的蝴蝶結可以自由決定，綁或不綁都非常好看，不綁有種隨性的感覺💗💎價格又很優惠這次連線必入手的一款唷✅size:肩39/胸44/長57 fabric:cotton ");
                                    $('#F').attr("checked",true);
                                    $('#white').attr("checked",true);
                                    $('#black').attr("checked",true);
                                    $('#product_price').val(1080);
                                });
                                $('#testF2').click(function (){
                                    $('#top').attr('checked',true);
                                    $('#product_name').val("Jasmine blouse");
                                    $('#product_describe').val("今年春初有介紹類似的款式，廠商隔了幾個月稍為改良，這件我覺得版型更挺了也不容易皺，是純棉的材質，長度我覺得很剛好，即使不紮也不會顯得沒精神，衣領的蝴蝶結可以自由決定，綁或不綁都非常好看，不綁有種隨性的感覺💗💎價格又很優惠這次連線必入手的一款唷✅size:肩39/胸44/長57 fabric:cotton ");
                                    $('#F').attr("checked",true);
                                    $('#product_price').val(1080);
                                });
                                $('#testF3').click(function (){
                                    $('#top').attr('checked',true);
                                    $('#product_describe').val("今年春初有介紹類似的款式，廠商隔了幾個月稍為改良，這件我覺得版型更挺了也不容易皺，是純棉的材質，長度我覺得很剛好，即使不紮也不會顯得沒精神，衣領的蝴蝶結可以自由決定，綁或不綁都非常好看，不綁有種隨性的感覺💗💎價格又很優惠這次連線必入手的一款唷✅size:肩39/胸44/長57 fabric:cotton ");
                                    $('#F').attr("checked",true);
                                    $('#white').attr("checked",true);
                                    $('#black').attr("checked",true);
                                    $('#product_price').val(1080);
                                });


                            });
                        </script>




                </body>

                </html>