<html>
    
<head>
    <?php   /*2. Check whether String interpolation happens within “ “ (double quotes) and ‘ ‘ (single quotes) */ ?>
        <title>String_Interpolation</title>
</head>
    
<body>
     <?php
    //Variable interpolation:-Variable interpolation is adding variables in between a string data. PHP will parse the interpolated variables and replace the variable with its value while processing the string data
    $name = "PHP";
echo "<h3> I am \x0 through \xFF reading $name <h3>"; // double quotes or  heredocs.
echo '<h3>I am \n reading $name <h3>'; // single quoted string or nowdocs,doesn’t support variable parsing.
echo 'I am reading '.$name ; //But! When  using the single quotes ' ' and you want to inject the variable, you will have to use concatenation operator . (the actual dot) in order to concatenate the variable with the string
    ?>
       
</body>

</html>
