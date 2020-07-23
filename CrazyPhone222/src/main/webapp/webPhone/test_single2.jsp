Author: W3layout Author URL: http://w3layouts.com License: Creative
Commons Attribution 3.0 Unported License URL:
http://creativecommons.org/licenses/by/3.0/ -->
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Phone人苑 | Single</title>
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
<script type="text/javascript">
	$(function() {

		var menu_ul = $('.menu_drop > li > ul'), menu_a = $('.menu_drop > li > a');

		menu_ul.hide();

		menu_a.click(function(e) {
			e.preventDefault();
			if (!$(this).hasClass('active')) {
				menu_a.removeClass('active');
				menu_ul.filter(':visible').slideUp('normal');
				$(this).addClass('active').next().stop(true, true).slideDown(
						'normal');
			} else {
				$(this).removeClass('active');
				$(this).next().stop(true, true).slideUp('normal');
			}
		});

	});
</script>
</head>
<body>
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
				</div> -->
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="checkout">
							<div class="total">
								<span class="simpleCart_total"></span>
							</div> <img src="images/cart-1.png" alt="" />
						</a>
						<p>
							<a href="javascript:;" class="simpleCart_empty">清空購物車</a>
						</p>
						<div class="clearfix"></div>
					</div>
					<div class="cart box_1">
						<a href="account"> <!-- <div class="total">
							<span class="simpleCart_total"></span></div> --> <img
							src="images/user2.png" alt="" title="登入" />

						</a>
						<!-- <p><a href="javascript:;" class="simpleCart_empty">登入</a></p> -->
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
		<a href="<c:url value = '/' />"><h1>Phone人苑</h1></a>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
					<div class="top-nav">
						<ul class="memenu skyblue">
							<li class="grid"><a href="<c:url value = '/' />">首頁</a></li>
							<li class="active"><a href="products">商城</a></li>
							<li class="grid"><a href="showPKCartContent">車拚</a></li>
							<li class="grid"><a href="contact">聯絡我們</a></li>
							<li class="grid"><a href="register">註冊</a></li>
							<li class="grid"><a href="lognin">登入</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-3 header-right">
					<div class="search-bar">
						<form method='POST' action="<c:url value='searchProduct' />">
							<input type="text" name="searchP" value="Search"
								onfocus="this.value = '';"
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
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="<c:url value = '/' />">Home</a></li>
					<li class="active">Single</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--start-single-->
	<div class="single contact">
		<div class="container">
			<div class="single-main">
				<div class="col-md-9 single-main-left">
					<div class="sngl-top">
						<div class="col-md-5 single-top-left">
							<div class="flexslider">
								<ul class="slides">
									<li
										data-thumb="<c:url value='/getPicture/${product.productID}'/>">
										<div class="thumb-image">
											<img src="<c:url value='/getPicture/${product.productID}'/>"
												data-imagezoom="true" class="img-responsive" alt="" />
										</div>
									</li>
									<li
										data-thumb="<c:url value='/getPicture/${product.productID}'/>">
										<div class="thumb-image">
											<img src="<c:url value='/getPicture/${product.productID}'/>"
												data-imagezoom="true" class="img-responsive" alt="" />
										</div>
									</li>
									<li
										data-thumb="<c:url value='/getPicture/${product.productID}'/>">
										<div class="thumb-image">
											<img src="<c:url value='/getPicture/${product.productID}'/>"
												data-imagezoom="true" class="img-responsive" alt="" />
										</div>
									</li>
								</ul>
							</div>
							<!-- FlexSlider -->
							<script src="js/imagezoom.js"></script>
							<script defer src="js/jquery.flexslider.js"></script>
							<link rel="stylesheet" href="css/flexslider.css" type="text/css"
								media="screen" />

							<script>
								// Can also be used with $(document).ready()
								$(window).load(function() {
									$('.flexslider').flexslider({
										animation : "slide",
										controlNav : "thumbnails"
									});
								});
							</script>
						</div>
						<div class="col-md-7 single-top-right">
							<div class="single-para simpleCart_shelfItem">
								<h2>${product.productName}</h2>
								<div class="star-on">
									<ul class="star-footer">
										<li><a href="#"><i> </i></a></li>
										<li><a href="#"><i> </i></a></li>
										<li><a href="#"><i> </i></a></li>
										<li><a href="#"><i> </i></a></li>
										<li><a href="#"><i> </i></a></li>
									</ul>
									<div class="review">
										<a
											href="<spring:url value='criticism?productID=${product.productID}' />"
											class="btn btn-primary"> <span
											class="glyphicon-info-sigh glyphicon"></span>看評論
										</a>&nbsp&nbsp<a
											href="<spring:url value='criticism/add?productID=${product.productID}' />"
											class="btn btn-primary"> <span
											class="glyphicon-info-sigh glyphicon"></span>撰寫評論
										</a>

									</div>
									<div class="clearfix"></div>
								</div>

								<h5 class="item_price">$ ${product.unitPrice}</h5>
								<p>${product.productIntro}</p>
								<div class="available">
									<ul>
										<li>Color <select>
												<option>Silver</option>
												<option>Black</option>
												<option>Dark Black</option>
												<option>Red</option>
										</select></li>
										<li class="size-in">Size<select>
												<option>Large</option>
												<option>Medium</option>
												<option>small</option>
												<option>Large</option>
												<option>small</option>
										</select></li>
										<div class="clearfix"></div>
									</ul>
								</div>
