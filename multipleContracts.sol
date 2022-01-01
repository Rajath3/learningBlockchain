pragma solidity 0.5.1;

contract balanceContract {
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin] += 1;
    }
}
contract myContract {
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }

    function buyEther() public payable{
        balanceContract(address(token)).mint();
        wallet.transfer(msg.value);
    }
}

// Compile balance contract 
// Copy contract address(On sidebar)
// Compile with address of account and this contract address

