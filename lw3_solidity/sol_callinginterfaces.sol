//contracts calling other contracts via interfaces; serve same purpose as ABI
//you don't need to call all the fns, just include the one you need
//Assume there is an external ERC20 contract, and we are interested in calling the balanceOf function to check the balance of a given address from our contract.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface MinimalERC20 {
    // Just include the functions we are interested in
    // in the interface
    function balanceOf(address account) external view returns (uint256);
}

contract MyContract {
    MinimalERC20 externalContract;

    constructor(address _externalContract) {
        // Initialize a MinimalERC20 contract instance
        externalContract = MinimalERC20(_externalContract);
    }

    function mustHaveSomeBalance() public {
        // Require that the caller of this transaction has a non-zero
        // balance of tokens in the external ERC20 contract
        uint balance = externalContract.balanceOf(msg.sender);
        require(balance > 0, "You don't own any tokens of external contract");
    }
}