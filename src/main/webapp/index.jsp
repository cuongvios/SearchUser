<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
 
<html>
  <head>
  	<style>
  		#customers: {
  			padding-top: 25px;
  		}
  	</style>
  </head>
  <body>
    <br/><br/>
    <form method="post" name="frm" action="Search">
      <table border="1" width="300px" align="center">
        <tr>
	        <td colspan=2 style="font-size:12pt;" align="center">
	        <h3>Search Customer</h3>
	        </td>
        </tr>
        <tr>
	        <td >
	        	<b>Name</b>
	        </td>
          	<td>: 
          	<input  type="text" name="name" id="name">
        	</td>
        </tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>
    <sql:setDataSource var="customer"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/congviec"
	user="root" password=""/>
	<sql:query dataSource="${customer}" var="listCustomer">
        SELECT * from customer;
    </sql:query>
    <table id="customers" width="700px" align="center"
               style="border:1px solid #000000;">
    		<tr>
                <td colspan=4 align="center"
                    style="background-color:teal">
                    <b>Customer</b></td>
            </tr>
            <tr style="background-color:lightgrey;">
                <td><b>Id</b></td>
                <td><b>Name</b></td>
                <td><b>Age</b></td>
                <td><b>Address</b></td>
            </tr>
        <c:forEach var="row2" items="${listCustomer.rows}">
            <tr style="background-color:#F9EBB3;">               
                <td><c:out value="${row2.id}" /></td>
                <td><c:out value="${row2.name}" /></td>
                <td><c:out value="${row2.age}" /></td> 
                <td><c:out value="${row2.address}" /></td>           
            </tr>
        </c:forEach>
    </table>
  </body>
</html>