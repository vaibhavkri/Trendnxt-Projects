var person = [];
person[0] = new Object();
person[0].name = "Vinay";
person[0].id = 10;
person[1] = new Object();
person[1].name = "Shyam";
person[1].id = 2;
person[2] = new Object();
person[2].name = "Viraj";
person[2].id = 1;
person[3] = new Object();
person[3].name = "Deepak";
person[3].id = 4;

console.log("Before sorting the Array of Objects : ");
for(var index = 0;index< person.length;index++)
  {
    console.log(person[index].name);
    console.log(person[index].id);
  }

for(var count = 0;count < person.length - 1;count++)
{
  
for(var index = 0;index < person.length - 1;index++)
{

  if(person[index].id > person[index + 1].id)
  {
    var temp = person[index];
    person[index] = person[index + 1];
    person[index + 1] = temp;
  }
} 

}

console.log("After sorting the Array of Objects : ");
for(var index = 0;index< person.length;index++)
  {
    console.log(person[index].name);
    console.log(person[index].id);
  }
