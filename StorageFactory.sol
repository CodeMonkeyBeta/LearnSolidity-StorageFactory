// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
//Learned how to :Import code from other files into our file, deploy contracts from our contract,
// interact with other contract outside our contract, inheritance

import "./SimpleStorage.sol";
// "is" allows StorageFactory to inherite all functions from SimpleStorage (ie: Inheritance)
contract StorageFactory is SimpleStorage {

    SimpleStorage[] public simpleStorageArray;

    function creatSimpleStorageContract() public {
       SimpleStorage simpleStorage = new SimpleStorage();
       simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // To inteact with  a contract you need 2 things
        // Address and ABI(Application binary Interface) in thins case we get it from this import

        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNumber);

    }

//    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
//        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
//        return simpleStorage.retrieve();
//    }     *above is equal to below! **same thing can be done for "sfStore" function

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
}
