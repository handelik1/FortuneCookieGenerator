<script>
	function reload(){
		location.reload(); 
	}
</script>


<html>
    <head>
		<title>{{title}}</title>
		<link rel = "stylesheet" type = "text/css" href = "/static/css/bootstrap.css">	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	</head>
	
<script>
	$(document).ready(function(){
		$('#cookie-left').animate({ "left": "-=250px" }, "slow" );
		$('#cookie-right').animate({ "left": "+=230px" }, "slow" );

	})
		setTimeout(function(){
	  $('#paper, #fortune').removeClass("invisible");
	}, 750);
</script>

    <body class = "modal-open">
		<div class = "jumbotron text-center">
			<a href = "home" style = "color: black; text-decoration: none"><h1>{{title}}</h1></a>
		</div>
		<div class = "container">
			<table>
				<tr>
					<td><img style = "position: relative; left: 395px; top: -50px" class = "center-block" id = "cookie-left" src="/static/images/cookieleft.png" height = "300px" width = "300px"/></td>
							<td><div class = "container " style = "position: relative; left:-40px; top: -50px; width:500px; z-index: 2">
								<table style = "width: 500px">
									<td><img style = "position: relative; left: -1px; width: 575px" class = "center-block invisible" id = "paper" src="/static/images/fortune.png" height = "400px" width = "550px"/></td>
									%for row in rows:
										<tr>
										%for col in row:
											<td class = "invisible" id = "fortune" style = "font-weight: bold; width: 500px; position: relative; top: -212px; text-align: center; left: -10px">{{col}}</td>
										%end
										</tr>
									%end
									
								</table>
							</div>
					<td><img style = "position: relative; right: 360px; top: -50px" class = "center-block" id = "cookie-right" s src="/static/images/cookieright.png" height = "300px" width = "300px"/></td>

				</tr>
			</table>
				<button onclick = "reload()" class = "btn-lg center-block" style = "margin-top: 0px; position: relative; top: -120px; z-index:3; left: -11px">Generate Fortune</button>
		</div>
    </body>
</html>