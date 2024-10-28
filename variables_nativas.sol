// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract variables_nativas {

    string private  fullName; 

    constructor(string memory _fullname) {
        fullName = string.concat("Mi nombre es:", " ", _fullname);
    }

    function getName() public view returns (string memory){
        return fullName;
    }

    /*
    uint enteros sin signo
    uint8 rango de 0 a 2 ** 8 -1
    uint16 rango de 0 a 2 ** 16 -1
    */
    
    uint8 public uint_8 = 1;
    uint16 public uint_16 = 123;

    // int permite guardar numeros con signo negativo

    int8 public int_8 = -1;

    //address 

    address public my_address = 0xd91af943a487D566aeC08569dAc91e205E335aEC;

}