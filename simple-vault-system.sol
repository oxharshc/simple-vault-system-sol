// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// Library for math
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }
}

// Base contract
contract VaultBase {
    using SafeMath for uint256;
    
    mapping(address => uint256) internal balances;
    
    // Events
    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);
}

// Derived contract
contract VaultManager is VaultBase {
    using SafeMath for uint256;
    
    // Deposit function
    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit 0 ETH");
        
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        
        emit Deposit(msg.sender, msg.value);
    }
    
    // Withdraw function
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] = balances[msg.sender].sub(amount);
        
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
        
        emit Withdrawal(msg.sender, amount);
    }
}
