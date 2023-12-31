// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StablecoinTransaction {
    IERC20 public stablecoin;
    event CheckBalance(uint256 amount);

    constructor(address _stablecoinAddress) {
        stablecoin = IERC20(_stablecoinAddress);
    }

    // Transfer stablecoins from sender to a recipient
    function transfer(address _recipient, uint256 _amount) external {
        require(_recipient != address(0), "Invalid recipient address");
        require(_amount > 0, "Amount must be greater than 0");

        require(stablecoin.transferFrom(msg.sender, _recipient, _amount), "Transfer failed");
    }

    // Check the stablecoin balance of an address
    function getCoinBalance(address _account) external view returns (uint256) {
        require(_account != address(0), "Invalid address");
        return stablecoin.balanceOf(_account);
    }

    function getUserBalance(address user_account) external returns (uint){
       uint user_bal = user_account.balance;
       emit CheckBalance(user_bal);
       return (user_bal);
    }
}