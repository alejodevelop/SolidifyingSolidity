// SPDX-License-Identifier: MIT

// Version

pragma solidity ^0.8.4;

// importar smart contract desde openzeppelin
import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";

// Declaracion del Smart Contract, heredando smartcontract ERC721 (NFT) 
contract FirstContract is ERC721{

    // Direccion de la persona que despliega el contrato
    address public owner;

    /* Almacenamos en la variable "owner" la direccion de la persona
    que despliega el contrato */
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol){
        // me da la direccion de quien ejecuta la funcion, en este caso el owner
        owner = msg.sender;

    }

}
