// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract HelloWorld {
    string public name;

    constructor() {
        name = "Lotto";
    }

    function getName() public view returns (string memory) {
        return name;
    }
}
