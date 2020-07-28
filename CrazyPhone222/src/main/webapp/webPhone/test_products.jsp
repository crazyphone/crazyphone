
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Phone人苑 | Product</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="Luxury Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--start-menu-->
<script src="js/simpleCart.min.js">
	
</script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>
</head>
<body>
	<!-- 標頭開始 -->
	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<!-- <div class="drop">
						<div class="box">
							<select tabindex="4" class="dropdown drop">
								<option value="" class="label">Dollar :</option>
								<option value="1">Dollar</option>
								<option value="2">Euro</option>
							</select>
						</div>
						<div class="box1">
							<select tabindex="4" class="dropdown">
								<option value="" class="label">English :</option>
								<option value="1">English</option>
								<option value="2">French</option>
								<option value="3">German</option>
							</select>
						</div>
						<div class="clearfix"></div>
					</div>
					-->
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="checkout">
<!-- 							<div class="total"> -->
<!-- 								<span class="simpleCart_total"></span> -->
<!-- 							</div> -->
							<a href='showCartContent'> <img src="images/cart-1.png" alt="" /></a>
						</a>
						<p>
<!-- 							<a href="javascript:;" class="simpleCart_empty">清空購物車</a> -->
						</p>
						<td width='130' align='center'>
<!-- 						<a href='showCartContent'>購物車明細</a>&nbsp;&nbsp; -->
						<a	href='removeCart'>移除購物車項目</a></td>
						<div class="clearfix"></div>
					</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	<div class="logo">
		<a href="<c:url value='/'/>"><h1>Phone人苑</h1></a>
		<c:if test="${! empty LoginSuperOK }"> 
		<span  style="position: absolute; right: 0; margin-right: 250px;font-size:22px"><a  href="backIndex" >後台</a></span>
		</c:if>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
					<div class="top-nav">
						<ul class="memenu skyblue">
							<li class="active"><a href="<c:url value = '/' />">首頁</a></li>
							<li class="grid"><a href="products">商城</a> <!--  
								<div class="mepanel">
									<div class="row">
										<div class="col1 me-one">
											<h4>智慧型手機</h4>
											<ul>
												<li><a href="products">SAMSUNG</a></li>
												<li><a href="products">Apple</a></li>
												<li><a href="products">ASUS</a></li>
												<li><a href="products">HTC</a></li>
												<li><a href="products">SONY</a></li>
												<li><a href="products">Google</a></li>
											</ul>
										</div>
										<div class="col1 me-one">
											<h4>穿戴式配件</h4>
											<ul>
												<li><a href="products">SAMSUNG</a></li>
												<li><a href="products">Apple</a></li>
												<li><a href="products">ASUS</a></li>
												<li><a href="products">HTC</a></li>
												<li><a href="products">SONY</a></li>
												<li><a href="products">Google</a></li>
											</ul>
										</div>
										<div class="col1 me-one">
											<h4>Popular Brands</h4>
											<ul>
												<li><a href="products.html">499 Store</a></li>
												<li><a href="products.html">Fastrack</a></li>
												<li><a href="products.html">Casio</a></li>
												<li><a href="products.html">Fossil</a></li>
												<li><a href="products.html">Maxima</a></li>
												<li><a href="products.html">Timex</a></li>
												<li><a href="products.html">TomTom</a></li>
												<li><a href="products.html">Titan</a></li>
											</ul>
										</div>
										
									</div>
								</div>
								--></li>
							<li class="grid"><a href="showPKCartContent">車拚</a></li>
							<li class="grid"><a href="contact">聯絡我們</a></li>
							<li class="grid"><a href="register">註冊</a></li>
							<c:if test="${  empty LoginOK &&  empty LoginSuperOK}">
							<li class="grid"><a href="lognin">登入</a></li>
							</c:if>
							<c:if test="${ ! empty LoginOK ||  ! empty LoginSuperOK}">
							<li class="grid" ><a href="lognout" onclick="signOut()">登出</a></li>
							</c:if>
							<c:if test="${! empty LoginOK }"> 
 								<span style="margin:50px">Hello <a  href="up1">${LoginOK.memberName}</a></span>
								<img width='60' height='60' style="margin-left: -50px;margin-top: -20px"
									src="<c:url value='/getmemImg/${LoginOK.memberID}'/>" />
							</c:if> 
							<c:if test="${! empty LoginSuperOK }"> 
 								<span style="margin:50px">Hello <a  href="<c:url value='/'/>">${LoginSuperOK.supervisorName}</a>(管理人員)</span>
<!-- 								<img width='60' height='60' style="margin-left: -50px;margin-top: -20px" -->
<%-- 									src="<c:url value='/getmemImg/${LoginOK.memberID}'/>" /> --%>
							</c:if> 
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-3 header-right">
					<div class="search-bar">
					<form method='POST' action="<c:url value='searchProduct' />">
					
						<input type="text" name="searchP" value="Search" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}">
						<input type="submit" value="">
					</form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!-- 	標頭結束 -->
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="index.html">首頁</a></li>
					<li class="active">New Products</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--prdt-starts-->

					<h2 style="position: relative; top: 20px;text-align: center">商城</h2>

