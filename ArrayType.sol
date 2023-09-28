// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ArrayType {
    uint[5] arr = [1,2,3,5,6];

    function getArr() public view returns(uint[5] memory) {
        return arr;
    } 

    function sumArr() public view returns (uint) {
        uint sum = 0;
        for (uint i; i < arr.length; i++) {
            sum += arr[i];
        }
        return  sum;
    }

    function changeArr(uint _index, uint _value) public {
        arr[_index] = _value;
    }

} 