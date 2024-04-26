--Program Two: Control Structures

class Main inherits IO {
   main(): SELF_TYPE {
       {
           -- entering a number from the user
           out_string("please enter your number");
           out_string("\n");
           
           let number : Int in {
           number <- in_int();

               let remainder :Int in{
                   
               --calculate the remainder to check if the number is even or odd
               remainder<- number- ( (number/2) * 2);
               out_string("\n");
                   
                   --if condition to check if the remainder = 0
                   if remainder = 0 then{
                      out_string("the number is even\n");
                      out_string("all the even numbers from 2 to ");
                      out_int(number);
                      out_string("\n");
                       
                     -- while loop to print all the numbers from 2 to the input number
                      let i:Int in{
                          i<-2;
                          while i <= number loop {
                              out_int(i);
                              out_string("\n");
                              i <- i+2;
                          } -- close the while loop
                          pool;
                     };
 
                   } -- close the if
                   
                   --if the remainder is not 0
                   else {
                       out_string("the number is odd\n");
                       out_string("all the odd numbers from 1 to ");
                       out_int(number);
                       out_string("\n");
                       
                       -- while loop to print all the numbers from 1 to the input number
                       let j:Int in{
                           j<-1;
                           while j <= number loop {
                               out_int(j);
                               out_string("\n");
                               j <- j+2;
                           } -- close the while loop
                           pool;
                      };
                  } -- close the else
                  fi;
           }; --end of the remainder scope
       }; --end of the number scope
           
    self;
    }
 };
    
};
