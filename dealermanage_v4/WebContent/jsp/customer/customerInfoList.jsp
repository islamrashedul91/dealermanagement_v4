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
	var id = document.getElementsByName('customer_id');
	var idValue;
	for(var i = 0; i < id.length; i++){
	    if(id[i].checked){
	    	idValue = id[i].value;
	    }
	}
	
	//for update [S]
	var updatePathWithIdValue = "${pageContext.request.contextPath}/CustomerInfoController?action=edit&customer_id="+idValue;
	//for update [E]
	//for delete [S]
	var deletePathWithIdValue = "${pageContext.request.contextPath}/CustomerInfoController?action=delete&customer_id="+idValue;
	//for delete [E]
	//for enquiry [S]
	var enquiryPathWithIdValue = "${pageContext.request.contextPath}/CustomerInfoController?action=enquiry&customer_id="+idValue;
	//for enquiry [E]
	
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
	} else {
		alert("Please select a Customer ID!!");
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
					<li class="title"><a href="">Customer List</a></li>
					<li class="bread"><a href="">Dashboard > Customer
							Management > Customer List</a></li>
				</ul>
			</div>
			<br>
<div class="card">
	<table id="example" class="display" style="width: 100%; font-size: 13px;">
		<thead>
			<tr>
				<th  Class ="HeaderTH"></th>
				<th Class ="HeaderTH">Customer ID</th>
				<th Class ="HeaderTH">Customer Name</th>
				<!-- <th Class ="HeaderTH">Customer Description</th> -->
				<th Class ="HeaderTH">Customer Type</th>
				<!-- <th Class ="HeaderTH">Customer Start Since</th> -->
				<th Class ="HeaderTH">Father Name</th>
				<th Class ="HeaderTH">Mother Name</th>
				<th Class ="HeaderTH">NID No.</th>
				<th Class ="HeaderTH">DOB</th>
				<!-- <th Class ="HeaderTH">Occupation</th> -->
				<th Class ="HeaderTH">Country ID</th>
				<th Class ="HeaderTH">Mobile</th>
				<th Class ="HeaderTH">Email</th>
				<!-- <th Class ="HeaderTH">Account ID</th> -->
				<!-- <th Class ="HeaderTH">Home Address</th> -->
				<!-- <th Class ="HeaderTH">Office Address</th>
				<th Class ="HeaderTH">Profession</th>
				<th Class ="HeaderTH">Password</th> -->
				<th Class ="HeaderTH">Status</th>
				<!-- <th Class ="HeaderTH">Created</th>
				<th Class ="HeaderTH">Updated</th> -->
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${customerInfos}" var="ci"> 
				<tr>
					<td Class ="FormInputColor"><input type="radio" name="customer_id" id="customer_id" value="${ci.customer_id}" onclick="javascript: getRadioValue();" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.customer_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.customer_name}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.customer_desc}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${ci.customer_type}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.customer_start_date}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${ci.father_name}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.mother_name}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.nid}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.dob}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.occupation}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${ci.country_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.mobile}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.email}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.account_id}" /></td> --%>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.home_address}" /></td> --%>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.office_address}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.profession}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.password}" /></td> --%>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.status}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${ci.status == 'A' ? 'Active' : ci.status == 'B' ? 'Blocked' : ci.status == 'C' ? 'Closed' : ''} "/></td>
					<%-- <td Class ="FormInputColor"><c:out value="${ci.created}" /></td>
					<td Class ="FormInputColor"><c:out value="${ci.updated}" /></td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
<input type="hidden" name="val" id="val" value="" />
	<table align="center" width="100%">
			
				<tr>
					<td><hr align=left width="100%" color=#003399>
					<br>
					<a Class ="button" href="${pageContext.request.contextPath}/CustomerInfoController?action=save">add</a>
					<a id="update" Class ="button" href="" onclick="javascript: getRadioValue();">update</a>
					<a id="delete" Class ="button" href="" onclick="javascript: getRadioValue();">delete</a>
					<a id="enquiry" Class ="button" href="" onclick="javascript: getRadioValue();">enquiry</a>
					<a Class ="button" href="${pageContext.request.contextPath}/load_modules.jsp">Return</a></td>
				</tr>
	</table>
	</div>
</div><!-- mcontent -->
	
</div><!-- main -->
	
</body>
</html>