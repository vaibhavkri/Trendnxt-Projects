<html>
    
<head>
    <?php   /*4. An array contains the names of the top 10 highest mark achievers in a class. Remove and print the first element of the array. Count the items in the array now.*/ ?>
        <title>Multi dimension array</title>
<style>
    h3{
        color: forestgreen;
    }
    
    </style>
</head>
    
<body>
     <?php
    $name=array('bhuvii','koochi','kohli','rahul','rohit','Mahesh','Edwin','Sailu','Ramya','Shalinie');
     echo "<h3> Top 10 highest mark achievers in a class. and count </h3>";
     print_r ($name);
   
    echo count($name);
    if (in_array('bhuvii', $name)) 
{
    unset($name[array_search('bhuvii', $name)]);
} 
    echo "<br>";
     echo "<h3> Top 2 to 10 highest mark achievers in a class. and count </h3>";
    print_r ($name);

    echo count($name);
    ?>
</body>

</html>
