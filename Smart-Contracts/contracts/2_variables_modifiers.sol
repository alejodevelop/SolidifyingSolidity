// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract variables_modifiers {

    // valores enteros sin signos (uint)
    uint256 a;
    uint8 public b = 3;
    uint c = 20;
    
    // Valores enteros con signo (int)
    int256 d;
    int8 public e = -32;
    int f = 65;

    // Variable string
    string str;
    string public str_public = "esto es publico";
    string private str_private = "esto es privado";

    // Variable booleana
    bool boolean;
    bool public boolean_true = true;
    bool private boolean_false = false;

    // Variable bytes
    bytes32 first_bytes;
    bytes4 second_bytes;
    // byte es el alias que se define para byte1
    bytes1 bytes_1;

    // Algoritmos de hash
    bytes32 public hashing_keccak256 = keccak256(abi.encodePacked("Alejandro","Cabarcas")); // esta funcion llama al algoritmo de hash usado en ethereum
    bytes32 public hashing_sha256 = sha256(abi.encodePacked("Hello world", uint(10)));
    bytes20 public hashing_ripemd160 = ripemd160(abi.encodePacked("Hello world", 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2)); 

    // Variable address
    address my_address;
    address public address1 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    // msg.sender retorna la direccion de la persona que esta ejecutando esta funcion
    address public address2 = msg.sender;

    // Variable de enumeracion 
    enum options {ON,OFF}
    options state;
    options constant defaultChoice = options.OFF;

    function turnOn() public {
        state = options.ON;
    }

    function turnOff() public {
        state = options.OFF;
    }

    function displayState() public view returns (options){
        return state;
    }



    




}