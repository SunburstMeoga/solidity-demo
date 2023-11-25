pragma solidity ^0.8.0;

// SPDX-License-Identifier: MIT

contract Vote {
    //构建投票人的结构体
    struct Voter {
        uint256 amount; //投票数
        bool isVoted; //是否投过票了
        address delegators; //代理人地址
        uint256 targetId; //目标地址
    }

    // 投票看板结构体
    struct Board {
        string name; //目标名字
        uint256 totalAmount; //票数
    }

    //主持人信息
    address public host;
    mapping(address => Voter) public Voters;

    Board[] public board;
}
