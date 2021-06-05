<?php include "db.php";

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Marks Form</title>
    <style>
    
        h4{color: red}
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    
    <div class="col-sm-6">
        <form action="7Htmlforms.php" method="post">
            <div class="form-group">
            <br>  <br>
            <label for="username">Science Marks:</label>
            <input type="text" name="ScienceMarks" class="form-control">
            </div>
            
             <div class="form-group">
                <label for="text">Maths Marks:</label>
            <input type="text" name="MathsMarks" class="form-control">
            </div>
            
            <input class="btn btn-primary" type="submit" name="submit" value="Submit">
            <p>                            </p>
            <br>
              
        <?php
            
            
            
            if(isset($_POST['submit']))  {

            $ScienceMarks= $_POST['ScienceMarks'];
            $MathsMarks =  $_POST['MathsMarks']; 
          
                
                if($ScienceMarks==0 or $MathsMarks==0){
                    echo "<h5> Please enter valid numaric  details <h5>";
                }
                else{ ?>
        
            <p><strong> Entered:- </strong> Science Marks= <?php echo  $ScienceMarks ?>  and Maths Marks=<?php echo $MathsMarks ?>   </p>
            <?php
            $sum= $ScienceMarks+$MathsMarks;
            $avg=($ScienceMarks+$MathsMarks)/2 ; ?>
            
            <p><strong>Total Marks:</strong> The total of Science marks and Mathis marks is <?php echo  $sum ?>  </p>
                  <p><strong>Average Marks:</strong> The average of Science marks and Mathis marks <?php echo $avg; }?>  </p>
                  
                  <?php
             
                }
else{

  echo "Enter your marks and click submit to know total and average";
}
           
          ?>          
                  
        </form>
    </div>





</div>
</body>
</html>