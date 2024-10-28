import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Types "./types";
import Array "mo:base/Array";

//import HashMap "mo:base/HashMap";
import Map "mo:map/Map";
import {thash} "mo:map/Map"; //thash stands for Text hash, we had a Nat in the first argument of our Map.new, we would use nhash (more info on map module documentation)

actor IntIdentity{
  //Declare type for users
  //var usersMap = HashMap.HashMap<Text, Types.Users>(5, Text.equal, Text.hash); //HashMap is NOT stable, we can use Map instead to have a stable data structure
  var users = Map.new<Text, Types.User>();

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

  //Add user to the Map
  public shared func addUser(data: Types.User): () {
    Map.set(users, thash, Principal.toText(data.id), data);
  };

  //Delete user to the Map
  public shared func deleteUser(id: Principal): () {
    Map.delete(users, thash, Principal.toText(id));
  };

  //Convert user Map to array
  private func usersToArray(): [(Text, Types.User)] {
    // Clone the map to avoid modifying the originals
    var usersArray = Map.clone(users);
    return Map.toArray(usersArray);
  };

  //Extract values from the users array in [Types.User] format
  private func usersArrayVals(): [Types.User] {
    var usersArray: [(Text, Types.User)] = usersToArray();
    return Array.map(usersArray, func(tuple: (Text, Types.User)): Types.User {
      return tuple.1;
    });
  };

  //If caller is authenticated, return list of users
  public shared query ({caller}) func getUsers(): async Types.UserResult {
    
    if(Principal.isAnonymous(caller)){
      return #err("You are not authorized to access this information. Please authenticate.");
    }
    else{
      var usersArray = usersArrayVals();
      return #ok(usersArray);
    };
  };
};