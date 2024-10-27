import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
actor IntIdentity{
  //Declare type for users
  var users: [(Text, Nat)] = [("Alice", 23), ("Bob", 21), ("Charlie", 34)];
  type TypeUsers = Result.Result<[(Text, Nat)], Text>;
  
  //Validate identity (Debug if caller is anonymous or authenticated)
  public shared query (msg) func whoAmI(): async Principal{

    if(Principal.isAnonymous(msg.caller)){
      Debug.print("Anonymous user: " # Principal.toText(msg.caller));
    }
    else {
    Debug.print("Authenticated user: " # Principal.toText(msg.caller));
    };

    return msg.caller;
  };

  //If caller is authenticated, return list of users
  public shared query ({caller}) func getUsers(): async TypeUsers{
    if(Principal.isAnonymous(caller)){
      return #err("You are not authorized to access this information. Please authenticate.");
    }
    else{
      return #ok(users);
    };
  };
}