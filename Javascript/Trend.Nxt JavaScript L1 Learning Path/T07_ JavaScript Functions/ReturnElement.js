ar input = prompt("Enter a Number to get array elements");

var array = [1,2,3,4,5,6,7,8,9,10];
var user_array = [];

if(input > 10)
{
  for(var val = 0;val <10;val++)
  {
    user_array.push(array[array.length - val - 1]);
  }
}

else {
  for(var val = 0;val <input;val++)
  {
    user_array.push(array[array.length - val - 1]);
  }

}

alert("Your array :: \n" + user_array);
