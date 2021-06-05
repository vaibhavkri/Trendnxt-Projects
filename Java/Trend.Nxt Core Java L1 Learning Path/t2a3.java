class Book
    {
        int price;
        String isbn,title;
        Book(int price,String isbn,String title)
        {
            this.price = price;
            this.isbn = isbn;
            this.title = title;
        }
        public void displayDetails()
        {
            System.out.println("ISBN:"+isbn);
            System.out.println("Title:"+title);
            System.out.println("Price:"+price);
        }
        
    }
    class Magazine extends Book
    {
        String type;
        Magazine(String type)
        {
           super(250,"2555-5","Alchemist");
           this.type = type; 
        }
        void dispm()
        {
            System.out.println("Type of Magazine:"+type);
        }
        
    }
    
    class Novel extends Book
    {
        String author;
        Novel(String author)
        {
            super(250,"2555-5","Alchemist");
            this.author = author;
        }
        void dispn()
        {
            System.out.println("Author name:"+author);
        }
    }
    
    public class Main
    {
        public static void main (String[] args)
        {
            Magazine obj1 = new Magazine("Consumer");
            Novel obj2 = new Novel("Paulo Coelho");
            
            obj1.displayDetails();
            obj1.dispm();
            obj2.dispn();
        }
    }