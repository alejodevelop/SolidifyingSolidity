// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Food{

    // Estructura de datos
    struct dinnerPlate {
        string name;
        string ingredients;
    }

    // Menu del dia
    dinnerPlate [] public menu;

    // Creacion de un nuevo menu
    /* Internal es como el modificador protected en POO, accesible en el smart contract
       actual, y en las que herenda de esta
    */   
    function newMenu(string memory _name, string memory _ingredients) internal {
        menu.push(dinnerPlate(_name, _ingredients));
    }
}

contract Hamburger is Food {
    
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    // Cocinar una hamburguesa desde el Smart Contract principal
    // External permite ser accedido solo por otros contratos
    function doHamburguer(string memory _ingredients, uint _uints) external {
        require( _uints <= 5, "Ups, no puedes pedir tantas hamburguesas");
        newMenu("Hamburguer", _ingredients);
    }

    // Modifier: permitir el accesso unicamente al owner y solo al owner 
    modifier onlyOwner(){
        require(owner == msg.sender, "No tienes permisos para ejecutar esta funcion");
        _;
    }

    // Restriccion a la ejecucion (solo puede el owner)
    function hashPrivateNumber(uint _number) public view onlyOwner returns(bytes32){
        return keccak256(abi.encodePacked(_number));
    }
}