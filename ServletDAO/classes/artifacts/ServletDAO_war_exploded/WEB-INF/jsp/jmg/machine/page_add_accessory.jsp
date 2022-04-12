<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<c:set var="lang" value="${pageContext.request.locale.language}"/>
<fmt:setLocale value="${lang}"/>
<fmt:setBundle basename="main.messages"/>
<html lang="${lang}">
	<head>
        <title>Add Accessory Machine Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
		<div class="container-fluid">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a class="text-success" href="<c:url value="/"/>">Home</a></li>
					<li class="breadcrumb-item"><a class="text-success" href="<c:url value = "/web/family/show"/>"><fmt:message key="label.family"/></a></li>
					<li class="breadcrumb-item"><a class="text-success" href="<c:url value="/web/machine/show"><c:param name="family" value="${requestScope.machine.family.id}"/></c:url>"><fmt:message key="label.machine"/></a></li>
					<li class="breadcrumb-item"><a class="text-success" href="<c:url value="/web/machine/details"><c:param name="id" value="${requestScope.machine.id}"/></c:url>"><fmt:message key="label.details"/></a></li>
					<li class="breadcrumb-item active" aria-current="page"><fmt:message key="label.inseretAccessory"/></li>
				</ol>
			</nav>
			<h2 class="font-weight-light"><fmt:message key="label.machine"/>: <c:out value="${requestScope.machine.name.get(lang.toString())}"/></h2>
			<c:if test = "${!requestScope.insert}">
				<div class="alert alert-danger" role="alert">
					<c:out value="${requestScope.message.get(lang.toString())}"/>
				</div>
			</c:if>
			<form action="<c:url value="/web/machine/AddAccessory"/>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="machine" value="${requestScope.machine.id}">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col">
							<label class="font-weight-bold" for="inlineFormAccessorySelect"><fmt:message key="label.selectAccessory"/></label>
							<select id="inlineFormAccessorySelect" class="custom-select mr-sm-2"  name="accessory" required>
								<option selected value = ""><fmt:message key="label.accessory"/></option>
								<c:forEach items="${requestScope.accessories}" var="a">
									<option value="${a.id}"><c:out value="${a.name.get(lang.toString())}"/></option>
								</c:forEach>
							</select>
						</div>
						<div class="col">
							<p class="font-weight-bold"><label for="inputPredefined"><fmt:message key="label.predefined"/></label></p>
							<div id="inputPredefined" class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline1" name="predefined" value="true" class="custom-control-input">
								<label class="custom-control-label" for="customRadioInline1"><fmt:message key="label.true"/></label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline2" name="predefined" value="false" class="custom-control-input" checked>
								<label class="custom-control-label" for="customRadioInline2"><fmt:message key="label.false"/></label>
							</div>
						</div>
					</div>
					<br>
					<div class="row justify-content-center">
						<div class="col">
							<label class="font-weight-bold" for="inputWeight"><fmt:message key="label.weight"/></label>
							<input id="inputWeight" type="number" step="any" value="0" name="weight" class="form-control" placeholder="kg">
						</div>
						<div class="col">
							<label class="font-weight-bold" for="inputLength"><fmt:message key="label.length"/></label>
							<input id="inputLength" type="number" step="any" value="0" name="length" class="form-control" placeholder="mt">
						</div>
						<div class="col">
							<label class="font-weight-bold" for="inputDistance"><fmt:message key="label.distance"/></label>
							<input id="inputDistance" type="number" step="any" value="0" name="distance" class="form-control" placeholder="mt">
						</div>
					</div>
					<br>
					<div class="row justify-content-center">
						<div class="col">
							<label class="font-weight-bold" for="inputHeadOffset"><fmt:message key="label.headOffset"/></label>
							<div id="inputHeadOffset" class="form-row">
								<c:forEach var="i" begin="0" end="3">
									<div class="form-group col-md-6">
										<input type="number" name="position${i}" class="form-control" value="" placeholder="Position">
									</div>
									<div class="form-group col-md-6">
										<input type="number" name="offset${i}" class="form-control" value="" placeholder="Offset">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<br>
					<div class="custom-file">
						<input type="file" name="uploadFile" class="custom-file-input" id="validatedInputGroupCustomFile" placeholder="Image">
						<label class="custom-file-label" for="validatedInputGroupCustomFile"><fmt:message key="label.selectImage"/></label>
					</div>
					<br>
					<br>
					<button type="submit" class="btn btn btn-outline-success btn-lg btn-block"><fmt:message key="label.enter"/></button>
				</div>
			</form>
		</div>
	</body>
</html>