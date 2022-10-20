// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract functions {
    
    // Funciones de tipo Pure (no se comunica o accede a la blockchain)
    function getName() public pure returns (string memory){
        return "Joan";
    }

    // Funciones de tipo View (accedemos a datos de la blockchain)
    uint256 x = 100;
    function getNumber() public view returns (uint256){
        return x*2;
    }

    





}