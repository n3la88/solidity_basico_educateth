// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract tc_arb {

    // determinar la direccion de la billetera que crea el contrato
    
    address payable public owner;

    struct Data { string date;              // fecha de envio
                  string delivery_date;     // fecha estimada de llega
                  string product;           // nombre del producto
                  string price;             // precio del producto
                  string code;              // identificador del proveedor
                  string cel_number;        // contacto de la persona que compro el producto
                  int8 status;              // 1- en camino 2- llego al pais 3- esta en la aduana 4- entregado
                  address wallet;           // persona que ejecuto el contrato
    }
 
    Data public data;

    event newData(string date, 
                  string delivery_date,  
                  string product,
                  string price,
                  string code, 
                  string cel_number, 
                  int8 status,
                  address wallet);

    // modifier para que solo el owner pueda retirar los fondos del contrato

    modifier onlyOwner(){
        require(msg.sender == owner, "Solo el propietario puede retirar los fondos");
        _;
    }

    // modifier para verificar que al ejecutar la funcion se tenga el valor del fee + gas

    modifier cost(uint amount){
        require(msg.value >= amount, "No tiene saldo en ARB para ejecutar");
        _;
    }

    // se define quien es el propietario del contrato
    
    constructor(){
        owner = payable(msg.sender);    
    }

    function pushData(string memory _date,
                      string memory _delivery_date,  
                      string memory _product,
                      string memory _price,
                      string memory _code, 
                      string memory _cel_number, 
                      int8 _status) public payable cost (1000000000000000) {

            data = Data (_date,
                         _delivery_date,
                         _product,
                         _price,
                         _code,
                         _cel_number,
                         _status,
                         msg.sender);
                         
    // emit es una especie de log
            emit newData(_date,
                         _delivery_date,
                         _product,
                         _price,
                         _code,
                         _cel_number,
                         _status,
                         msg.sender);
    }

    // funcion para retirar los fondos del contrato

    function withdraw() public onlyOwner {
        uint balance = address(this).balance;
        require(balance > 0, "El contrato no cuenta con fondos");
        owner.transfer(balance);
    }

    // funcion para consultar los fondos del contrato

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

}