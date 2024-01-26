import Debug "mo:base/Debug";

// creating a canister by the name DBank
actor DBank {
  // adding "stable" is an Orthogonal Presistence. Holds state over many circles
  // and calls 
  stable var currentValue = 300; 
  // currentValue := 100; 

  // creates a var like a const in js that will never change, while var changes
  let id = 9283452348947; 
   Debug.print(debug_show(id));


  // "func" is function in Motoko lang. "Public" exposes the function to then be used 
  // in the commmand line or Candid. "Nat" is a positive number we can input in Candid.
  //ICP Canister "Update Call"  
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

  // ICP Canister "Query Call". So to call a var directly 
  public query func checkBalance():async Nat {
    return currentValue; 
  };
 
};

//http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai&id=rrkah-fqaaa-aaaaa-aaaaq-cai
// canister link to Candid UI