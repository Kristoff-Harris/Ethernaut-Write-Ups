pragma solidity ^0.6.0;

// Challenge Take-away: Do not rely on tx.origin for authenticating a transaction initiator 
//
// Summary: traditionally this type of contract has been very vuln to phishing 
contract Telephone {

  address public owner;

  // Owner is set to be anyone who deploys this contract  
  constructor() public {
    owner = msg.sender;
  }

  // tx.origin (global var) == sender of the transaction 
  //     - More specifically, it's the user-wallet address (EOA) which kicked-off the transaction to ethereum
  // 
  //
  // msg.sender == the immediate account that sent the message 
  //
  // EOA = Externally Owned Address (only type of address that owns a private key)
  //        - Also the only type of account that can initiate a transaction that gets sent 
  //          to ethereum for processing
  // Smart Contract Acct = Can send messages to other accounts, but it can never initiate a transaction 
  // 
  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
