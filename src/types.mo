import Result "mo:base/Result";

module Types{
  //Users type
  public type User = { // If we don't specify it is public, it will be private by default and cannot be accessed from other modules or actors
    id: Principal;
    firstName: Text;
    lastName: Text;
  };

  //User results type
  public type UserResult = Result.Result<[User], Text>;
};