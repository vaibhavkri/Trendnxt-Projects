<html>
    
<head>
    <?php   /*7. A string variable contains the values “Ask not what your nation has done for you. Ask what you can do for your nation”. Find for the occurrence of the substring ‘nation’ in it and replace with ‘country’. Also find out how many (count of) replacements were made.*/ ?>
        <title>Find and Replace</title>
<style>
    
    h3{color: orangered;
            display: inline;}
    
    </style>
</head>
    
<body>
     <?php
$variable="Ask not what your nation has done for you. Ask what you can do for your nation";
    $fullname_Arr = str_split ($variable,1); 
      //print_r ($fullname_Arr);
     $count=0;
      for($i=0;$i<=strlen($variable);$i++ ){ 
     
          if($fullname_Arr[$i]=="n"and $fullname_Arr[$i+1]=="a" and $fullname_Arr[$i+2]=="t" and $fullname_Arr[$i+3]=="i" and $fullname_Arr[$i+4]=="o" and $fullname_Arr[$i+5]=="n"){
              $fullname_Arr[$i]="c";
              $fullname_Arr[$i+1]="o" ;
              $fullname_Arr[$i+2]="u" ;
              $fullname_Arr[$i+3]="n" ;
              $fullname_Arr[$i+4]="t" ;
              $fullname_Arr[$i+5]="r" ;
              $fullname_Arr[$i+6]="y " ;        
          }
       echo  "<h3>$fullname_Arr[$i]<h3>";
        }
       ?>
</body>

</html>
