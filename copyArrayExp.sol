// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
/////// Copy array: store storage array into the memory array.  /////////////
////////////////////////////////////////////////////////////////////////////

contract copyArr{
    uint x = 1;
    uint[] nums = [1,2];
    function test() public view returns (uint[] memory){
        uint[] memory numbers = nums;
        uint y = x;
        numbers[1] = 0; //the value of nums[1] remains 2. 
        return numbers;
    }
}