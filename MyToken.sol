// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*
       REQUIREMENTS
    1. The contract will have public variables that store the details about the coin (Token Name, Token Abbreviation, Total Supply)
    2. The contract will have a mapping of addresses to balances (address => uint)
    3. The contract will have a mint function that takes two parameters: an address and a value.
       The function then increases the total supply by that number and increases the balance
       of the recipient address by that amount.
    4. The contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens.
       It will take an address and value just like the mint function. It will then deduct the value from the total supply
       and from the balance of the account.
    5. The burn function will have conditionals to make sure the balance of the account is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // Public variables to store the token details
    string public tokenName = "AshutoshJha";
    string public tokenAbbrv = "OJASHUTO";
    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    //IT automatically initialize totalSupply to 0
    constructor() {
        totalSupply = 0;
    }

    // Function to mint new tokens
    function mint(address _recipient, uint256 _amount) external {
        require(_recipient != address(0), "Cannot mint to the zero address");
        totalSupply += _amount;
        balances[_recipient] += _amount;
    }

    // Function to burn tokens
    function burn(address _account, uint256 _amount) external {
        require(_account != address(0), "Cannot burn from the zero address");
        require(balances[_account] >= _amount, "Insufficient balance to burn");
        balances[_account] -= _amount;
        totalSupply -= _amount;
    }
}
