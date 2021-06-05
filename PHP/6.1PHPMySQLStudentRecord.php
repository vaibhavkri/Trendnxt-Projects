<html>
    
<head>
    
  <title>My SQL PHP</title>
<style>
    
    h3{
        color: blue;
    }
    </style>
</head>

    
<body>
<?php 
include 'functions.php';
include 'db.php';
    global $connection;
   
        
    $query_display="SELECT * FROM `student` ";
   
    $result1 = mysqli_query($connection, $query_display);
    if(!$result1) {
        die('Query FAILED' . mysqli_error());
    }
        while($row = mysqli_fetch_assoc($result1)) {
        
        print_r($row);
    }
      
     $query_update="UPDATE `student` SET `marks`=54 WHERE `studentid`=3";
     $result2 = mysqli_query($connection, $query_update);
        if(!$result2) {
        die('Query FAILED' . mysqli_error());
    }
      $rand1=rand(10,20);
         $rand2=rand(1,100);
        $rand=getName(5);
    $query_insert="INSERT INTO student(`studentname`, `class`, `marks`) VALUES ('$rand','$rand1','$rand2')";
        
     mysqli_query($connection, $query_insert); 
      $query_delete="DELETE FROM student WHERE studentname = '$rand'";
     $result3 = mysqli_query($connection, $query_delete);  
        if(!$result3) {
        die('$query_delete FAILED');
    
   
    }
    


?>
</body>

</html>
