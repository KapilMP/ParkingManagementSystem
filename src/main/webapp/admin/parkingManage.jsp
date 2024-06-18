<%@page import="com.DAO.ParkingDAO"%>
<%@page import="com.DAO.ParkingDAOimpl"%>
<%@page import="com.entity.Parking"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Parking Management</title>
<%@ include file="all_links.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<!-- Display success or failed message -->
	<c:if test="${not empty successMsg}">
		<h5 class="text-center text-info">${successMsg}</h5>
		<c:remove var="successMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<h3 class="text-center p-3">Parking Details</h3>

	<form action="parkingManage.jsp" method="get" class="mb-3">
		<div class="row">
			<div class="col-md-3">
				<input type="text" name="searchQuery" class="form-control"
					placeholder="Search by Vehicle Number" value="${param.searchQuery}">
			</div>
			<div class="col-md-2">
				<button type="submit" class="btn btn-primary">Search</button>
			</div>
			<div class="col-md-2">
				<select name="resultsPerPage" class="form-control">
					<option value="5" ${param.resultsPerPage == '5' ? 'selected' : ''}>5</option>
					<option value="10"
						${param.resultsPerPage == '10' ? 'selected' : ''}>10</option>
					<option value="20"
						${param.resultsPerPage == '20' ? 'selected' : ''}>20</option>
					<option value="50"
						${param.resultsPerPage == '50' ? 'selected' : ''}>50</option>
					<option value="100"
						${param.resultsPerPage == '100' ? 'selected' : ''}>100</option>
				</select>
			</div>
			<div class="col-md-2">
				<button type="submit" class="btn btn-primary">Show Results</button>
			</div>
		</div>
	</form>

	<table class="table table-striped-columns">
		<thead class="table-primary">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Vehicle Number</th>
				<th scope="col">Vehicle Type</th>
				<th scope="col">Slot Name</th>
				<th scope="col">Phone</th>
				<th scope="col">In Time</th>
				<th scope="col">Out Time</th>
				<th scope="col">Earned Amount</th>
				<th scope="col">Paid Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			int resultsPerPage = 10;
			int currentPage = 1;
			String searchQuery = request.getParameter("searchQuery") != null ? request.getParameter("searchQuery") : "";

			if (request.getParameter("resultsPerPage") != null) {
				resultsPerPage = Integer.parseInt(request.getParameter("resultsPerPage"));
			}
			if (request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			int offset = (currentPage - 1) * resultsPerPage;

			Connection conn = null;
			int totalPages = 0; // Initialize totalPages here

			try {
				conn = DBconnect.getConnection();
				ParkingDAO dao = new ParkingDAOimpl(conn);
				List<Parking> parkingList;
				int totalRecords;

				if (searchQuery.isEmpty()) {
					parkingList = dao.getAllParking(offset, resultsPerPage);
					totalRecords = dao.getTotalParkingCount();
				} else {
					parkingList = dao.getParkingBySearchQuery(searchQuery, offset, resultsPerPage);
					totalRecords = dao.getTotalParkingCountBySearchQuery(searchQuery);
				}

				totalPages = (int) Math.ceil((double) totalRecords / resultsPerPage);

				for (Parking parking : parkingList) {
					int id = parking.getParkingid();
					String vehicleNumber = parking.getVehicle_number();
					String vehicleType = parking.getVehicle_type();
					String slotName = parking.getSlot_name();
					Timestamp createdAt = parking.getCreated_at();
					Timestamp updatedAt = parking.getUpdated_at();
					String earnedAmount = parking.getEarned_amount();
					String paidStatus = parking.getPaid_status();
					String phone = parking.getPhone();

					// Format timestamp to display in a readable format
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
					String formattedCreatedAt = createdAt.toLocalDateTime().format(formatter);
					String formattedUpdatedAt = updatedAt != null ? updatedAt.toLocalDateTime().format(formatter) : "-";
			%>
			<tr>
				<td><%=id%></td>
				<td><%=vehicleNumber%></td>
				<td><%=vehicleType%></td>
				<td><%=slotName%></td>
				<td><%=phone%></td>
				<td><%=formattedCreatedAt%></td>
				<td><%=formattedUpdatedAt%></td>
				<td><%=earnedAmount%></td>
				<td><%=paidStatus%></td>
				<td><a href="edit_parking.jsp?id=<%=id%>"
					class="btn btn-small btn-primary"> <i
						class="fa-solid fa-pen-to-square"></i> Edit
				</a> <a href="../deleteParking?id=<%=id%>"
					class="btn btn-small btn-danger"> <i class="fa-solid fa-trash"></i>
						Delete
				</a></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			if (conn != null) {
			try {
				conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			}
			}
			%>

		</tbody>
	</table>

	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-center">
			<%
			if (currentPage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="parkingManage.jsp?page=<%=currentPage - 1%>&resultsPerPage=<%=resultsPerPage%>&searchQuery=<%=searchQuery%>"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<%
			}
			%>
			<%
			for (int i = 1; i <= totalPages; i++) {
			%>
			<li class="page-item <%=(i == currentPage) ? "active" : ""%>">
				<a class="page-link"
				href="parkingManage.jsp?page=<%=i%>&resultsPerPage=<%=resultsPerPage%>&searchQuery=<%=searchQuery%>"><%=i%></a>
			</li>
			<%
			}
			%>
			<%
			if (currentPage < totalPages) {
			%>
			<li class="page-item"><a class="page-link"
				href="parkingManage.jsp?page=<%=currentPage + 1%>&resultsPerPage=<%=resultsPerPage%>&searchQuery=<%=searchQuery%>"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
			<%
			}
			%>
		</ul>
	</nav>


</body>
</html>