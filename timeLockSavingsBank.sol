pragma solidity ^0.5.1;

contract timeLock {
    // Beneficiary
    address payable beneficiary;
    // When
    uint256 public releaseTime;
    
    // What amount/value is dynamic input
    constructor(address payable _beneficiary, uint256 _releaseTime) public payable{
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release() payable public {
        require(block.timestamp >= releaseTime);
        address(beneficiary).transfer(address(this).balance);
    }    
}