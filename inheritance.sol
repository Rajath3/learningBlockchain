pragma solidity 0.5.1;

contract originalToken {
    mapping(address => uint256) public balances;
    string public name;

    constructor(string memory _name) public{
        name = _name;
    }

    function mint() public {
        balances[tx.origin] += 1;
    }
}
contract childToken is originalToken {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;

    constructor(string memory _name, string memory _symbol) originalToken(_name) public{
        symbol = _symbol;
    }

    function mint()public {
        super.mint();
        ownerCount ++;
        owners.push(msg.sender);
    }


}