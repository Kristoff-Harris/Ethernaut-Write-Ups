// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  // @param _initialSupply - Contract Deployer instantiates the contract with a number of tokens for the contract to manage
  constructor(uint _initialSupply) public {
    // Assign all the initial supply of tokens to the owner
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  // @param _to - recipient of tokens 
  // @param _value - number of tokens 
  // 
  // Security Note - We aren't using safe math here so rollovers are likely possible...
  // 
  function transfer(address _to, uint _value) public returns (bool) {
    // Check to see that the individual invoking the txn has a value greater or eq than that of 0
    // Actually this is just really bad since we're working with uints (unsigned ints) here... this will always eval to true
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}
