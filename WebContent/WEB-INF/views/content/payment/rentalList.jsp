<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<br>
<div class="container" style="width: 100%">
	<form:form commandName="" class="form-horizontal" action="">
		<fieldset>
			<legend>账单结算</legend>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>房间名称</th>
						<th>客户姓名</th>
						<th>下次结算日期</th>
						<th>网络使用情况</th>
						<th>基本房租</th>
						<th>押金</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rentalList}" var="rental" varStatus="status">
						<tr>
							<td>${rental.room.name}</td>
							<td>${rental.customerName }</td>
							<td><fmt:formatDate value="${rental.nextPayDate }" pattern="yyyy年MM月dd日" /></td>
							<c:if test="${rental.hasNet == true }"><td>使用中</td></c:if>
							<c:if test="${rental.hasNet == false }"><td>未使用</td></c:if>
							<td>${rental.basePayment } 元</td>
							<td>${rental.deposit } 元</td>
							<td>
								<a href="../rental/view/${rental.id }" class="btn btn-info">详细</a>
								<c:if test="${rental.isValid == true}">
									<a href="../payment/create?rentalId=${rental.id }&isClose=false" class="btn btn-warning">月结</a>
									<a href="../payment/create?rentalId=${rental.id }&isClose=true" class="btn btn-warning">退房</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
	</form:form>
</div>
