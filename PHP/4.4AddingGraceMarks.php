<html>
    
<head>
    <?php   /*4. The students marks is at present 34. Passing marks is 40. Write a PHP program which checks if the marks is between 32-39.  If yes, keep giving 1 grace mark till the marks becomes 40. The max. marks after giving grace marks should not go beyond 40.*/ ?>
  <title>Adding Grace Marks</title>
    <style>
    
        h3{ color: forestgreen;  }
      
    </style>
</head>
    
<body>
     <?php
    $marks=rand(30,40);
    echo "Marks obtained  ".$marks;
    $min_pass_mark=40;

    if($marks>=32 and $marks<$min_pass_mark){
            $grace=$min_pass_mark-$marks;
           echo"<br> Marks needed  ". $grace;
        for($i=1;$i<=$grace;$i++){
             $marks++;
        }
       
        echo "<br> Marks after gracing: ".$marks;
        
    }

      ?>
       
</body>

</html>
