<html>
    
<head>
    <?php   /*4. The students marks is at present 34. Passing marks is 40. Write a PHP program which checks if the marks is between 32-39.  If yes, keep giving 1 grace mark till the marks becomes 40. The max. marks after giving grace marks should not go beyond 40.*/ ?>
  <title>Multiplication Tables</title>

</head>
    
<body>
     <?php
    
    function tableGenerator($table){
        for($n=1;$n<=10;$n++){
            echo $table."*".$n."=".($table*$n);
            echo "<br>";
        }
       
    }
    tableGenerator(15);
      ?>
       
</body>

</html>
