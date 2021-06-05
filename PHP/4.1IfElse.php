<html>
    
<head>
    <?php   /*1. A variable ‘marks’ contains the value 80. If marks is greater than 40, you need to display the message ‘Passed’ else ‘Failed’.*/ ?>
        <title>If Else</title>
<style>
    h3{
        color: forestgreen;
    }
    
    </style>
</head>
    
<body>
     <?php
    $marks=80;
        echo"<h3> Marks = $marks </h3>";
    echo($marks>40? '<h3> Result = passed </h3>':'Result = failed');
    
    ?>
</body>

</html>
