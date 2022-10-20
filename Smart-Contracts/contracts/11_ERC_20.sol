// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";

contract GLDToken is ERC20   {
    constructor(uint256 initialSupply) ERC20("gold", "GLD"){
        _mint(msg.sender,initialSupply);
    }
}