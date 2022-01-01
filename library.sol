// file1

pragma solidity 0.5.1;

import './Math.sol';

contract myContract {
    using Math for uint256;
    uint256 public value;

    function divide(uint _value1, uint _value2) public{
        value = _value1.div(_value2);
    }
}


// file2

pragma solidity 0.5.1;

library Math {
    function div(uint256 a, uint256 b) internal pure returns(uint256){
        require(b > 0);
        uint256 c = a / b;
        return c;
    }
}