// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Estos tokens van a servir para hacer staking

// Persona 1. (Owner) -> 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// Persona 2. (receptor) -> 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// Persona 3. (Operador o spender) -> 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db


contract JamToken {
    
    // Declaraciones
    string public name = "JAM Token";
    string public symbol = "JAM";
    uint256 public totalSupply = 1000000000000000000000000; // 1 millon de tokens
    uint public decimals = 18; // nuestro token va a tener 18 decimales

    // Evento para la transferencia de tokens de un usuario
    event Transfer (
        // las palabras indexed sirven para filtrar en caso de querer con mas detalle estas operaciones
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // Evento para la aprobacion de un operador
    event Approval (
        address indexed _owner,
        address indexed _spender,
        uint256 value
    );

    // Estructuras de datos
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    // Constructor 
    constructor(){
        // asignando el total supply al msg.sender (en este caso owner del smart contract)
        balanceOf[msg.sender] = totalSupply;
    }

    // Transferencia de tokens de un usuario
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Transferencia de tokens especificando el emisor
    // Onwer (20 tokens) -> Operador (5 Tokens)
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value; 
        emit Transfer(_from, _to, _value);
        return true;
    }

    // Aprobacion de una cantidad para ser gastada por un operador
    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

}