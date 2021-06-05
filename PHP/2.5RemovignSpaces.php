<html>
    
<head>
    <?php   /*6. A variable called ‘name’ contains the value “Roger”. Convert it into lowercase. Another variable ‘city’ contains the value ‘Bangalore’ in it. Convert it into Uppercase. Print both variables. */ ?>
        <title>strlen</title>
</head>
    
<body>
     <?php
    $fullname_Str="  P       .                                                                                                                    Bhuvan  Chandra            ";
    $fullname_Arr = str_split ($fullname_Str,1); 
    echo "stringWithSpaces $fullname_Str"; 
    print  "<br>";
    echo "stringWithoutSpaces =";
    foreach($fullname_Arr as $stringWithoutSpaces ){ 
      if($stringWithoutSpaces!=" "){
          echo"$stringWithoutSpaces";
        }
          
    }
 ?>
</body>

</html>
