<?php
//3.	Write a program to check whether the string contains a pattern with 3 numbers only (not less not more) If yes, display that number..
    include "functions.php";
$my_Word =1;

if (preg_match("[0-9]{3}", $my_Word)) {
    echo "Your url is ok.";
} 

else
{
	
}
?>