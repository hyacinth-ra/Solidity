// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
///////////////////////////// Reference to Array ////////////////////////////
////////////////////////////////////////////////////////////////////////////

contract refArr{
    function test() public pure returns(uint[3] memory, uint[3] memory){
        uint[][3] memory x;//[[],[],[]]
        uint[][3] memory y = [new uint[](1), new uint[](2), new uint[](1)]; //[[0],[0,0],[0]]
        //
        uint[3] memory numbers = [uint(1),2,3];
        uint[3] memory numbers2 = numbers;
        numbers[1] = 0; //the value of the numbers2[1] is also changed. 
        return(numbers, numbers2); // [1,0,3], [1,0,3]
    }
    
}


//////////////////////////////////////////////////////////////////////////////
///////////////////////////// Reference to Array ////////////////////////////
////////////////////////////////////////////////////////////////////////////

contract Hello{
    string x = "Hello World";
    // we cannot write the following codes:
    // x.length
    // x.pop()
    // x.push("I")
    // x[1]
    // for having the above codes we should use bytes
    bytes public y = "Hello World2";
    function test() public returns(string memory) {
        y.push("1");
        y.push("3");
        uint L = y.length;
        y.pop();
        delete y[11];
        return string(y);
    }
    function test2(string memory str) public pure{
        // For the following two lines, we got an erro: 
        // Memory "push" is not available in bytes memory out of storage.

        // bytes memory newStr = bytes(str);
        // newStr.push("I");

        //to solve the problem we have two methods:
        // First 
        bytes memory newStr = new bytes(bytes(str).length + 1);
        for (uint i; i < newStr.length; i++){
            newStr[i] = bytes(str)[i];
        }
        newStr[newStr.length] = "I";

        // Second
        string memory newStr2 = string.concat(str,"I");
    } 
}

/////// we want to collect the address of users:
// contract CollectAddr{
//     address[] public addresses;
//     function addAddress() external {
//         for (uint i=0; i<addresses.length;i++){
//             if (addresses[i]==msg.sender){
//                 revert("Sender is already in the list.");
//             }
//         }
//         addresses.push(msg.sender);
//     }
// }
//// The above code may pass the limitation of the gas. To solve we use mapping (need more storage)
contract CollectAddr{
    address[] public addresses;
    mapping( address => bool ) addressesAdded;

    function addAddress() external{
        require(!addressesAdded[msg.sender], " Sender is alreday in the list");
        addressesAdded[msg.sender] = true;
        addresses.push(msg.sender);
    }
}