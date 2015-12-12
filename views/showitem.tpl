<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Class Roll Book</title>
</head>
<body >

<div class="container">
<nav class="navbar navbar-default">
  <div class="container-fluid">

    <div>
      <ul class="nav navbar-nav">
        <li ><a href="/">Home</a></li>
        <li class="active"><a href="#">Start</a></li>
        <li><a href="/show/done">Report</a></li> 
        <li><a href="/new">New Roll</a></li> 
      </ul>
    </div>
  </div>
</nav>
<p>

</p>
<div class="container" style="padding-top:20px;">


<h1 align="center" style="font-size: 70;line-height:110%;">{{ students[1] }}</h1>
<h2 align="center" style="padding-top:20px">Student Number: {{ students[3] }}</h1>
<h3 align="center">Day: {{ students[2] }}</h3>

% if students[4] == 0:
%    presentstr = "Absent"
%  elif students[4] == 1:
%    presentstr = "Present"
% end

<h4 align="center" style="font-size:40;padding-top:20px;"><a href="/present/{{ students[0] }}">{{ presentstr }}</a></h4>

<h4 align="center" style="padding:20px;">Notes: {{ students[5] }}</td>
<form method="POST">
<input name="notes" type="text" />
<input type="submit" value="Submit">
</form>

<a href="/show/{{ prevlink }}">Prev</a> <a href="/"><i class="icon-home"></i></a> <a href="/show/{{ nextlink }}">Next</a>
</div>
</body>
</html>
