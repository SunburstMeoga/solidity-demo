// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract StructType {

    struct Person {
        string name;
        string gender;
        uint age;
    }

    Person public person;

    function setPerson(string calldata _name, string calldata _gender, uint _age) public  {
        person.name = _name;
        person.gender = _gender;
        person.age = _age;
    }

}