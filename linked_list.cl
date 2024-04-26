--Program Three: Linked List

class Employee{
    
     name : String;
     age : Int;
     salary : Int;
    
     -- constructor
    init (n:String, a:Int, s:Int): SELF_TYPE{
       {
        name <- n;
        age <- a;
        salary <- s;
        self;
       }
    };
    
    get_name ():String{
      {
      name;
      }
    };

     set_name (n:String): SELF_TYPE{
        {
         name <- n;
         self;
        }
     };

     get_age ():Int{
      {
          age;
       }
     };

      set_age (a:Int): SELF_TYPE{
        {
         age <- a;
         self;
         }
      };

       get_salary ():Int{
          {
           salary;
          }
       };

      set_salary (s:Int): SELF_TYPE{
         {
         salary <- s;
         self;
         }
       };
       
}; -- End of Employee class


-- node class
-- each node of type Employee
class Node {
    
   m_key : Employee;
   m_next : Node;

   init_node (key : Employee): Node{
      {
      m_key <- key;
      self;
      }
    };

   get_key(): Employee{
      {
      m_key;
      }
    };

   get_next(): Node{
      {
      m_next;
      }
    };

    set_next(next:Node):Object{
       {
        m_next<- next;
        self;
        }
     };
    
};  -- End of Node class


-- List class
-- each list has set of nodes
class List{

     m_head : Node;
     m_cur_pos : Node;
     m_length : Int <- 0;

    append(node:Node):Object{
      {
         if isvoid m_head then{
               m_head <- node;
               m_cur_pos <- m_head;
         }
        else end(m_head).set_next(node)
        fi;
        m_length <- m_length + 1;
      }
    };

    end(m_cur_pos : Node) : Node{
       {
          if not isvoid m_cur_pos.get_next() then{
             end(m_cur_pos.get_next());
           }
          else {
              m_cur_pos;
          }
          fi;
        }
    };


   reset(): Object{
     {
      m_cur_pos <- m_head;
     }
   };

     next():Node{
       {
        let ret : Node in {
             if isvoid m_cur_pos then {
                 m_cur_pos;
                 
             }
             else {
                ret <- m_cur_pos;
                m_cur_pos <- m_cur_pos.get_next();
                ret;
             }
             fi;
         };
         }
      };

       get_length(): Int{
           {
              m_length;
           }
        };
    
}; -- End of list class









-- main class
class Main inherits IO{
    
     -- list of people
     m_l_employee: List;
    
    --attribute of the employee
     name:String;
     age:Int;
     salary:Int;
  
 main(): Object{
       {
           -- creating a list
           m_l_employee <- new List;
          
           --creating a pointer for the while loop
           let i:Int in{
               i<-0;
           while i = 0 loop {
               
                   out_string("\n-------------------------\n");
                   out_string("Choose an option:  \n");
                   out_string("1. Add Employee \n");
                   out_string("2. Edit Employee \n");
                   out_string("3. Display Retired Employees \n");
                   out_string("4. Calculate Bouns \n");
                   out_string("5. Exit \n");
                   out_string("Enter your choice:  " );

                   --entering the user choice
                   let choice : Int in {
                     choice <- in_int();
                        
                      let pointer: Node in {
                        pointer <- m_l_employee.next();

                       -- if the user chose 1 (Adding an Employee)
                       if choice = 1 then{

                           out_string("\n");
                           out_string("Enter the name :  ");
                           name <- in_string();

                           out_string("Enter the age :  ");
                           age <- in_int();

                           out_string("Enter the salary :  ");
                           salary <- in_int();

                           --calling a mothod to add an employee
                           add_employee (name, age, salary);
     
                       } --close the if of chosing 1
                       else {
                           
                           -- if the user chose 2 (Editing an Employee)
                           if choice = 2 then{
                               out_string("\n");
                               out_string("\n Enter the name of the employee to edit: ");
                               name <- in_string();
                                
                              --to check the employee name
                              if (pointer.get_key()).get_name() = name then{
                        
                                out_string("Enter new employee name: ");
                                name <- in_string();
                                pointer.get_key().set_name(name);
        
                                out_string("Enter new employee age: ");
                                age <- in_int();
                                pointer.get_key().set_age(age);


                                out_string("Enter new employee salary: ");
                                salary <- in_int();
                                pointer.get_key().set_salary(salary);

                                }--end the inner if
                                else{
                                   out_string("Not found!");
                                } --end the inner else
                                fi;
                             
                            } --close the if of chosing 2
                          else {
                               
                               if choice = 3 then{
                                   --calling the display_Retired method
                                   display_Retired();
                               }
                               else {
                                   if choice = 4 then{
                                      --calling the calculate_bouns method
                                      calculate_bouns();
                                   }
                                   else {
                                       --to stop the while loop we change the value of i
                                       i<-1;
                                   }
                                   fi;
                               }
                               fi;
                            }
                            fi;
                          }
                          fi;
                      }; --end the pointer scope
                    }; --end the choice scope

                } --ending the while loop
                pool;
               
          };--end the i scope

       self;
       }
  }; --Main Methood

           
-- this method to add an employee take 3 parameters and return an employee object
add_employee (n: String, a:Int, s:Int):Object{
  {
    m_l_employee.append((new Node).init_node((new Employee).init(n, a, s)));
    out_string ("has/have added to the list. \n");

    self;
    }
 }; -- end the add_employee Mehood

--this method display the Retired employees that there age >= 60 and retutn there names
display_Retired ():Object{
   {
       if isvoid m_l_employee then {
          out_string("list is empty!");
      }else
      {
         m_l_employee.reset();

         let employee:Node in{
            while {
              employee <- m_l_employee.next();

              if not isvoid employee then {true;}
              else {false;}
              fi;
             }
             loop{
  
                 if (employee.get_key()).get_age() < 60 then{
                 out_string ("");
                 }
                 else{
                 out_string((employee.get_key()).get_name());
                 } --else
                fi;
                 
               } --end the while loop
             pool;
             
           }; --end the employee scope
          
         } --end the else
         fi;
    }
}; -- end the Display_Retired Mehood


-- this method to Calculate the bouns for the employee that there salary is >= 5000 and return there name and the new salary
calculate_bouns():Object{
  {
       if isvoid m_l_employee then {
          out_string("list is empty!");
      }
      else{
            m_l_employee.reset();

            let employee:Node in{
            while {
              employee <- m_l_employee.next();

              if not isvoid employee then {true;}
              else {false;}
              fi;
                
             }
             loop{
                 if (employee.get_key()).get_salary() < 5000 then{
                 out_string ("");
                 }
                 else{
                   out_string("\nBouns for ");
                   out_string((employee.get_key()).get_name());
                   out_string(": ");
                   out_int(((employee.get_key()).get_salary()/5)+ (employee.get_key()).get_salary());
                 } --end the else
                 fi;

               } --end the while loop
             pool;
                
           }; --end the employee scope

         } --end the else
         fi;
   }
}; -- end the calculate_bouns Method


}; --end the main class









 