<!-- 		<section> -->
<!-- 		<div> -->
<!-- 			<div class="container" style="text-align: center"> -->
<!-- 				<h1>商城</h1> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
	<div class="prdt" style="position: relative; top: -40px">
		<div class="container">
			<div id="adjustment" class="prdt-top">
				<div  class="col-md-9 prdt-left" style="position: relative; top: -30px">
					<div>
						<p>${adjustmentText}</p>
					</div>

					<c:forEach var='product' items='${products}' varStatus='status'>
						<c:if test="${status.count%3==1}">
							<div class="product-one">
						</c:if>


						<div class="col-md-4 product-left p-left">
							<div class="product-main simpleCart_shelfItem">
								<a href="<spring:url value='product?id=${product.productID}'/>"
									class="mask"><img class="img-responsive zoom-img"
									src="<c:url value='/getPicture/${product.productID}' />" alt="" /></a>
								<div class="product-bottom">
									<h3>${product.productName}</h3>
									<p>
										<!--  
											<a
												href="<spring:url value='product?id=${product.productID}'/>"
												class="btn btn-primary">詳細資料 
												<span class="glyphicon-hand-left glyphicon"></span> 
											
											</a>
											<p>
								<form action='addToCart' method='POST'>
									<input type='hidden'  name='phoneId' value='${product.productID}'> 
									<input type='hidden'  name='phoneName' value='${product.productName}'>
									<input type='hidden'  name='phonePrice' value='${product.unitPrice}'>
									<input type='hidden'  name='qty' value='1'>
									<input type='hidden'  name='page' value='products2'> 
							<input type='submit' class="btn btn-primary" value='加入購物車'>  		
								</form>
								<form action='addToPKCart' method='POST'>
								<input type='hidden' name='productID' value='${product.productID}'> 
								<input type='hidden' name='productName' value='${product.productName}'> 
								<input type='hidden' name='UnitPrice' value='${product.unitPrice}'>
								<input type='hidden' name='qty' value=1> 
								<input type='hidden' name='page' value='products2'> 
								<input type='submit' class="btn btn-primary" value='加入車拚'>
						     	</form>
											-->
									</p>
									<h4>
										<a class="item_add"
											href="<spring:url value='addToCart?phoneId=${product.productID}&&phoneName=${product.productName}&&phonePrice=${product.unitPrice}&&qty=1&&page=products'/>">
										<i></i>
										</a> <span class=" item_price">$ ${product.unitPrice}</span>
									</h4>
									<form action='addToPKCart' method='POST'>
										<input type='hidden' name='productID'
											value='${product.productID}'> <input type='hidden'
											name='productName' value='${product.productName}'> <input
											type='hidden' name='UnitPrice' value='${product.unitPrice}'>
										<input type='hidden' name='qty' value=1> <input
											type='hidden' name='page' value='products'> <input
											type='submit' class="btn btn-primary" value='加入車拚'>
									</form>
								</div>
								<div class="srch srch1">
									<span>-50%</span>
								</div>
							</div>
						</div>
						<c:if test="${(status.count%3==0)||status.last}">
							<div class="clearfix"></div>
				</div>
				<br>
				</c:if>

				</c:forEach>

			</div>
		</div>

		<div class="col-md-3 prdt-right">
			<div class="w_sidebar">
				<!-- 
				<section class="sky-form">
					<h4>Catogories</h4>
					<div class="row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox"
								name="checkbox" checked=""><i></i>All Accessories</label>
						</div>
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox"
								name="checkbox"><i></i>Women Watches</label> <label
								class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kids
								Watches</label> <label class="checkbox"><input type="checkbox"
								name="checkbox"><i></i>Men Watches</label>
						</div>
					</div>
				</section>
				 -->
				<section class="sky-form">
					<h4>品牌</h4>
					<div class="row1 row2 scroll-pane">

						<!-- 
						<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>kurtas</label>
								</div>
								
							-->
						<div class="col col-4">
							<c:forEach var='brand' items='${brands}' varStatus='status'>
								<label class="radio"> <input type="radio" name="radio" value="${brand}"><i></i>${brand}</label>
