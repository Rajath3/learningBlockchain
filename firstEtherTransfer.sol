pragma solidity 0.5.1;

contract myContract {
    mapping(address => uint256) public balances;
    address payable wallet;

    // event 
    event Purchase(address _buyer, uint256 _value);

    // fallback function for may be automated response
    // this isn't working
    function() external payable {
        buyEther();
    }

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function buyEther() public payable{
        // increment counter of wallet
        balances[msg.sender] += 1;

        // transfer ether
        wallet.transfer(msg.value);

        // emit event
        emit Purchase(msg.sender, msg.value);
    }
}


// Choose a wallet while deploying
// Choose another account while transfer