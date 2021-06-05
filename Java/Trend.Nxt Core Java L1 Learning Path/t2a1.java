class Book
    {
        int price;
        String isbn,title,author;
        Book(int price,String isbn,String title,String author)
        {
            this.price = price;
            this.isbn = isbn;
            this.title = title;
            this.author = author;
        }
        public void displayDetails()
        {
            System.out.println("ISBN:"+isbn);
            System.out.println("Author:"+author);
            System.out.println("Title:"+title);
            System.out.println("Price:"+price);
        }
        public double discountedPrice(double discountPercent)
        {
            double finalPrice = price - (price*(0.01*discountPercent));
            return(finalPrice);
        }
    }
    
    public class Main
    {
        public static void main (String[] args)
        {
            Book obj = new Book(250,"938476114-1","Java world","Sun System");
            obj.displayDetails();
            double x = obj.discountedPrice(10);
            System.out.println("Final Price "+x);
        }
    }