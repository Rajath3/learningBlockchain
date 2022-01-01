pragma solidity 0.5.1;

contract myContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    uint256 openingTime = 1640352175;

    modifier onlyAfter() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint256 _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public onlyAfter{
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
}

# Reference https://www.epochconverter.com/
