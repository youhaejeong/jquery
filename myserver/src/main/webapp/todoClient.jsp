<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>todoClient.jsp</title>
<style>
body {
	margin: 0;
	min-width: 250px;
}

/* Include the padding and border in an element's total width and height */
* {
	box-sizing: border-box;
}

/* Remove margins and padding from the list */
ul {
	margin: 0;
	padding: 0;
}

/* Style the list items */
ul li {
	cursor: pointer;
	position: relative;
	padding: 12px 8px 12px 40px;
	list-style-type: none;
	background: #eee;
	font-size: 18px;
	transition: 0.2s;
	/* make the list items unselectable */
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Set all odd list items to a different color (zebra-stripes) */
ul li:nth-child(odd) {
	background: #f9f9f9;
}

/* Darker background-color on hover */
ul li:hover {
	background: #ddd;
}

/* When clicked on, add a background color and strike out text */
ul li.checked {
	background: #888;
	color: #fff;
	text-decoration: line-through;
}

/* Add a "checked" mark when clicked on */
ul li.checked::before {
	content: '';
	position: absolute;
	border-color: #fff;
	border-style: solid;
	border-width: 0 2px 2px 0;
	top: 10px;
	left: 16px;
	transform: rotate(45deg);
	height: 15px;
	width: 7px;
}

/* Style the close button */
.close {
	position: absolute;
	right: 0;
	top: 0;
	padding: 12px 16px 12px 16px;
}

.close:hover {
	background-color: #f44336;
	color: white;
}

/* Style the header */
.header {
	background-color: #f44336;
	padding: 30px 40px;
	color: white;
	text-align: center;
}

/* Clear floats after the header */
.header:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the input */
input {
	margin: 0;
	border: none;
	border-radius: 0;
	width: 75%;
	padding: 10px;
	float: left;
	font-size: 16px;
}

/* Style the "Add" button */
.addBtn {
	padding: 10px;
	width: 25%;
	background: #d9d9d9;
	color: #555;
	float: left;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	transition: 0.3s;
	border-radius: 0;
}

.addBtn:hover {
	background-color: #bbb;
}
</style>
</head>
<body>

	<div id="myDIV" class="header">
		<h2 style="margin: 5px">My To Do List</h2>
		<input type="text" id="myInput" placeholder="Title..."> <span
			class="addBtn">Add</span>
	</div>

	<ul id="myUL">
		<li class="checked">test<span class="close">X</span></li>
	</ul>

	<script>
		$(function(){
			todoList();
			todoInsert();
			todoDelete();
			todoUpdate()
		})
	
		
		function todoUpdate(){
			$("#myUL").on("click", "li", function(){
				if(event.target.nodeName !="LI")
					return;
				let no = $(this).data("no");
				let todoyn = $(this).hasClass("checked") ? "0": "1";
				
				let li = $(this);
				$.ajax({
					url : "todoUpdate",
					data :{no , todoyn}
				}).done(function(){
					li.toggleClass("checked");
				})
				
			
			/* $("#myUL").on("click", "li", function(){
				var no = $(this).attr("data-no")
				var check = $(this).attr("class")
				if (check == 'checked') {
					var todoyn = '0';
				} else {
					var todoyn = '1';
				}
				$.ajax({
					url: 'todoUpdate',
					data: {no, todoyn},
				}).done(function(){
					todoList();
				})
			}) */
		})
		}
		function todoDelete(){
			$("#myUL").on("click", "span", function(){
				var no = $(this).parent().data("no");
				let li = $(this).parent();
				$.ajax({
					url: 'todoDelete',
					data: {no : no},
				}).done(function(result){
					//todoList(); //비효율적 
					$('[data-no='+result.no+']').remove();
					//li태그 삭제 
					//result.no
					//li.remove();
				})
			})
		}
		
		function todoInsert(){
			$("#myInput").on("keypress",function(){
				if(event.keyCode ==13)
					$(".addBtn").click();
			})
			$(".addBtn").on("click", function(){
				var contents = $("#myInput").val();
				//내용 입력 체크 
				if(contents == ""){
					alert("내용입력")
					return;
				}
				$.ajax({
					url: 'todoInsert',
					data: { contents },
				}).done(function(temp){
					$("#myInput").val("");
					//todoList();
				makeli(temp);
				})
			})
		}
		
		function todoList() {
		
			$.ajax({
				url: 'todoSelect',
				dataType:'json',
			}).done(function(list){
				$("#myUL").empty();
				for(temp of list) {
				makeli(temp);
			};
		})
		}
			
			function makeli(temp){	
				var li = $("<li>").attr("data-no", temp.no)
				 				  .html(`\${temp.contents}<span class="close">X</span>`)
				if(temp.todoyn == '1') {
						li.addClass("checked")
					}
					$("#myUL").append(li)
				}
	</script>

</body>
</html>