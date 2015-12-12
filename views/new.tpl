<! DOCTYPE html>
<html>
<head>
<!--<link href="/css/bootstrap.css" rel="stylesheet">-->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
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
        <li><a href="/show/1">Start</a></li>
        <li><a href="/show/done">Report</a></li> 
        <li class="active"><a href="/#">New Roll</a></li> 
      </ul>
    </div>
  </div>
</nav>
<p>

</p>
</br>

<table class="table table-striped">
<tr>
    <th>Day</th>
    <th>Student Name</th>
    <th>Student Number</th>
    <th>Present?</th>
    <th>Notes</th>
</tr>
% for item in students:
% if item[4] == 0:
%    icons = "fa fa-close"
%  elif item[4] == 1:
%    icons = "fa fa-check"
% end
<tr>
    <td>{{ item[2] }}</td>
    <td><a href="/show/{{ item[0] }}">{{ item[1] }}</a></td>
    <td>{{ item[3] }}</td>
    <td><i class="{{ icons }}"</i></td>
    <td>{{ item[5] }}</td>
</tr>

%end
</div>
</body>
</html>
