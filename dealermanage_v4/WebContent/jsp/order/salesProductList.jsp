<%
if (session.getAttribute("username") == null)
	response.sendRedirect("../../login.jsp");
%>
<jsp:include page="../../base.jsp"></jsp:include>
<br>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/copytest.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/table.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/dataTables/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css">
	
<title>onlinep</title>
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/css/table.css">

<script type="text/javascript">

$(document).ready(function() {
	$('#example').DataTable();
});

function getRadioValue()
{
	var id = document.getElementsByName('sales_product_id');
	var idValue;
	for(var i = 0; i < id.length; i++){
	    if(id[i].checked){
	    	idValue = id[i].value;
	    }
	}
	
	//for update [S]
	var updatePathWithIdValue = "${pageContext.request.contextPath}/SalesProductController?action=edit&sales_product_id="+idValue;
	//for update [E]
	//for delete [S]
	var deletePathWithIdValue = "${pageContext.request.contextPath}/SalesProductController?action=delete&sales_product_id="+idValue;
	//for delete [E]
	//for enquiry [S]
	var enquiryPathWithIdValue = "${pageContext.request.contextPath}/SalesProductController?action=enquiry&sales_product_id="+idValue;
	//for enquiry [E]
	//for cancel [S]
	//var cancelPathWithIdValue = "${pageContext.request.contextPath}/SalesProductController?action=cancel&sales_product_id="+idValue;
	//for cancel [E]
	//for approve [S]
	/* var approvePathWithIdValue = "${pageContext.request.contextPath}/SalesProductController?action=approve&sales_product_id="+idValue; */
	//for approve [E]
	//for delivery return [S]
	/* var deliveryReturnPathWithIdValue = "${pageContext.request.contextPath}/SalesProductController?action=deliveryReturn&sales_product_id="+idValue; */
	//for delivery return [E]
	
	if (idValue !=null) {
		//for update [S]
		document.getElementById('update').href = updatePathWithIdValue;
		//for update [E]
		//for delete [S]
		document.getElementById('delete').href = deletePathWithIdValue;
		//for delete [E]
		//for enquiry [S]
		document.getElementById('enquiry').href = enquiryPathWithIdValue;
		//for enquiry [E]
		//for cancel [S]
		//document.getElementById('cancel').href = cancelPathWithIdValue;
		//for cancel [E]
		//for approve [S]
		/* document.getElementById('approve').href = approvePathWithIdValue; */
		//for approve [E]
		//for delivery return [S]
		/* document.getElementById('deliveryReturn').href = deliveryReturnPathWithIdValue; */
		//for delivery return [E]
	} else {
		alert("Please select a ID !!");
		return false;
	}
}

</script>
</head>
<body>

<%
String message = (String) request.getAttribute("success");
%>
	<table align="center">
				<%
				if(message!=null) {
				%>
				<tr>
					<th Class="HeaderTH"><%=message %></th>
				</tr>
				<%
				}
				%>
	</table>
	<br>
<div class="mcontent">
			<div class="titlenav">
			<ul>
					<li class="title"><a href="${pageContext.request.contextPath}/jsp/order/salesProduct.jsp">Sales Product List</a></li>
					<li class="bread"><a href="">Dashboard > Order 
							Management > Sales List > Sales Product List</a></li>
				</ul>
			</div>
			<br>
<div class="card">
	<table class="display" style="width: 100%" cellspacing="10">			
		<tr>
			<td Class ="FormCellColor">Sales ID</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${sales_id}" /></td>
			<td Class ="FormCellColor">Requisition ID</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${requisition_id}" /></td>
			<td Class ="FormCellColor">DateTime</td>
			<%-- <td Class ="FormInputColor" colspan="2"><c:out value="${strDateTime}" /></td> --%>
			<td Class ="FormInputColor" colspan="2">
				<fmt:parseDate pattern="yyyyMMddHHmmss" value="${strDateTime}" var="parsedDate" />
				<fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy HH:mm:ss" />
			</td>
			<td Class ="FormCellColor">Customer Name</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${customer_name}" /></td>
			<td Class ="FormCellColor">Mobile</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${mobile}" /></td>
			<td Class ="FormCellColor">Total Amount</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${sumTotalAmount}" /></td>
		</tr>
	</table>
</div>
			<br>
