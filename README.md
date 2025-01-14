# Motoko Bootcamp Exercises: dancmartin11
This repository contains practice code for Web3 canister development in ICP blockchain using Motoko (Motoko Bootcamp for ICP Motoko Developer Certification).

---

`src`: Contains the source code for the activities for each day in the Motoko Bootcamp. Also contains types.mo, file for the `types` custom module.
`dfx.json`: JSON file for creating canisters in dfx.

## Day 2 Exercise

- **Description**: Create a canister in Motoko. The canister must have two methods: comments outside the Actor with the following data: Name, Country, and Experience. The `setName` (update) method should receive a name and store it in a variable, while the `getName` (query) method should return the name.


## Day 3 Exercise

- **Description**: Create a canister in Motoko that contains a public method called `sumFibonacci`. This method should receive a natural number `n` as a parameter and return the sum of the Fibonacci sequence up to the `n`-th term. The input will be the number `n`, and the output will be the total sum of the corresponding Fibonacci numbers. Additionally, the result must be an even number; if the sum is not even, the method should add the next term of the Fibonacci sequence until the result is even.


## Day 4 Exercise

- **Description**: Create a new project using `dfx new`, written in Motoko language, without a frontend, and integrated with Internet Identity for authentication.


## Day 5 Exercise

- **Description**: After adding modules in the live session and worked with the Map module, create a function that converts the map into the appropriate structure that matches the UserResult type, in order for the canister to query the users' data (`id`, `firstName`, and `lastName`).