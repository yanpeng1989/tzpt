<!DOCTYPE html>  
<html lang="en">  
  <head>  
    <meta charset='utf-8' />  
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">  
    <link rel="stylesheet" type="text/css" media="screen" href="http://silviomoreto.github.io/bootstrap-select/stylesheets/bootstrap-select.css">  
    <title>Bootstrap-select</title>  
  </head>  
    <body>  
    <div>  
      <select class="selectpicker span2" data-size="false">  
          <option>Mustard</option>  
          <option>Ketchup</option>  
          <option>Relish</option>  
      </select>  
    </div>  
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>  
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>  
    <script src="http://silviomoreto.github.io/bootstrap-select/javascripts/bootstrap-select.js"></script>  
    <script type="text/javascript">  
      window.onload=function(){  
          $('.selectpicker').selectpicker();  
          prettyPrint();  
      };  
    </script>  
  </body>  
</html>  