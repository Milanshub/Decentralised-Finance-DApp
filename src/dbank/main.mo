import Debug "mo:base/Debug";

// creating a canister by the name DBank
actor DBank {
  var currentValue = 300; 
  currentValue := 100; 

  // creates a var like a const in js that will never change, while var changes
  let id = 92834523489476; 


  // "func" is function in Motoko lang. "Public" exposes the function to then be used 
  // in the commmand line or Candid. "Nat" is a positive number we can input in Candid  
  public func topUp(amount: Nat) {
    currentValue += amount;  
    Debug.print(debug_show(currentValue))
  };

  public func withdrawl(amount: Nat){
   
      let tempValue: Int = currentValue - amount;
      if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
      } else {
      Debug.print("Amount too large. Current Value less than zero");
      }
  };  
 
};

//http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai&id=rrkah-fqaaa-aaaaa-aaaaq-cai
// canister link to Candid UI