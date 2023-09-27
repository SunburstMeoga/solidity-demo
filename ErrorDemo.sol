// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ErrorDemo {
    uint public x = 100;

    function doAssert() public returns (uint) {
        // assert(3 > 100); //assert如果不满足条件，此方法调用将导致一个无效的操作码，对状态所做的任何更改将被还原，这个方法是用来处理内部错误的,消耗gas很多
        // require(3 > 100, unicode"3不能大于5"); //require如果不满足条件，此方法调用将恢复到原始状态，此方法用于检查输入或者外部组件的错误，它提供了一个提供自定义消息的选项
        // revert() //此方法将终止执行并将所做的更改还原为执行前状态
        x = 200;
        return x;
    }

    uint public y = 100;
}
