actor Fibonacci{

  //Declare variables
  let numFibonacci: [Nat] = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040];

  //Initiate func to add Fibonacci sequence until input value is reached (after input value is reached, if value is an odd number, keep going until we get an even number)
  public shared query func sumFibonacci(num: Nat): async Nat{

    //Declare variable to add up the result
    var total: Nat = 0;

    //Initiate for loop to add items less or equal to the input value
    label addItem{
      for(val in numFibonacci.vals()){
        if(val <= num){
          total += val;
        }
        else if(total % 2 != 0){ //If total is even number, continue adding
          total += val;
        }
        else {
          break addItem
        };
      };
    };

    return total;
  };
};