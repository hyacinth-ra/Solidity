// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////  Arrays //////////////////////////////////
////////////////////////////////////////////////////////////////////////////


contract ArrayExpOne{
    uint[] numbers1 ; // It is stored in storage. This is a dynamic size.
    uint[5] numbers2; // It is fixed size array. All of the elemnts have the default value (for uint is zero).
    uint[5] numbers3 = [1,2]; //[1,2,0,0,0]
    uint[] numbers4 = [1,2]; //[1,2]
    function add( uint x ) public{
        numbers1.push(x); // the array should be a dynamic.
    }
    function pop() public{
        numbers4.pop();
    }
    function length() public view returns(uint){
        return numbers1.length;
    }
    function remove(uint indx) public{
        delete numbers3[indx]; //just change the value of indx to the default ( numbers3[idx] = 0).
//      It does not change the size of the array.
    }
}

contract ArrayExpTwo{
    uint constant y =1;
    function test() public pure{
        // uint[] memory numbers; // with this definition, we cannot change the size of the array. 
        // numbers.push(1) // we cannot push.
        // uint[] memory numbers = [1,2,3] // it is not correct. Because, the type of 1 is uint8 however the type of the number is uint256.
        // To solve the above problem, we define 1 as uint256 and It understands all the elements are uint 256;
        uint[3] memory numbers1 = [uint(1),2,3]; 
        uint x = 2;
        // uint[x] memory numbers; This is not correct because x is dynamic but the size of the array cannot be dynomic.
        uint[y] memory numbers2;
    }
    
    // We want to create an array based on the value of a dynamic array
    function test2(uint size) public pure{
        uint[] memory numbers3 = new uint[](size);
    }

    //return arrays
    function test3(uint size) public pure returns( uint[] memory){
        uint[] memory numbers4 = new uint[](size);
        return numbers4;
    }

}