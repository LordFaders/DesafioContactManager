<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>ContactManager</title>
<script type="text/javascript">
	var idSelect = 0;
	function submitFormAction(action, method){
		document.getElementById("frmAcciones").action = action;
		document.getElementById("frmAcciones").method = method;
		document.getElementById("frmAcciones").submit();
	}
	
	function setIdSelect(id){
		idSelect = id;
	}
	
	function deleteRow(){
		alert(idSelect);
		document.getElementById("frmAcciones").action = "/contactManager/borrarContacto/?id=" + idSelect;
		document.getElementById("frmAcciones").method = "GET";
		document.getElementById("frmAcciones").submit();
		
		window.location.href = "/contactManager/borrarContacto/?id=" + idSelect;
	}
</script>
</head>
<body>
<div class="container">
	<form:form id="frmAcciones" modelAttribute="contacto">
		<div>
			<fieldset>
				<legend class="text text-center fw-bold my-5">Mantenedor de Contactos</legend>
				<div class="container col-8">
							<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" >Nombre</span>
  </div>
  <input type="text" class="form-control" id="nombre" name="nombre">
  <div class="input-group-prepend">
    <span class="input-group-text" id="">Apellido Paterno</span>
  </div>
  <input type="text" class="form-control" id="apellidoPaterno" name="apellidoPaterno">
   <div class="input-group-prepend">
    <span class="input-group-text" id="">Apellido Materno</span>
  </div>
  <input type="text" class="form-control" id="apellidoMaterno" name="apellidoMaterno">
</div>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="">Dirección</span>
  </div>
  <input type="text" class="form-control" id="direccion" name="direccion">
  <div class="input-group-prepend">
    <span class="input-group-text" id="">Teléfono</span>
  </div>
  <input type="text" class="form-control" id="telefono" name="telefono">
</div>
		<div class="btn mt-1">	
		<button type="button" class="btn btn-success" value="Agregar" onclick="submitFormAction('/contactManager/crearContacto', 'post')">Agregar</button>
		<button type="button" class="btn btn-danger" value="Eliminar" onclick="deleteRow()">Eliminar</button>
			</div>			
					
			</div>
			</fieldset>

		</div>
	</form:form>
	
	<div class="container col-8">
	<fieldset>
	<legend class="text text-center fw-bold mt-5">Lista de contactos</legend>
		<div>
			<table class="table">
			<tr>
				<th></th>
				<th>Id</th>
				<th>Nombre</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Dirección</th>
				<th>Teléfono</th>
			</tr>
			<tbody>
				<c:forEach items="${listaContactos}" var="contacto" >
					<tr>
						<td><input type="radio" id="optSelectRow${contacto.id}" name="optSelectRow" onclick="setIdSelect(${contacto.id})"/></td>
						<td>${contacto.id}</td>
						<td>${contacto.nombre}</td>
						<td>${contacto.apellidoPaterno}</td>
						<td>${contacto.apellidoMaterno}</td>
						<td>${contacto.direccion}</td>
						<td>${contacto.telefono}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</fieldset>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>