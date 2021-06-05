<html>
    
<head>
    <?php   /*2. A variable ‘appraisal’ contains the appraisal ratings for this year for the employees. If the rating is ‘OS’ display a message ‘15% hike’, if the rating is ‘ECC’ display a message ‘10% hike’, if the rating is ‘HVC’ display a message ‘5% hike’ and for all others display a message ‘Sorry No Hike’.  */ ?>
        <title>Switch</title>
</head>
    
<body>
     <?php
    $All_rating=array('OS','ECC','HVC','MCE','USC');
    $Emplyoee_rating=($All_rating[rand(0,4)]);
    echo "Employee rating for this year was ".$Emplyoee_rating;
    echo "<br>";
switch ($Emplyoee_rating)
{      
        case 'OS': echo "15% hike";
        break;
        case 'ECC': echo "10% hike";
        break;
        case 'HVC': echo "5% hike";
        break;
        default: echo "‘Sorry No Hike’.";
}?>
       
</body>

</html>
