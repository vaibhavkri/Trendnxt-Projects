public class Student
    {

        public String studentId;
        public String studentName;
        public Student(String studentId, String studentName)
        {
            this.studentId=studentId;
            this.studentName =studentName;

        }
        @Override
        public int hashCode() 
        {
            return 1234;
        }
        @Override
        public boolean equals(Object o)
        {
            if (o instanceof Student) 
            {
                Student student=(Student)o;
                if (this.studentId.equalsIgnoreCase(student.studentId))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
    
    public class PhoneNumber
    {
        public String phoneNumber;
        public PhoneNumber(String phoneNumber)
        {
            this.phoneNumber =phoneNumber;
        }
    }

import java.util.HashMap;
import java.util.Set;
import java.util.List;
import com.google.common.collect.Lists;
public class Person 
{
    public static void main(String[] args)
    {
        Student e1=new Student("e001","studentOne");
        Student e2=new Student("e002","studentTwo");


        PhoneNumber d1 = new PhoneNumber("9999999998");
        PhoneNumber d2 = new PhoneNumber("9999999999");
        List listOfPhoneNumbersOfStudentOne = Lists.newArrayList(d1,d2);

        PhoneNumber d3 = new PhoneNumber("9999999997");
        PhoneNumber d4 = new PhoneNumber("9999999996");
        List listOfPhoneNumbersOfStudentTwo = Lists.newArrayList(d3,d4);

// Here Student made as key by overriding hashCode() and equals() method.

        HashMap<Student, List<PhoneNumber>> map=new HashMap<Student, List<PhoneNumber>>();
        map.put(e1, listOfPhoneNumbersOfStudentOne);
        map.put(e2, listOfPhoneNumbersOfStudentTwo);

        Set<Student> key=map.keySet();
        for (Student student : key) {
        System.out.println(student.studentId+" "+student.studentName +" ");


            }
        }

    }