<!-- 								<ul class="tag-men"> -->
<!-- 									<li><span>TAG</span> <span class="women1">: Women,</span></li> -->
<!-- 									<li><span>SKU</span> <span class="women1">: CK09</span></li> -->
<!-- 								</ul> -->
								<table style="width:100px;position:relative;left:250px">
								<tr>
								<td>
								<form action='addToCart' method='POST'>
									<input type='hidden' name='phoneId'
										value='${product.productID}'> <input type='hidden'
										name='phoneName' value='${product.productName}'> <input
										type='hidden' name='phonePrice' value='${product.unitPrice}'>
									<input type='hidden' name='qty' value=1> <input
										type='hidden' name='page' value='products'> <input
										type='submit' class="btn btn-primary" value='加入購物車'>
								</form>
								</td>
								<td style="font-color:white">&nbsp&nbsp</td>
								<td>
								<form action='addToPKCart' method='POST'>
									<input type='hidden' name='productID'
										value='${product.productID}'> <input type='hidden'
										name='productName' value='${product.productName}'> <input
										type='hidden' name='UnitPrice' value='${product.unitPrice}'>
									<input type='hidden' name='qty' value=1> <input
										type='hidden' name='page' value='products'> <input
										type='submit' class="btn btn-primary" value='加入車拚'>
								</form>
								</td>
								</tr>
								</table>

							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<!--  
					<div class="tabs">
						<ul class="menu_drop">
							<li class="item1"><a href="#"><img
									src="images/arrow.png" alt="">Description</a>
								<ul>
									<li class="subitem1"><a href="#">Lorem ipsum dolor sit
											amet, consectetuer adipiscing elit, sed diam nonummy nibh
											euismod tincidunt ut laoreet dolore magna aliquam erat
											volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
											tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
											commodo consequat.</a></li>
									<li class="subitem2"><a href="#"> Duis autem vel eum
											iriure dolor in hendrerit in vulputate velit esse molestie
											consequat, vel illum dolore eu feugiat nulla facilisis at
											vero eros et accumsan et iusto odio dignissim qui blandit
											praesent luptatum zzril delenit augue duis dolore</a></li>
									<li class="subitem3"><a href="#">Mirum est notare quam
											littera gothica, quam nunc putamus parum claram, anteposuerit
											litterarum formas humanitatis per seacula quarta decima et
											quinta decima. Eodem modo typi, qui nunc nobis videntur parum
											clari, fiant sollemnes </a></li>
								</ul></li>
							<li class="item2"><a href="#"><img
									src="images/arrow.png" alt="">Additional information</a>
								<ul>
									<li class="subitem2"><a href="#"> Duis autem vel eum
											iriure dolor in hendrerit in vulputate velit esse molestie
											consequat, vel illum dolore eu feugiat nulla facilisis at
											vero eros et accumsan et iusto odio dignissim qui blandit
											praesent luptatum zzril delenit augue duis dolore</a></li>
									<li class="subitem3"><a href="#">Mirum est notare quam
											littera gothica, quam nunc putamus parum claram, anteposuerit
											litterarum formas humanitatis per seacula quarta decima et
											quinta decima. Eodem modo typi, qui nunc nobis videntur parum
											clari, fiant sollemnes </a></li>
								</ul></li>
							<li class="item3"><a href="#"><img
									src="images/arrow.png" alt="">Reviews (10)</a>
								<ul>
									<li class="subitem1"><a href="#">Lorem ipsum dolor sit
											amet, consectetuer adipiscing elit, sed diam nonummy nibh
											euismod tincidunt ut laoreet dolore magna aliquam erat
											volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
											tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
											commodo consequat.</a></li>
									<li class="subitem2"><a href="#"> Duis autem vel eum
											iriure dolor in hendrerit in vulputate velit esse molestie
											consequat, vel illum dolore eu feugiat nulla facilisis at
											vero eros et accumsan et iusto odio dignissim qui blandit
											praesent luptatum zzril delenit augue duis dolore</a></li>
									<li class="subitem3"><a href="#">Mirum est notare quam
											littera gothica, quam nunc putamus parum claram, anteposuerit
											litterarum formas humanitatis per seacula quarta decima et
											quinta decima. Eodem modo typi, qui nunc nobis videntur parum
											clari, fiant sollemnes </a></li>
								</ul></li>
							<li class="item4"><a href="#"><img
									src="images/arrow.png" alt="">Helpful Links</a>
								<ul>
									<li class="subitem2"><a href="#"> Duis autem vel eum
											iriure dolor in hendrerit in vulputate velit esse molestie
											consequat, vel illum dolore eu feugiat nulla facilisis at
											vero eros et accumsan et iusto odio dignissim qui blandit
											praesent luptatum zzril delenit augue duis dolore</a></li>
									<li class="subitem3"><a href="#">Mirum est notare quam
											littera gothica, quam nunc putamus parum claram, anteposuerit
											litterarum formas humanitatis per seacula quarta decima et
											quinta decima. Eodem modo typi, qui nunc nobis videntur parum
											clari, fiant sollemnes </a></li>
								</ul></li>
							<li class="item5"><a href="#"><img
									src="images/arrow.png" alt="">Make A Gift</a>
								<ul>
									<li class="subitem1"><a href="#">Lorem ipsum dolor sit
											amet, consectetuer adipiscing elit, sed diam nonummy nibh
											euismod tincidunt ut laoreet dolore magna aliquam erat
											volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
											tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
											commodo consequat.</a></li>
									<li class="subitem2"><a href="#"> Duis autem vel eum
											iriure dolor in hendrerit in vulputate velit esse molestie
											consequat, vel illum dolore eu feugiat nulla facilisis at
											vero eros et accumsan et iusto odio dignissim qui blandit
											praesent luptatum zzril delenit augue duis dolore</a></li>
									<li class="subitem3"><a href="#">Mirum est notare quam
											littera gothica, quam nunc putamus parum claram, anteposuerit
											litterarum formas humanitatis per seacula quarta decima et
											quinta decima. Eodem modo typi, qui nunc nobis videntur parum
											clari, fiant sollemnes </a></li>
								</ul></li>
						</ul>
					</div>
					-->

					<div class="latestproducts">
						<div class="product-one">
							<div class="col-md-4 product-left p-left">
								<div class="product-main simpleCart_shelfItem">
									<a href="single" class="mask"><img
										class="img-responsive zoom-img" src="images/p-1.png" alt="" /></a>
									<div class="product-bottom">
										<h3>Smart Watches</h3>
										<p>Explore Now</p>
										<h4>
											<a class="item_add" href="#"><i></i></a> <span
												class=" item_price">$ 329</span>
										</h4>
									</div>
									<div class="srch">
										<span>-50%</span>
									</div>
								</div>
							</div>
							<div class="col-md-4 product-left p-left">
								<div class="product-main simpleCart_shelfItem">
									<a href="single" class="mask"><img
										class="img-responsive zoom-img" src="images/p-2.png" alt="" /></a>
									<div class="product-bottom">
										<h3>Smart Watches</h3>
										<p>Explore Now</p>
										<h4>
											<a class="item_add" href="#"><i></i></a> <span
												class=" item_price">$ 329</span>
										</h4>
									</div>
									<div class="srch">
										<span>-50%</span>
									</div>
								</div>
							</div>
							<div class="col-md-4 product-left p-left">
								<div class="product-main simpleCart_shelfItem">
									<a href="single" class="mask"><img
										class="img-responsive zoom-img" src="images/p-3.png" alt="" /></a>
									<div class="product-bottom">
										<h3>Smart Watches</h3>
										<p>Explore Now</p>
										<h4>
											<a class="item_add" href="#"><i></i></a> <span
												class=" item_price">$ 329</span>
										</h4>
									</div>
									<div class="srch">
										<span>-50%</span>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 single-right">
					<div class="w_sidebar">
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
										class="checkbox"><input type="checkbox"
										name="checkbox"><i></i>Kids Watches</label> <label
										class="checkbox"><input type="checkbox"
										name="checkbox"><i></i>Men Watches</label>
								</div>
							</div>
						</section>
						<section class="sky-form">
							<h4>Brand</h4>
							<div class="row1 row2 scroll-pane">
							<!--  
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox"
										name="checkbox" checked=""><i></i>kurtas</label>
								</div>
								-->
								<div class="col col-4">
							<c:forEach var='brand' items='${brands}' varStatus='status'>
							<!--  
								<label class="checkbox"> <input type="checkbox"
									onclick='window.location.assign("productsBrand?brandName=${brand}")'
									name="checkbox"><i></i>${brand}</label>
							-->		
									<label class="radio">
									<input	type="radio" name="radio" 
									onclick='window.location.assign("productsBrand?brandName=${brand}")'><i></i>${brand}</label>
							</c:forEach>

						</div>
							</div>
						</section>
						
						<section class="sky-form">
							<h4>discount</h4>
							<div class="row1 row2 scroll-pane">
								<div class="col col-4">
									<label class="radio"><input type="radio" name="radio"
										checked=""><i></i>60 % and above</label> <label class="radio"><input
										type="radio" name="radio"><i></i>50 % and above</label> <label
										class="radio"><input type="radio" name="radio"><i></i>40
										% and above</label>
								</div>
								<div class="col col-4">
									<label class="radio"><input type="radio" name="radio"><i></i>30
										% and above</label> <label class="radio"><input type="radio"
										name="radio"><i></i>20 % and above</label> <label
										class="radio"><input type="radio" name="radio"><i></i>10
										% and above</label>
								</div>
							</div>
						</section>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--end-single-->
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