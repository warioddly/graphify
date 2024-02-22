import 'jquery.min.dart';
import 'echarts.min.dart';
import 'scripts.js.dart';

const indexHtml = """
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>Echarts</title>
  <style>
    html, body {
      background-color: #100c2a;
      height: -webkit-fill-available;
      box-sizing: content-box;
      margin: 0;
    }
    #chart {
      height: -webkit-fill-available;
    }
  </style>
</head>
<body>
  <div id="chart"></div>
  <script>$jQuery</script>
  <script>$echartsMin</script>
  <script>$scriptsJs</script>
</body>
</html>
""";