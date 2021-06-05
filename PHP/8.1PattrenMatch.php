<?php
//1.	Write a program to find whether the pattern ‘ball’ exists in a string. If yes, display the matched items.
    
$my_Word = "i have green ball , do you have pink tennis ball , i have red cricket ball and yellow smily ball";

if (preg_match("/ball/", $my_Word))
{
	echo "$my_Word <h3> contains  ball</h3>";
} 
else
{
	echo "$my_Word <h3> does n't ontains  ball </h3>";
}
?>