<html>
    
<head>
    <?php   /*2 Create a numeric array that contains the names of 10 students. Display the first and the last student names.*/ ?>
        <title>Numaric array</title>
<style>
    
    h3{color: darkslateblue;
            display: inline;}
    h4{color: hotpink;
            display: inline;}
    p{
        color: green;
    }
    
    </style>
</head>
    
<body>
     <?php
$students=array('hari','sravya','chandra','Max','shakthi','janani');
   
    echo "<h3> All values  by for each loop: </h3>";
       $i=1;
    foreach($students as  $s){
     
            echo "<br>".$i.") ".$s; 
       $i++;
}
     echo "<h3><br>All values  by print_r: </h3>";
    
 ?> <p> <?php   print_r($students);  ?> </p>  <?php

 echo "<h3> Selected value is  : </h3>";   


$val = array_rand($students); //OR
$val = rand(0,count($students)-1);
echo "<br> Student name in  Index "."<h4> $val </h4>"." is = ";
    echo "<h4> $students[$val] </h4>" ;
    
    echo "<br>------------------------------------------";
    echo "<br> First Student name is : "; 
    echo "<h4> $students[0] </h4>" ;
    echo "<br>------------------------------------------";
    echo "<br> Last Student name  is : "; 
    $index=count($students)-1;
    echo "<h4> $students[$index] </h4>" ;
    ?>
</body>

</html>
