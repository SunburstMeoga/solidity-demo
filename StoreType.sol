// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract StoreType {
    string name;
}

contract Person {
    struct State {
        string name;
        string gender;
    }

    State public state;

    function setState(string calldata _name, string calldata _gender) external {
        //calldata只能用于external的参数,且参数必须是复合类型
        state.name = _name;
        state.gender = _gender;
    }

    function getName() external view returns (string memory) {
        // calldata只能修饰函数参数，不能修饰返回值
        //查看了状态变量state，需用view修饰
        return state.name;
    }

    function changeGender(uint _value) external {
        require(_value == 0 || _value == 1, unicode"只能输入0或者1");
        string memory newGender;
        newGender = _value == 0 ? unicode"女" : unicode"男";
        state.gender = newGender;
    }
}
