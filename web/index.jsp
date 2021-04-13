<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Producto"%>
<%@page import="com.emergentes.modelo.GestorProducto"%>

<%
    if(session.getAttribute("almacen") == null){
        GestorProducto objeto1 = new GestorProducto();
        objeto1.insertarProducto(new Producto(1, "CocaCola", 8.5, 100));
        objeto1.insertarProducto(new Producto(2, "Pepsi", 11, 50));
        objeto1.insertarProducto(new Producto(3, "Frack", 6, 100));
        objeto1.insertarProducto(new Producto(4, "Serranitas", 2.5, 80));
        
        session.setAttribute("almacen", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>PRODUCTOS</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Modificar</th>
                <th>Cantidad</th>
            </tr>
            <c:forEach var="item" items="${sessionScope.almacen.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.producto}</td>
                    <td>${item.precio}</td>
                    <td>${item.cantidad}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
