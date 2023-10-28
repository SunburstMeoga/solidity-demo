// SPDX-License-Identifier: MIT
pragma solidity >=0.8.8 <0.9.0;

contract MappingType {
    mapping(address => uint256) balances;

    function setBalance(uint256 _amount) public {
        balances[msg.sender] = _amount;
    }

    function getBalance() public returns (uint256) {
        return balances[msg.sender];
    }
}
