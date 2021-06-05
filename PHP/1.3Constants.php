<html>
    
<head>
    <?php   /*C4. Create two constants: MINMARKS=0 and MAXMARKS=100 and display the same. Towards the end of the program, try setting /changing the value of MINMARKS=1 and then try to display it.  */ ?>
        <title>Constants</title>
</head>
    
<body>
     <?php
define("MINMARKS",0);
define("MAXMARKS",100); 
    echo "Minimum marks is: ". MINMARKS;
    echo "<br> Maximum marks is: ". MAXMARKS;
define("MINMARKS",1);
    echo "<br> Minimum marks is: ". MINMARKS;
     ?>
       
</body>

</html>
