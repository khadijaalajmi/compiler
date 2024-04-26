--Program One: Geometric Shape Area Calculator

--parent class
class Shape inherits IO {
    
    r:Int;
    s:Int;
    
    --this constructer will be override in the Rectangle and Triangle classes
    init( rr:Int , ss:Int ):SELF_TYPE{
        {
        r<-rr;
        s<-ss;
        self;
        }
    };
    
    --this constructer will be override in the Circle class
    init2( rr:Int ):SELF_TYPE{
        {
        r<-rr;
        self;
        }
    };
  
    --this method will be override in all the classes
    calculateArea() : Int {
        {
          --to return any integer
          0;
        }
    };
    
};--ending the parent class (Shape)



--1st children class
class Rectangle inherits Shape{
    
     hight:Int;
     width:Int;
  
    --overriding the constructer
    init( h:Int , w:Int ):SELF_TYPE{
        {
        hight<-h;
        width<-w;
        self;
        }
    };

    --overriding the method
    calculateArea( ):Int{
        {
            -- to calculate the Area of a Rectangle this mathematical equation will be used
            hight * width;
        }
    };

};--ending the Rectangle class



--2nd children class
class Triangle  inherits Shape{
    
    base:Int;
    hight:Int;
    
    --overriding constructer
   init( b:Int , h:Int ):SELF_TYPE{
        {
        base<-b;
        hight<-h;
        self;
        }
   };

   --overriding method
   calculateArea( ):Int{
       {
        -- to calculate the Area of a Triangle this mathematical equation will be used
       (base * hight)/2;
       }
    };
    
};--ending the Triangle class
    

--3rd children class
class Circle inherits Shape {
   
    radius : Int;

    --overriding constructer
    init2 (r : Int):SELF_TYPE{
        {
        radius <- r;
        self;
        }
    };
   
    --overriding method
    calculateArea() : Int {
        {
        -- to calculate the Area of a Circle this mathematical equation will be used
        3 * (radius * radius);
        }
    };
    
};--ending the Circle class


-- the main class
class Main inherits IO {
    
    --declaring some variables
    choice:Int;
    radius:Int;
    base:Int;
    hight:Int;
    length:Int;
    width:Int;
    
    -- the main method
    main() : Object {
       {
           
           --Circle
           out_string("\nto calculate the Circle area \n");
           out_string("enter the radius :  \n");
           radius <- in_int();
           
           --using the polymorphism concept we make an instance of the circle class (child class) and assin it to a Shape object (perant class)
           let circle : Shape in{
               circle <- new Circle;
               circle.init2 (radius);
               out_string("\nthe Circle area is : ");
               --calling the calculateArea method from the Circle class and print the return value
               out_int(circle.calculateArea());
            };
           
           
          
           --Triangle
           out_string("\n\nto calculate the Triangle area \n");
           out_string("enter the base :  \n");
           base <- in_int();
           out_string("enter the hight :  \n");
           hight <- in_int();
           
           --using the polymorphism concept we make an instance of the Triangle class (child class) and assin it to a Shape object (perant class)
           let triangle : Shape in{
               triangle <- new Triangle;
               triangle.init( base , hight );
               out_string("\nthe Triangle area is : ");
               --calling the calculateArea method from the Triangle class and print the return value
               out_int(triangle.calculateArea());
            };
   
           
            
           --Rectangle
           out_string("\n\nto calculate the Rectangle area \n");
           out_string("enter the hight :  \n");
           hight <- in_int();
           out_string("enter the width :  \n");
           width <- in_int();
           
           --using the polymorphism concept we make an instance of the Rectangle class (child class) and assin it to a Shape object (perant class)
           let rectangle : Shape in{
               rectangle <- new Rectangle;
               rectangle.init( hight , width );
               out_string("\nthe Rectangle area is : ");
               --calling the calculateArea method from the Rectangle class and print the return value
               out_int(rectangle.calculateArea());
            };
                
           
           out_string("\n\n");
           
           self;
      }
    };
    
};--ending the main class
