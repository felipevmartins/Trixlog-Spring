<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<c:url value='/styles/custom.css'></c:url>">
<script type="text/javascript"
	src="<c:url value='/scripts/jquery-2.1.1.js'></c:url>"></script>
<script type="text/javascript"
	src="<c:url value='/scripts/custom.js'></c:url>"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Trixlog</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="../home">Home <span
							class="sr-only">(current)</span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Locations
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../location/novo">Cadastrar</a></li>
							<li><a href="../location/editar">Editar</a></li>
							<li><a href="../location/deletar">Excluir</a></li>
							<li><a href="../location/listar">Listar</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Tags
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../tag/novo">Cadastrar</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div
		class="list-group col-xs-5 col-sm-5 col-md-5 col-lg-5 lista-locations">
		<ul>
			<li class="list-group-item active">Lista de Locations Deletaveis
			</li>
			<c:forEach var="location" items="${listaLocations}">
				<a onclick="clicadeletarlocation(${location.id});"
					class="list-group-item link-lista-item"> <c:out
						value="${location.name }"></c:out>
				</a>
			</c:forEach>
		</ul>
	</div>
	<div id="deletar-location"
		class="alterar col-xs-6 col-sm-6 col-md-6 col-lg-6 hidden">
		<form:form role="form" id="deletar-location-form"
			class="col-lg-6 cadatro-locations" method="delete" action="">
			<div class="form-group col-lg-12">
				<label for="nome">Nome</label> <input type="text"
					class="form-control" id="nome" placeholder="Nome"
					name="name">
			</div>
			<div class="form-group col-lg-12">
				<label for="latitude">Latitude</label> <input type="text"
					class="form-control" id="latitude" placeholder="Latitude"
					name="latitude">
			</div>
			<div class="form-group col-lg-12">
				<label for="longitude">Longitude</label> <input type="text"
					class="form-control" id="longitude" placeholder="Longitude"
					name="longitude">
			</div>
			<button type="submit" class="btn btn-default" name="_method"
				value="DELETE">Deletar</button>
		</form:form>
	</div>
</body>
</html>