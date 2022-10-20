// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Funciones de tipo payable (envio y recepcion de ether)

contract ethSend {
    constructor () payable {}
    receive() external payable{}

    // Eventos
    event sendStatus(bool);
    event callStatus(bool, bytes);

    // la funcion transfer y send envian 2300 unidades de gas

    // Transfer
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(1 ether);
    //  _to.transfer(1); de esta forma si queremos enviar una unidad de gas
    //  1 ether son 10^18 terminos de gas
    }

    // Send
    function sendViaSend(address payable _to) public payable {
       bool sent = _to.send(1 ether);
       emit sendStatus(sent);
       require(sent == true, "El envio ha fallado"); // en caso de que no se respete la condicion, muestra el mensaje
    }

    // la funcion call envia todo el gas para no estar restringido

    // Call
    function sendViaCall(address payable _to) public payable {
        // addr.call{value: x}("")
        (bool success, bytes memory data) = _to.call{value: 1 ether}("");
        emit callStatus(success,data);
        require(success == true, "El envio ha fallado");
    }
}


contract ethReceiver {

    event log(uint amount, uint gas);

    receive() external payable {
        emit log(address(this).balance, gasleft());
    }
}

