<html>
    
<head>
    <?php   /*3. Create a multidimensional array that contains the details like names of students and their respective class, phonenumber and marks of 5 students. Display the entire array. Also display the phone number of only one student.*/ ?>
        <title>Multi dimension array</title>
<style>
    
    </style>
</head>
    
<body>
     <?php
    $name=array('bhuvii','koochi','kohli','rahul','rohit');
    $class=array(9,10,1,3,4);
    $pn=array(8992894976,7637829742,8473323677,9472897847,6396767227);    
    $marks=array(80,30,99,17,15);
    $student_details= array($name,$class,$pn,$marks );
    
   ?><p><?php// print_r($student_details); ?></p> 

   <?php
      foreach($student_details as $sd){
      
          foreach($sd as $s){
              echo "<br>".$s;
      }
              echo "<br>";
      }
   $selection= rand(0,4);
     echo $student_details[0][$selection] ." phone number is ".$student_details[2][$selection];
    ?>
</body>

</html>
