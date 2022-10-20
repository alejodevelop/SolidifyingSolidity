// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Estos tokens van a servir para enviar recompensas a las personas que hacen staking

// NOTA: Dado a que stellart es una copia del contrato jam token, podriamos heredar de el, y pasar por
// argumento las declaraciones de inicializacion diferentes como name y symbol.
contract StellartToken {

    // Declaraciones
    string public name = "Stellart Token";
    string public symbol = "STE";
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