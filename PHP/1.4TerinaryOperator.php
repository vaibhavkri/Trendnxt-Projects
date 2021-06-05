<html>
    
<head>
    <?php   /*5. Have two variables ‘sciencemarks’ and ‘mathsmarks’ and assign some sample marks (number) onto it. If sciencemarks is greater than mathsmarks, display the message ‘Science is highest’ else ‘Maths is highest’. Do it using the ternary operator.  */ ?>
        <title> Using the ternary operato</title>
</head>
    
<body>
     <?php
    $sciencemarks=rand(1,100);
    $mathsmarks=rand(1,100);
        echo" <h3> Science marks = $sciencemarks <br> Maths marks =$mathsmarks <h3>";
echo ($sciencemarks > $mathsmarks ?"<h3>‘Science is highest’<h3>" : "<h3>‘Maths is highest’<h3>");
     ?>
       
</body>

</html>
