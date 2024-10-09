// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract variables_nativas {
    string private  fullName; 

    constructor(string memory _fullname) {
        fullName = string.concat("Mi nombre es:", " ", _fullname);
    }

    function getName() public view returns (string memory){
        return fullName;
    }

    
}