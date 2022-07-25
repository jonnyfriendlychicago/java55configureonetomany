<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/include/head.jsp" />

<body>
	<jsp:include page="/WEB-INF/include/header.jsp" />
		
	<div id=pageHeader class="container-fluid">
		<h2>Publication Management</h2>
	</div>
	
	<div id=main class="container-fluid">
		<div id=list class="container-fluid">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">id</th>
						<th scope="col">pubTitle</th>
						<th scope="col">pubAuthor</th>
						<!-- <th scope="col">Dojo</th> -->
						<th scope="col">Created By</th>
						<th scope="col">actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="record" items="${publicationList}">
						<tr>
							<td>${record.id}</td>
							<td><a href="/publication/${record.id}">${record.pubTitle}</a></td>
							<td>${record.pubAuthor}</td>
							<td>${record.userMdl.userName} </td>
							<td>
								<div class="buttonArrange1"> 
<%-- 
									<c:choose>
										<c:when test="${user.id == record.userMdl.id }">
											<a href= "/publication/${record.id}/edit"><button class="btn btn-secondary">Edit</button></a>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose> 
 								
 									<c:choose>
										<c:when test="${user.id == record.userMdl.id }">
											<form action="/publication/${record.id}" method="post">
											    <input type="hidden" name="_method" value="delete">
											    <button class="btn btn-danger">Delete</button>
											</form>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
--%>
								</div>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
 
		<div id=form class="container-fluid">
			<h2>Edit Publication</h2>
	
			<form:form action='/publication/${publication.id}/edit' method='post' modelAttribute='publication'>
	
				<form:input type="hidden" value="${publication.id}" path="id" />
				
				<form:input type="hidden" value="${publication.userMdl.id}" path="userMdl" />
		
				<div class="form-group">
					<form:label path="pubTitle" for="pubTitle">pubTitle</form:label>
					<form:input type="text" class="form-control" path="pubTitle"/>
					<p class="errorText"><form:errors path="pubTitle" />
					</p>
				</div>
		
				<div class="form-group">
					<form:label path="pubAuthor" for="pubAuthor">pubAuthor</form:label>
					<form:input type="text" class="form-control" path="pubAuthor" />
					<p class="errorText"><form:errors path="pubAuthor" /></p>
				</div>
				
 	
				<%-- <div class="form-group">
					<p>
						<form:label path="dojoMdl" for="dojoMdl">Dojo:</form:label>
					</p>
					<form:select path="dojoMdl" name="dojoMdl">
	 					<c:forEach var="record" items="${dojoList}">
							<c:choose>
								<c:when test="${publication.dojoMdl.id == record.id}">
									<option value="${record.id}" selected>
										<c:out value="${record.dojoName}"/>
									</Option>
								</c:when>
								<c:otherwise>
									<option value="${record.id}">
										<c:out value="${record.dojoName}" />
									</Option>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
					</form:select>
				</div> --%>
	 
				<div class="form-group">
					<form:label path="thoughtsOnPub" for="thoughtsOnPub">thoughtsOnPub</form:label>
					<form:textarea type="text" class="form-control" path="thoughtsOnPub" />
					<p class="errorText"><form:errors path="thoughtsOnPub" /></p>
				</div> 	
				
				<div>
					<button type="submit" class="btn btn-primary">Update</button>
				</div>
			</form:form>
	
			<a href="/publication"><button class="btn btn-secondary">Cancel</button></a>
		</div>
	  
	</div>
	<div id=footer class="container-fluid">
		<p class="footerText">Powered by Coding Dojo</p>
	</div>
	
	
</body>
</html>