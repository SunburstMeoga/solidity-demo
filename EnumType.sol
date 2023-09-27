// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EnumType {
    enum State {
        onLine,
        offLine,
        unKnow
    }

    State public status;

    function get() public view  returns(State){
        return status;
    }

    function set(State _status) public {
        status = _status;
    }

    function off() public {
        status = State.offLine;
    }

    function reset() public {
        delete status;
    }
}