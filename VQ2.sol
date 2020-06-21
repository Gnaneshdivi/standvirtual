pragma solidity 0.6.6;
contract VirtualQueue{
    


struct customer{
        int256 AadharID;
        string Name;
        string Address;
        string PlaceToRegister;
        int256 TimeSlot;
    }
    
    mapping (string => customer) properties;
    int256 CustomerCount;
    int256 slot_1;
    int256 slot_2;
    
    constructor() public {
        CustomerCount=0;
        slot_1=0;
        slot_2=0;
    }
    
function CustomerDetails(int256 Customer_Aadhar_ID, string memory Customer_Name, string memory Customer_Address, string memory Place_To_Register, int256 Slot)public
    {
          
       customer memory prop;
       prop.AadharID = Customer_Aadhar_ID;
       prop.Name = Customer_Name;
       prop.Address = Customer_Address;
       prop.PlaceToRegister= Place_To_Register;
       prop.TimeSlot = Slot;
       
       properties[Place_To_Register] = prop;
       CustomerCount++;
       if(Slot==1){slot_1++;}
       if(Slot==2){slot_2++;}
    }
    
function Get_Details (string memory PlaceToRegister_) public view returns (int256 customer_ID, string memory customer_Name, string memory customer_Address, string memory Customer_Place,int256 CustomerSlot) 
    {
        customer_ID=-1;
        customer_Name="";
        customer_Address="";
        Customer_Place="";
        
        
        customer memory prop = properties[PlaceToRegister_];
        
        customer_ID = prop.AadharID;
        customer_Name = prop.Name;
        customer_Address = prop.Address;
        Customer_Place = prop.PlaceToRegister;
        CustomerSlot=prop.TimeSlot;
        
        return (customer_ID, customer_Name, customer_Address, Customer_Place,CustomerSlot);
    }    
    
   function Customer_Count() view public returns (int256 count,int256 Slot1,int256 Slot2) 
    {
        return (CustomerCount,slot_1,slot_2);
    }



}