<%-- 									onclick='window.location.assign("productsBrand?brandName=${brand}")' --%>
									
							
							</c:forEach>

						</div>
					</div>
				</section>
				<script>
				
				$(function(){
					$('input[type=radio][name=radio]').change(function() {
//		 			       if (this.value == 'SONY') alert("click SONY");
		 			      //alert(this.value);
	 				  // var data = {brandName: $(this).val()};
					  var data; 
	 				  $.ajax({
					            url: "<c:url value='/allProducts' />",   //後端的URL
					            type: "GET",   //用POST的方式
					            //dataType: "json",   //response的資料格式
					            data: {brandName:this.value},   //response的資料格式
					            cache: false,   //是否暫存
					            //data: data, //傳送給後端的資料
					            success: function(data) {
					            	console.log('Submission was successful.');
					                console.log(data);  //成功後回傳的資料
					                var content="<div  class='col-md-9 prdt-left' style='position: relative; top: -30px'><div class='product-one'>";
					                
					                
// 					                var content = "<div  class='col-md-9 prdt-left' style='position: relative; top: -30px'>";
									//content += "<div><p>${adjustmentText}</p></div><div class='product-one'>";
					                for(var i=0; i < data.length; i++){
									content +="<div class='col-md-4 product-left p-left'>"+
											  "<div class='product-main simpleCart_shelfItem'>"+
											  "<a href='product?id="+data[i].productID+"'class='mask'>"+
											  "<img class='img-responsive zoom-img'src='/CrazyPhone222/getPicture/"+data[i].productID+"' /></a>"+
											  "<div class='product-bottom'><h3>"+data[i].productName+"</h3><p>	</p><h4>"+
											  "<a class='item_add' href='addToCart?phoneId="+data[i].productID+"&&phoneName="+data[i].productName+"&&phonePrice="+data[i].unitPrice+"&&qty=1&&page=products'><i></i></a>"+
											  "<span class='item_price'>$ "+data[i].unitPrice+"</span></h4>"+
											  "<form action='addToPKCart' method='POST'>"+
											  "<input type='hidden' name='productID'value='"+data[i].productID+"'>"+
											  "<input type='hidden'name='productName' value='"+data[i].productName+"'>"+
											  "<input type='hidden' name='UnitPrice' value='"+data[i].unitPrice+"'>"+
											  "<input type='hidden' name='qty' value=1>"+
											  "<input type='hidden' name='page' value='products'>"+
											  "<input type='submit' class='btn btn-primary' value='加入車拚'></form>"+
											  "</div><div class='srch srch1'><span>-50%</span></div></div></div>";
									}
									content += "<div class='clearfix'><br></div>";
						            $("#adjustment")[0].innerHTML = content;
					            
					            },
					            error: function(XMLHttpRequest, status, error) {
					                console.log(error);
					            }
					        });
					    });
				})
				
				</script>
				<section class="sky-form">
					<h4>價格</h4>

					<div class="row1 row2 scroll-pane">

						<!--  
						<div class="col col-4">
							<label class="radio"><input type="radio" name="radio"
								checked=""><i></i>60 % and above</label> <label class="radio"><input
								type="radio" name="radio"><i></i>50 % and above</label> <label
								class="radio"><input type="radio" name="radio"><i></i>40%
								and above</label>
						</div>
						-->
						<div class="col col-4">
							<!-- 
							<label class="radio"><input type="radio" name="radio"><i></i>30	% and above</label> 
							<label class="radio"><input type="radio"name="radio"><i></i>20 % and above</label>
							 <label class="radio"><input type="radio" name="radio"><i></i>10 % and above</label> 
						
						 -->
							<form method="post" action="productsPrice">

								<input id="priceS" type="text" name="lowestPrice"
									placeholder="最低價" value="" size="5" maxlength="5"
									pattern="[0-9]{0,5}" title="價格區間請輸入非零數字"> &nbsp;~&nbsp;
								<input id="priceE" type="text" name="highestPrice"
									placeholder="最高價" value="" size="5" maxlength="5"
									pattern="[0-9]{0,5}" title="價格區間請輸入非零數字"> <input
									type="submit" value="確定">

							</form>



						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	</div>
	</div>
	<!--product-end-->
	<!--information-starts-->
	<div class="information">
		<div class="container">
			<div class="infor-top">
				<div class="col-md-3 infor-left">
					<h3>追蹤我們</h3>
					<ul>
						<li><a href="#"><span class="fb"></span>
							<h6>Facebook</h6></a></li>
						<li><a href="#"><span class="twit"></span>
							<h6>Twitter</h6></a></li>
						<li><a href="#"><span class="google"></span>
							<h6>Google+</h6></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>相關資訊</h3>
					<ul>
						<li><a href="#"><p>熱銷商品</p></a></li>
						<li><a href="#"><p>新進商品</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>品牌總覽</h3>
					<ul>
						<li><a href="products"><p>SAMSUNG</p></a></li>
						<li><a href="products"><p>Apple</p></a></li>
						<li><a href="products"><p>ASUS</p></a></li>
						<li><a href="products"><p>HTC</p></a></li>
						<li><a href="products"><p>SONY</p></a></li>
						<li><a href="products"><p>Google</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>商店資訊</h3>
					<h4>
						The company name, <span>Lorem ipsum dolor,</span> Glasglow Dr 40
						Fe 72.
					</h4>
					<h5>+955 123 4567</h5>
					<p>
						<a href="mailto:example@email.com">contact@example.com</a>
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--information-end-->
	<!--footer-starts-->
	<div class="footer">
		<div class="container">
			<div class="footer-top">
				<div class="col-md-6 footer-left">
					<form>
						<input type="text" value="Enter Your Email"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Enter Your Email';}">
						<input type="submit" value="Subscribe">
					</form>
				</div>
				<div class="col-md-6 footer-right">
					<p>
						© 2020 Phone人苑. All Rights Reserved | Design by <a
							href="http://w3layouts.com/" target="_blank">W3layouts</a>
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-end-->
</body>
</html>