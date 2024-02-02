// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract RWToken is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {

        //get some token for ourselves
        //msg.sneder is the person deploying the contract 

        _mint(msg.sender, 10 * 10 ** 18);
    }
}