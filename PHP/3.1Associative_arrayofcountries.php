<html>
    
<head>
    <?php   /*1. Create an array of 5 country names and its capital and display all. Also display the capital of only one selected country.*/ ?>
        <title>Associative array</title>
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
$country_capital_Araay=array('Afghanistan'=>'Kabul',
'Australia'=>'Canberra',
'Austria'=>'Vienna',
'Chile'=>'Santiago',
'China'=>'Beijing',
'India'=>'New Delhi',
);
   
    echo "<h3> All values  by for each loop: </h3>";
       $i=1;
    foreach($country_capital_Araay as  $cc){
     
            echo "<br>".$i.") ".$cc; 
       $i++;
    
}

     echo "<h3><br>All values  by print_r: </h3>";
    
 ?> <p> <?php   print_r($country_capital_Araay);  ?> </p>  <?php

 echo "<h3> Selected value is  : </h3>";   



$val = array_rand($country_capital_Araay);
echo "<br> Capital of  "."<h4> $val </h4>"." is = ";
    echo "<h4> $country_capital_Araay[$val] </h4>" ;
    ?>
</body>

</html>
