# Simple Vault System

A basic Ethereum smart contract that allows users to deposit and withdraw Ether.

## Features

- **Deposit ETH**: Users can deposit Ether into the vault
- **Withdraw ETH**: Users can withdraw their deposited Ether
- **Safe Math**: Uses SafeMath library for secure arithmetic operations
- **Event Logging**: Emits events for deposits and withdrawals
- **Security**: Prevents depositing 0 ETH and over-withdrawing

## Contract Structure

### SafeMath Library
Provides safe mathematical operations:
- `add()`: Safe addition
- `sub()`: Safe subtraction

### VaultBase Contract
Base contract that defines:
- User balance tracking
- Event definitions

### VaultManager Contract
Inherits from VaultBase and implements:
- `deposit()`: Function to deposit ETH
- `withdraw()`: Function to withdraw ETH

## Usage

### Deposit ETH
```solidity
// Send ETH along with the transaction
vaultManager.deposit{value: 1 ether}();
```

### Withdraw ETH
```solidity
// Withdraw specific amount
vaultManager.withdraw(0.5 ether);
```

## Requirements

- Solidity 0.8.30
- Uses SafeMath library for mathematical operations
- Emits events on deposit and withdrawal
- Uses require() to validate operations

## Security Features

- Cannot deposit 0 ETH
- Cannot withdraw more than deposited balance
- Safe ETH transfer using low-level call
