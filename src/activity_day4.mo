import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Principal "mo:base/Principal";

var users: [(Text, Nat)] = [("Alice", 23), ("Bob", 21), ("Charlie", 34)];
type TypeUsers = Result.Result<[(Text, Nat)], Text>;


actor IntIdentity{
  
  //Validate identity (Debug if caller is anonymous or authenticated)
  public shared query (msg) func whoAmI(): async Principal{

    if(Principal.isAnonymous(msg.caller)){
      Debug.print("Anonymous user: " # Principal.toText(msg.caller));
    };

    Debug.print("Authenticated user: " # Principal.toText(msg.caller));

    return msg.caller;
  };

  //If caller is authenticated, return list of users
  public shared query ({caller}) func getUsers(): async TypeUsers{
    if(Principal.isAnonymous(caller)){
      return #err("You are not authorized to access this information");
    }
    else{
      return #ok(users);
    };
  };
}