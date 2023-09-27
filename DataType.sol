// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract DataType {

}

contract StringType {
    string public  str1 = '124';
    string public str2 = unicode"超级无敌暴龙战士";

    // function concat() public view returns(string memory) {
    //     string memory targetStr = string.concat(str1, str2);
    //     return targetStr;
    // }

    function concat2(string memory _a, string memory _b) public pure returns(bytes memory) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        return bytes.concat(_ba, _bb);
    }
}