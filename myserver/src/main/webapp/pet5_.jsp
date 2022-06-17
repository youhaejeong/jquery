<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Pete's Pet Shop</title>

    <!-- Bootstrap -->
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-8 col-sm-push-2">
          <h1 class="text-center">Pete's Pet Shop</h1>
          <hr/>
          <br/>
        </div>
      </div>

      <div id="petsRow" class="row">
        <!-- PETS LOAD HERE -->
      </div>
    </div>

    <div id="petTemplate" style="display: none;" ><!-- style="display: none;" -->
      <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="panel panel-default panel-pet">
          <div class="panel-heading">
            <h3 class="panel-title">Scrappy</h3>
          </div>
          <div class="panel-body">
            <img alt="140x140" data-src="holder.js/140x140" class="img-rounded img-center" style="width: 100%;" src="https://animalso.com/wp-content/uploads/2017/01/Golden-Retriever_6.jpg" data-holder-rendered="true">
            <br/><br/>
            <strong>Breed</strong>: <span class="pet-breed">Golden Retriever</span><br/>
            <strong>Age</strong>: <span class="pet-age">3</span><br/>
            <strong>Location</strong>: <span class="pet-location">Warren, MI</span><br/><br/>
            <button class="btn btn-warning btn-adopt" type="button">Adopt</button>
          </div>
        </div>
      </div>
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <!--  <script src="resources/js/app.js"></script> -->
   	<script>
   		$(function(){
   			petList();
   			petAdopt();
   		})	
   		
   		function petAdopt(){
   			$("#petsRow").on("click", "button", function(){
	   			// 버튼을 클릭하면 분양테이블에 등록
   				var price = prompt("가격입력");
   				var id = $(this).data("id")
   				$.ajax({
   					url : 'adoptInsert',
   					data : { id, price },
   					type : 'POST'
   				}).done(function(){
   					$("#petsRow").html('')
   					petList();
   				})
   			})
   		}
   		
   		function petList(){
   			$.ajax({
   	   			url : 'petSelect',
   	   			dataType : 'json' // -> 생략가능
   	   		}).done(function(list){
   	   			var temp = $("#petTemplate");
   	   			for(pet of list) {
   	   				temp.find(".panel-title").html(pet.name)
   					temp.find("img").attr("src", pet.picture)
   					temp.find(".pet-breed").html(pet.breed)
   					temp.find(".pet-age").html(pet.age)
   					temp.find(".pet-location").html(pet.location)
   					temp.find(".btn").attr("data-id", pet.id)
   					if (Number(pet.price) > 0) {
   						temp.find("button").prop("disabled", true)
   					} else {
   						temp.find("button").prop("disabled", false)
   					}
   	   				$("#petsRow").append(temp.html())
   	   			}
   	   		})	
   		}
   	
   		
   	
   	</script>
  </body>
</html>
