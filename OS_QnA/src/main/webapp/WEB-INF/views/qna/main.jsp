<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/module/header.jsp" %>  

<div class="wrapper">
<!-- Content Wrapper. Contains page content -->    
	<div class="card">
		<div style="width:800px; height:200px; margin-left:auto; margin-right:auto;
					background-color:lightgray;
					border-radius:40px 40px / 40px 40px;">			
			<div class="col-sm-6" style=>
	  				<h1>Q&A</h1>  				
	  		</div>
		</div>

	 
	 
   	<section class="content">
   		<div class="card">
   			<div class="card-header with-border">
   					<button type="button" class="btn btn-primary" onclick="OpenWindow('registForm','회원등록',700,800);" >글 작성</button>
   				<div id="keyword" class="card-tools" style="width:550px;">
   					 <div class="input-group row">
   					 	<!-- search bar -->
   					 	<!-- sort num -->
					  	<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="">					  		  		
					  		<option value="10">정렬개수</option>
					  		<option value="2" ${pageMaker.perPageNum eq 2 ? 'selected':'' }>2개씩 정렬</option>
					  		<option value="3" ${pageMaker.perPageNum eq 3 ? 'selected':'' }>3개씩 정렬</option>
					  	</select>
					  	
					  	<!-- search bar -->
					 	<select class="form-control col-md-3" name="searchType" id="searchType">
					 		<option value=""  >검색구분</option>
							<option value="n" ${pageMaker.searchType eq 'n' ? 'selected':'' }>이 름</option>			 									
						</select>
						<!-- keyword -->
   					 	<input  class="form-control" type="text" name="keyword" 
   					 			placeholder="검색어를 입력하세요." value="${pageMaker.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="search_list(1);"
									id="searchBtn" data-card-widget="search" >
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					<!-- end : search bar -->		 
   					 </div>
   				</div>   			
   			</div>
   			<div class="card-body" style="text-align:center;">
    		  <div class="row">
	             <div class="col-sm-12">	
		    		<table class="table table-bordered">
		    			<tr>
		    				<th>작성자</th>
		                	<th>제목</th>
		                	<th>등록날짜</th> <!-- yyyy-MM-dd  -->
		               	</tr>
		            </table>
    		     </div> <!-- col-sm-12 -->
    	       </div> <!-- row -->
    		</div> <!-- card-body -->
    	
   	</section>

	</div>
</div>
<!-- ./wrapper -->




<%@ include file="/WEB-INF/views/module/footer.jsp" %>  