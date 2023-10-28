// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Context.sol";

contract MyToken is Context {
    //代币信息：名称 标识 小数位 总发行量 代币数量 授权代币数量
    string private _name;
    string private _symbol;
    uint8 private _deciamls;
    uint256 private _totalSupply;
    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowances;

    //初始化
    constructor() {
        _name = "M1nCoin";
        _symbol = "M1C";
        _deciamls = 18;
        //初始化货币池
        _mint(_msgSender(), 10 * 10000 * 10 ** _deciamls);
    }

    //取值器
    //返回代币的名字
    function name() public view returns (string memory) {
        return _name;
    }

    //返回代币标识
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    //返回代币小数位
    function deciamls() public view returns (uint8) {
        return _deciamls;
    }

    //返回代币发行总量
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    //返回用户拥有的代币余额
    function balancdOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    //代币转发
    function transfer(address to, uint256 amount) public returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    //转账函数
    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0), "ERC20: mint to the zero address");
        require(to != address(0), "ERC20: mint to the zero address");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, unicode"ERC20:余额不足");

        unchecked {
            _balances[from] -= amount;
            _balances[to] += amount;
        }
    }

    //合约内部函数
    function _mint(address _account, uint256 _amount) internal {
        //internal表示只在合约内部使用
        require(_account != address(0), "ERC20: mint to the zero address");
        _totalSupply += _amount; //初始化货币数量
        unchecked {
            //unchecked表示不用通过检查
            _balances[_account] += _amount; //给某个账号注入起始资金
        }
    }
}
