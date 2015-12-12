<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        present={{!present}};
        absent_with={{!absent_with}};
        absent_without={{!absent_without}};
        
        var data = google.visualization.arrayToDataTable([
          ['Attendance', 'Num'],
          ['Present',    present],
          ['Absent without note', absent_without],
          ['Absent with note', absent_with],        
        ]);

        var options = {
          title: 'Attendance Report'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>




<title>Class Roll Book</title>
</head>
<body >

<div class="container">
<nav class="navbar navbar-default">
  <div class="container-fluid">

    <div>
      <ul class="nav navbar-nav">
        <li ><a href="/">Home</a></li>
        <li ><a href="/show/1">Start</a></li>
        <li class="active"><a href="#">Report</a></li> 
        <li><a href="/new">New Roll</a></li> 
      </ul>
    </div>
  </div>
</nav>
<p>

</p>

<div class="container">
<p>
<h1>Report</h1>
</p>
</br>

  
        <h2>Attendance Report</h2>
        </br>
        <table class="table table-bordered table-condensed">
        <thead>
        <tr>
            <th>Present</th>
            <th>Absent</th>
            <th>Percentage Present</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>{{ present }}</td>
            <td>{{ absent }}</td>
            <td>{{ percentage }}</td>
        </tr>
        </tbody>
        </table>
        </br>
        <h2>Attendance Chart</h2>
        </br>

    <div id="piechart" style="width: 900px; height: 500px;"></div>


    </div>
</div>
</body>
</html>
