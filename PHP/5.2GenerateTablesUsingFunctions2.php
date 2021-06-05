<html>
    
<head>
    <?php   /*2.	Function should take a ‘number’ as one argument and ‘end number’ as second argument and generate the tables as above for the ‘number’ till the ‘end number’ (Here number is ‘15’ and the ‘end number’ is 10) (i.e. multiplication table of 15 from ‘15X1’ ‘15X10’*/ ?>
  <title>Multiplication Tables</title>

</head>
   <style>
       h4{
           color:  black;
            display: inline;
       }
    </style>
    
<body>
     <?php
    
    function tableGenerator($table,$upto){
        for($n=1;$n<=$upto;$n++){
            echo "<h4>";
            echo $table."*".$n."=".($table*$n);
            echo "<br>";
        }
       
    }
    tableGenerator(15,20);
      ?>
       
</body>

</html>
