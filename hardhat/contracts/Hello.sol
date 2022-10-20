//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract Hello {

    string public message = "Hello World";
    address public owner;

    constructor(){
        console.log("Owner address: ", msg.sender);
    }

    function getMessage() public view returns (string memory){
        return message;
    }
}