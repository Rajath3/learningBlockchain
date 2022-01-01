pragma solidity ^0.5.0;

contract Escrow {
    address agent;
    mapping(address => uint256) public deposits;  

    constructor() public{
        agent = msg.sender;
    }  

    modifier onlyAgent() {
        require(msg.sender == agent);
        _;
    }

    function deposit(address payee) public payable onlyAgent{
        uint256 value = msg.value;
        deposits[payee] = deposits[payee] + value; 
    }

    function withdraw(address payable payee) payable public onlyAgent{
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }

}