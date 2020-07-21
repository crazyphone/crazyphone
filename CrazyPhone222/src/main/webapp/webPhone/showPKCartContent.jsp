<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet'
	href='http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css'
	type='text/css' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type='text/css' />
<title>車拚</title>
</head>
<body>
	<div align='center'>
		<h2>車拚</h2>
		
		<hr>
		<table border='1'>
			<tr>
				<td width='100' align='center'><a href='index'>回首頁</a></td>
				<td width='200' align='center'><a href='products2'>回上一頁</a></td>
				<td width='200' align='center'><a href='removePKCart'>取消車拚</a></td>
			</tr>

		</table>
		<hr>
		<table border='1'>
			<c:choose>
				<c:when test='${PKCart.itemNumber > 0 }'>
					<c:set var="sum" value="0"></c:set>
					<c:forEach var='product' items='${PKCart.content}'>
						<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
							<div class="thumbnail" style="width: 320px; height: 340px">
								<!-- 								<img width='100' height='200' -->
								<%-- 									src="<c:url value='/getPicture/${product.productID}' />" /> --%>
								<div class="caption">
									<p>
										<b style='font-size: 16px;'>${product.value.productBean.productName}</b>
									</p>
									<p>單價:${product.value.productBean.unitPrice}元</p>
									<p>上市日期:${product.value.productBean.releasedDate}</p>
									<p>規格</p>
									<p>處理器:${product.value.specBean.processor}</p>
									<p>儲存空間:${product.value.specBean.storage}</p>
									<p>電池容量:${product.value.specBean.batteryCapacity}</p>
									<p>螢幕尺寸:${product.value.specBean.displaySize}</p>
									<p>螢幕解析度:${product.value.specBean.displayResolution}</p>
									<p>主相機畫素:${product.value.specBean.rearCamera}</p>
									<p>前相機畫素:${product.value.specBean.frontCamera}</p>


								</div>
							</div>
						</div>
					</c:forEach>

				</c:when>
				<c:otherwise>
					<tr colspan='5'>
						<td>您尚未選擇任何商品</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>


		<hr>
	</div>
</body>
</html>