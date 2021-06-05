<html>
    
<head>
    <?php   /*3. Display all even values from 2-100 using ‘for’ loop and the ‘while’ loop */ ?>
        <title>For and While loops</title>
    <style>
    
        h3{
            color: forestgreen;
        }
    </style>
</head>
    
<body>
     <?php
    echo "<h3> Using for loop</h3>";
     for($i=2;$i<=100;$i=$i+2){
         echo $i;
         echo "  ,";
     }
     echo "<h3> Using While loop </h3>";
    $i=2;
     while($i<=100){
               
                if($i%2==0){
                    echo $i;
                   echo "  ,";
                          }
         
         $i++;}

      ?>
       
</body>

</html>
