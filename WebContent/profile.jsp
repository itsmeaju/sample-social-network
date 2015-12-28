<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*,javax.sql.*;"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My name | Sample</title>

<style>
.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
color: #000;  /*Sets the text hover color on navbar*/
}

.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active >   
 a:hover, .navbar-default .navbar-nav > .active > a:focus {
color: white; /*BACKGROUND color for active*/
background-color: #030033;
}

  .navbar-default {
    background-color: #0f006f;
    border-color: #030033;
}

  .dropdown-menu > li > a:hover,
   .dropdown-menu > li > a:focus {
    color: #262626;
   text-decoration: none;
  background-color: #66CCFF;  /*change color of links in drop down here*/
   }

 .nav > li > a:hover,
 .nav > li > a:focus {
    text-decoration: none;
    background-color: silver; /*Change rollover cell color here*/
  }


  .navbar-default .navbar-nav > li > a {
   color: white; /*Change active text color here*/
    }
#picture{
background-image: url("banner.jpg");
   height: 295px;
   background-size: 100%;
   
}
.btn-circle.btn-xl {
  width: 100px;
  height: 100px;
  padding: 10px 16px;
  background:url(rdj.jpg);
  background-size: 150px 80px;
  background-position: center; 
  font-size: 24px;
  line-height: 1.33;
   border-radius: 50%;
}
#choosedp{
visibility:hidden;
}

.inner{
}
#statusbox{
}
</style>

</head>
<body  class="pre-scrollable">

<div class="container">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Sample Network
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Page 1</a></li>
        <li><a href="#">Page 2</a></li> 
        <li><a href="#">Page 3</a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>



<div id="content" >

   

<%
	String name="Tony";
	String dateofbirth="def";
	String phone="def";
	String email="def";
	String aboutme="def";
	String dob="def";
	String mon="def";
	int age=0;int i;int date=1;
	List<String> Interests = new ArrayList<String>();
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample3","root",""); 
	Statement stmt = conn.createStatement();
	ResultSet rs1 = stmt.executeQuery("select * from sample_user where name='"+name+"'");
	
	while(rs1.next()){
		 
		 age= rs1.getInt("age"); 
		 dateofbirth=rs1.getString("dob"); 
		 email=rs1.getString("email");
		 phone=rs1.getString("phone");
		 aboutme=rs1.getString("aboutme");
	}
	
	dob=dateofbirth.substring(8);
	 date=Integer.parseInt(dob);
	int m=Integer.parseInt(dateofbirth.substring(5,7));
	switch(m){
	case 1:mon="January";break;
	case 2:mon="Febraury";break;
	case 3:mon="March";break;
	case 4:mon="April";break;
	case 5:mon="May";break;
	case 6:mon="June";break;
	case 7:mon="July";break;
	case 8:mon="August";break;
	case 9:mon="September";break;
	case 10:mon="October";break;
	case 11:mon="November";break;
	case 12:mon="December";break;
	default:out.println("bad");
	}
}
	catch(SQLException se){ %>
		SQLEXCEPTION
	<%}
	catch(NumberFormatException ne){ %>
	number format EXCEPTION
<%}
	catch(Exception e){%>
	DB FAILED	
<%	}
	List<String> Followers = new ArrayList<String>();
	List<String> Following = new ArrayList<String>();
	String it=null; String fg=null; String fs=null; 
%>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="picture">
<div class="carousel-caption">
	<input id="choosedp" type="input">
       <h1><button class="btn btn-default btn-circle btn-xl" id="dp"><i class="glyphicon glyphicon-router"></i>dp</button>
	<%=name %>, <%=aboutme %></h1>
      </div></div>

	
	
	
	<ul class="nav nav-tabs" role="tablist">
  <li class="active"><a href="#timeline" role="tab" data-toggle="tab">Timeline</a></li>
  <li><a href="#profile" role="tab" data-toggle="tab">Profile</a></li>
  <li><a href="#messages" role="tab" data-toggle="tab">Messages</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">Settings</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" id="timeline">
  	<label  class="col-sm-2 control-label">Status Update </label>
    <div class="col-sm-10">
      <textarea class="form-control" id="statusbox" rows="4" cols="50" placeholder="What's in your mind..">
	</textarea>
    </div>
    
	<div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
      <button onclick="update();eraseText();" class="btn btn-default"  id="post" >Post it</button>
    </div></div>
   <script>
   document.getElementById('dp').onclick = function() {
	    document.getElementById('choosedp').click();
	};
   var updated=false;
   
   $('#post').click(function(event) {
       if(updated==true){
    	   $("#myModal").modal("show");
    	   
    	   updated=false;
       }
       else{ 
             //Show form validation error modal-- I know this part is triggered but the modal will not show
           
             $("#myModal").modal("show");
            
       }
   });
   </script>
