// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Structs {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car; // struct as a state variable
    Car[] public cars; // array of struct
    mapping(address => Car[]) public carsByOwner;

    function example() external {
        // Three ways to initialize a struct

        Car memory toyota = Car("toyota", 2004, msg.sender);
        Car memory lambo = Car({
            year: 2004,
            model: "Lamborghini",
            owner: msg.sender
        }); //  The order does not matter
        Car memory tesla; //  Will have default values
        tesla.model = "Tesla";
        tesla.year = 2014;
        tesla.owner = msg.sender;

        cars.push(toyota); // Put them in a state variable in order to retain the structs after the function is executed
        cars.push(lambo);
        cars.push(tesla);

       
    }
}
