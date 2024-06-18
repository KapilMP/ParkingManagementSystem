<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Rates</title>
<%@ include file="all_links.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>



	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Rates</h4>
						<form>

							<div class="mb-3 from-group">
								<label for="exampleInputEmail1">Rate Name*</label> <input
									name="sname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp">
							</div>

							<div class="mb-3 from-group">
								<label for="exampleInputEmail1">Category*</label> <input
									name="sname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp">
							</div>

							<div class="mb-3 form-group">
								<label for="inputState"> Type*</label> <select id="inputState"
									name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Hourly</option>
									<option value="Inactive">Fixed</option>
								</select>
							</div>


							<div class="mb-3 from-group">
								<label for="exampleInputEmail1">Rate*</label> <input
									name="sname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp">
							</div>

							<div class="mb-3 form-group">
								<label for="inputState"> Slot Status*</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div>
								<button type="submit" class="btn btn-primary">Add</button>
								<button type="submit" class="btn btn-warning">Back</button>
							</div>

						</form>

					</div>

				</div>


			</div>


		</div>
	</div>
</body>
</html>