<div class="card">
	
	<table id="example" class="display" style="width: 100%; font-size: 13px;">
		<thead>
			<tr>
				<th  Class ="HeaderTH"></th>
				<th Class ="HeaderTH">Sales Product ID</th>
				<th Class ="HeaderTH">Product Requisition ID</th>
				<th Class ="HeaderTH">Requisition ID</th>
				<th Class ="HeaderTH">DateTime</th>
				<!-- <th Class ="HeaderTH">Product ID</th> -->
				<th Class ="HeaderTH">Product Name</th>
				<!-- <th Class ="HeaderTH">Pack Type</th>
				<th Class ="HeaderTH">Pack Size</th>
				<th Class ="HeaderTH">Pieces</th>
				<th Class ="HeaderTH">Bonus ID</th>
				<th Class ="HeaderTH">Bonus Name</th> -->
				<!-- <th Class ="HeaderTH">Order Pack</th> -->
				<th Class ="HeaderTH">Order Quantity</th>
				<th Class ="HeaderTH">MRP</th>
				<th Class ="HeaderTH">Total MRP</th>
				<th Class ="HeaderTH">Discount Amount</th>
				<th Class ="HeaderTH">Total Amount</th>
				<th Class ="HeaderTH">Order Status</th>
				<th Class ="HeaderTH">Delivery Status</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${salesProducts}" var="sp"> 
				<tr>
					<td Class ="FormInputColor"><input type="radio" name="sales_product_id" id="sales_product_id" value="${sp.sales_product_id}" onclick="javascript: getRadioValue();" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.sales_product_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.requisition_product_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.requisition_id}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.date_time}" /></td> --%>
					<td Class ="FormInputColor">
						<fmt:parseDate pattern="yyyyMMddHHmmss" value="${sp.date_time}" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy HH:mm:ss" />
					</td>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.product_id}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${sp.product_name}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.pack_type}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.pack_size}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.piceces}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.bonus_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.bonus_name}" /></td> --%>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.order_pack}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${sp.order_quantity}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.mrp_price}" /> <br>Unit Price</td>
					<td Class ="FormInputColor"><c:out value="${sp.total_mrp_price}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.discount_amt}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.total_amount}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.order_status}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${sp.order_status == 'P' ? 'Pending' : sp.order_status == 'A' ? 'Approved' : sp.order_status == 'C' ? 'Cancel' : sp.order_status == 'S' ? 'Success' : ''}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${r.delivery_status}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${sp.delivery_status == 'P' ? 'Pending' : sp.delivery_status == 'D' ? 'Delivered' : sp.delivery_status == 'C' ? 'Cancel' : sp.delivery_status == 'S' ? 'Success' : sp.delivery_status == 'R' ? 'Return' : ''}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- for get Data from Multi Requisition [S] -->
	<input type="hidden" name="sales_id" id="sales_id" value="${sales_id}">
	<input type="hidden" name="sales_type" id="sales_type" value="${sales_type}">
	<input type="hidden" name="requisition_id" id="requisition_id" value="${requisition_id}">
	<input type="hidden" name="strDateTime" id="strDateTime" value="${strDateTime}">
	<input type="hidden" name="customer_name" id="customer_name" value="${customer_name}">
	<input type="hidden" name="mobile" id="mobile" value="${mobile}">
	<%
	String sales_id = (String)request.getAttribute("sales_id");
	String sales_type = (String)request.getAttribute("sales_type");
	String requisition_id = (String)request.getAttribute("requisition_id");
	String strDateTime = (String)request.getAttribute("strDateTime");
	String customer_name = (String)request.getAttribute("customer_name");
	String mobile = (String)request.getAttribute("mobile");
	
	HttpSession session1 = request.getSession();
	session1.setAttribute("sales_id", sales_id);
	session1.setAttribute("sales_type", sales_type);
	session1.setAttribute("requisition_id", requisition_id);
	session1.setAttribute("strDateTime", strDateTime);
	session1.setAttribute("customer_name", customer_name);
	session1.setAttribute("mobile", mobile);
	%>
	<!-- for get Data from Multi Requisition [E] -->
	<br>
<input type="hidden" name="val" id="val" value="" />
	<table align="center" width="100%">
			
				<tr>
					<td><hr align=left width="100%" color=#003399>
					<br>
					<a Class ="button" href="${pageContext.request.contextPath}/SalesProductController?action=save">add</a>
					<a id="update" Class ="button" href="" onclick="javascript: getRadioValue();">update</a>
					<!-- <a id="approve" Class ="button" href="" onclick="javascript: getRadioValue();">approve</a> -->
					<!-- <a id="cancel" Class ="button" href="" onclick="javascript: getRadioValue();">cancel</a> -->
					<a id="delete" Class ="button" href="" onclick="javascript: getRadioValue();">delete</a>
					<a id="enquiry" Class ="button" href="" onclick="javascript: getRadioValue();">enquiry</a>
					<!-- <a id="deliveryReturn" Class ="button" href="" onclick="javascript: getRadioValue();">Delivery Return</a> -->
					<%-- <a Class ="button" href="${pageContext.request.contextPath}/requisitionMulti.jsp">Return</a></td> --%>
					<%-- <a Class ="button" href="${pageContext.request.contextPath}/SalesMainController?action=salesMainList&sales_id=${sales_id}&customer_name=${customer_name}&mobile=${mobile}">Return</a></td> --%>
					<a Class ="button" href="${pageContext.request.contextPath}/jsp/order/salesMain.jsp">Return</a></td>
				</tr>
	</table>
	</div>
</div><!-- mcontent -->
	
</div><!-- main -->
	
</body>
</html>