import Debug "mo:base/Debug";

// imports below are used for current time function 
import Time "mo:base/Time";
import Float "mo:base/Float";



// creating a canister by the name DBank
actor DBank {
  // adding "stable" is an Orthogonal Presistence. Holds state over many circles
  // and calls 
  stable var currentValue: Float = 300; 
  currentValue := 300; 
  Debug.print(debug_show(currentValue));

  // shows current time in miliseconds  
  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

   // creates a var like a const in js that will never change, while var changes
  let id = 9283452348947; 
  //  Debug.print(debug_show(id));


  // "func" is function in Motoko lang. "Public" exposes the function to then be used 
  // in the commmand line or Candid. "Nat" is a positive number we can input in Candid.
  //ICP Canister "Update Call"  
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

   public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.")
    }
  };


  // ICP Canister "Query Call". So to call a var directly 
  public query func checkBalance(): async Float {
    return currentValue;
  };

    // topUp();
 

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
  
};

//http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai&id=rrkah-fqaaa-aaaaa-aaaaq-cai
// canister link to Candid UI