<!-- ModalSuccess -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sample Network</h4>
      </div>
      <div class="modal-body">
        <p>Status updated successfully :)</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- ModalFailure -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sample Network</h4>
      </div>
      <div class="modal-body">
        <p>Status update failed :(</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

	<div class="col-sm-offset-2 col-sm-10">
	<div id="statusarea"  class="panel panel-info">
	
	</div></div>
  	
  
  
  
   </div>
  <div class="tab-pane" id="profile">
  <div class="well well-lg">
Age <%=age %><br><br>
	Born <%=date %>
	<%if(date==1 || date==21 || date==31){%><sup>st</sup><% 
	} else if(date==2 || date==22){%><sup>nd</sup><%
	} else{%><sup>th</sup> <%} %>
	
	
	
	 of <%=mon %><br><br>
	Call me @ <%=phone %><br><br>
	Email : <%=email %>
	
	<%//Add some static data 
	
	Interests.add("Sing");
	Interests.add("Guitar");
	Interests.add("Break Dance");
	Followers.add("Steve");
	
	Followers.add("Michael Jakson");
	Followers.add("Bill Gates");
	Following.add("Tony");
	Collections.sort(Interests);
	Collections.sort(Following);
	Collections.sort(Followers);
	%>

<br><br>
	My interests: 
<strong>
	<%for( i=0;i<Interests.size();i++){
		it=Interests.get(i);
		if(i==Interests.size()-1){ %>
		<%=it %>.
	<%	}
		else{	%>
			<%=it %>,
	<%	}
	} %>
</strong>
<br><br>
	<%=name %> follows 
<strong>
	<%for( i=0;i<Following.size();i++){
		fg=Following.get(i);
		if(i==Following.size()-1){ %>
			<%=fg %>.
	<%	}
		else{	%>
			<%=fg %>,
	<%	}
	} %>
</strong>
<br><br>
	<%=name %> is followed by 
<strong>
	<%for( i=0;i<Followers.size();i++){
		fs=Followers.get(i);
		if(i==Followers.size()-1){ %>
			<%=fs %>.
	<%	}
		else{	%>
			<%=fs %>,
	<%	}
	} %>
</strong>
<br><br>
</div>

<br>


</div>

	
  <div class="tab-pane" id="messages">Coming Soon 8-)</div>
  <div class="tab-pane" id="settings">Coming Soon 8-)</div>
</div>
	
	</div>
	
		<script>
$(document).ready(function(){
   var liked = false;
   $('.icon_like').attr("visibility","none");
	$("#statusarea").click(function() {
		if(liked==true){
    	$(this).find('.icon_like').hide();
    	$(this).find('.icon_unlike').show();
    	liked=false;
       // $(this).find('.icon_like').toggle();
		}
		else{
			$(this).find('.icon_unlike').hide();
	    	$(this).find('.icon_like').show();
	    	liked=true;
		}
		
	});
});
function eraseText() {
    document.getElementById("statusbox").value = "";
}


function update(){
	
	update.count = ++update.count || 1
//	var imgdiv = document.createElement("div");
//	imgdiv.setAttribute("id","post_like"+update.count);
//	document.getElementById("statusarea").appendChild(imgdiv);
	
	var xmlhttp;
	//var type="post";
	var id=1;
	value = $('#statusbox').val();
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	   // document.getElementById("statusbox").innerHTML=xmlhttp.responseText;
		 
	   //update status in timeline
	  		var ph = document.createElement("div");
			ph.setAttribute("class","panel-heading");
			ph.setAttribute("id","post_heading"+update.count);
			ph.innerHTML="Status Title"+update.count;
			var pb = document.createElement("div");
			pb.setAttribute("class","panel-body");
			pb.setAttribute("id","post_body"+update.count);
			var pf = document.createElement("div");
			pf.setAttribute("class","panel-footer");
			pf.setAttribute("id","post_footer"+update.count);
			
		    pb.innerHTML=value;
		    document.getElementById("statusarea").appendChild(ph);
		    document.getElementById("statusarea").appendChild(pb);
		    document.getElementById("statusarea").appendChild(pf);
			updated=true;
		     }
	  }
	
	xmlhttp.open("GET",'dbupdate.jsp?id=' + id+ '&type=post&status='+value,true);
	xmlhttp.send();
	
/*	var lik = document.createElement("img");
	lik.setAttribute("class","icon_like");
	lik.setAttribute("id","icon_like"+update.count);
	lik.setAttribute("src","like.jpg");
	lik.setAttribute("height","50px");
	lik.setAttribute("width","50px");
//	lik.setAttribute("onclick","likebut()");

	var unlik = document.createElement("img");
	lik.setAttribute("class","icon_unlike");
	unlik.setAttribute("id","icon_unlike"+update.count);
	unlik.setAttribute("src","unlike.jpg");
	unlik.setAttribute("height","50px");
	unlik.setAttribute("width","50px");
//	unlik.setAttribute("onclick","unlikebut()");

	document.getElementById("statusarea").appendChild(unlik);
	document.getElementById("statusarea").appendChild(lik);
	*/
    
}


/* Like has to perform many actions dynamically
  
   1.One click : update img and increment like counter in sample_status 
   2.next click: update img and decrement like counter in sample_status
   3. should not increment like counter more than once per user 
   4. display updated like counter values with the status
   
   */
/*function liketoggle(){
			var xmlhttp2;
			document.getElementById("icon_like").innerHTML="<img src='unlike.jpg' height='50px' width='50px'>";
			var xmlhttp2 = new XMLHttpRequest();
			xmlhttp2.onreadystatechange=function()
			  {
			  if (xmlhttp2.readyState==4 && xmlhttp2.status==200)
			    {
			    }
			  }
			
			xmlhttp2.open("GET",'dbupdate.jsp?type=like',true);
			xmlhttp2.send();
}*/
</script>


</div>
</body>
</html>