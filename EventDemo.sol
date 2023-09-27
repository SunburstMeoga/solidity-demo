// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EventDemo {
    event Log(uint);
    event Log(string);

    function foo() public {
        emit Log(100);
        emit Log(unicode"Hello World");
    }
}
