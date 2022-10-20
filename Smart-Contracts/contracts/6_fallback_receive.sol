// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/* fallback() y receive() ?

msg.data -> El calldata completo, que es un area no modificable y no persistente
            en la que se almacena los argumentos de la funcion y que se comporta
            principalmente como la memoria, se pueden enviar mensajes por aqui.

    Ether enviado al Smart Contract
                    |
                msg.data vacio?
                /            \
               si             no
              /                \
      existe receive()?     fallback()
            /    \       
           si     no
          /         \ 
     receive()    fallback()

*/

contract fallback_receive {

    event log(string _name, address _sender, uint, bytes _data);

    receive() external payable {
        emit log("receive", msg.sender, msg.value, "");
    }

    fallback() external payable{
        emit log("fallback", msg.sender, msg.value, msg.data);
    }
}