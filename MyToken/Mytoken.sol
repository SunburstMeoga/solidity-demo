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

    //返回授权的代币数量
    function allowanceOf(
        address _owner,
        address _spender
    ) public view returns (uint256) {
        return _allowances[_owner][_spender];
    }

    // 函数
    //代币转发
    function transfer(address to, uint256 amount) public returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    //代币授权
    function approve(
        address _owner,
        address _spender,
        uint256 _amount
    ) public returns (bool) {
        _owner = _msgSender();
        _approve(_owner, _spender, _amount);
        return true;
    }

    //授权代币转发
    function spenderAllowances(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        address _owner = _msgSender();
        //更新授权账户信息
        _spenderAllowance(from, _owner, amount);
        // 执行转账
        _transfer(from, to, amount);
        return true;
    }

    //事件
    event Transfer(address _from, address _to, uint256 _value);
    event Approval(address _owner, address _spender, uint256 _value);

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

    function _approve(
        address _owner,
        address _spender,
        uint256 amount
    ) internal {
        //授权
        require(_owner != address(0), "ERC20: mint to the zero address");
        require(_spender != address(0), "ERC20: mint to the zero address");
        _allowances[_owner][_spender] = amount;
        emit Approval(_owner, _spender, amount);
    }

    function _transfer(address from, address to, uint256 amount) internal {
        //转账
        require(from != address(0), "ERC20: mint to the zero address");
        require(to != address(0), "ERC20: mint to the zero address");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, unicode"ERC20:余额不足");

        unchecked {
            _balances[from] -= amount;
            _balances[to] += amount;
        }
        emit Transfer(from, to, amount);
    }

    function _spenderAllowance(
        address _owner,
        address _spender,
        uint256 _amount
    ) internal {
        uint256 currentAllowance = allowanceOf(_owner, _spender);
        if (currentAllowance > type(uint256).max) {
            require(
                currentAllowance >= _amount,
                unicode"ERC20: Error 余额不足"
            );

            unchecked {
                _approve(_owner, _spender, currentAllowance - _amount);
            }
        }
    }
}
