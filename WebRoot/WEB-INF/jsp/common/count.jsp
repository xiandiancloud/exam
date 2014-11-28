<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class='row'>
		<div class='col-xs-12'>
			<div class='row'>
				<div class="col-xs-12">
					<div class="box ">
						<div class="box-content">
							<div class='row'>
								<div class="col-xs-12">
									<h2>${exam.name}</h2>
								</div>
							</div>
							<div class='row'>
								<div class="col-xs-12">
									<hr class="hr-normal">
								</div>
								<div class="col-xs-3">
									<div class="advance ">
										<span class="totalScore" id="usercount"></span>分
									</div>
									<div class="center">该分数不同于真实成绩，仅代表预测分数。总分<strong>${score}</strong>分</div>
								</div>
								<div class="col-xs-9">
								<table class='table table-bordered' style='background-color:#f9f9f9'>
									<tbody>
										<tr>
											<td></td>
											<c:forEach var="ued" items="${uedlist}">
											<td>${ued.name}</td>
											</c:forEach>
										</tr>
										<tr>
											<td>答对</td>
											<c:forEach var="ued" items="${uedlist}">
											<th>${ued.right}</th>
											</c:forEach>
										</tr>
										<tr>
											<td>答错</td>
											<c:forEach var="ued" items="${uedlist}">
											<th>${ued.wrong}</th>
											</c:forEach>
										</tr>
										<tr>
											<td>未答</td>
											<c:forEach var="ued" items="${uedlist}">
											<th>${ued.noanswer}</th>
											</c:forEach>
										</tr>
										<tr>
											<td>得分</td>
											
											<c:forEach var="ued" items="${uedlist}">
											<th>${ued.cscore}</th>
											</c:forEach>
											</tr>
										</tbody>
									</table>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
	</div>
</div>