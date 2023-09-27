// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Function {
    string public name = "Lotto";

    constructor() {}

    function setName(string memory _name) public returns (string memory) {
        name = _name;
        return printName(name);
    }

    function foo() public pure returns (string memory) {
        //pure表示纯粹的函数，不引用和改变状态变量
        string memory str = "hello";
        return str;
    }

    function fzz() public view returns (string memory) {
        //view表示读了合约的状态变量
        return name;
    }
}

function printName(string memory _name) pure returns (string memory) {
    //pure访问函数内部变量（局部变量，这里访问的是setName函数的name变量）
    return _name;
}
