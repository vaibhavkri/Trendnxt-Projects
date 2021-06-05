<?php
//1.	2.	Write a program to find whether the pattern ‘Country’ exists in a string. If yes, replace all occurrences with ‘Nation’. Perform a case-insensitive find and replace.
    
$my_Word = "Ask not what your Country has done for you. Ask what you can do for your Country";

if (preg_match("/Country/", $my_Word))
{
	echo "$my_Word <h3> contains  Country</h3>";
    $my_Word = preg_replace("/Country/", 'Nation', $my_Word);
    echo $my_Word;
} 

else
{
	echo "$my_Word <h3> does n't ontains  Country </h3>";
}
?>