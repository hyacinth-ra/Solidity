// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////  Library  ////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

library Math{

    function max(int[] memory numbers) public pure returns(int){
        if (numbers.length==0){
            return 0;
        }
        int currentNum = numbers[0];
        for (uint i; i<numbers.length; i++){
            if (numbers[i] > currentNum){
                currentNum = numbers[i];
            }
        }
        return currentNum;
    }

    function max(uint[] memory Unumbers) public pure returns(uint){
        if (Unumbers.length==0){
            return 0;
        }
        uint currentNum = Unumbers[0];
        for (uint i; i<Unumbers.length; i++){
            if (Unumbers[i] > currentNum){
                currentNum = Unumbers[i];
            }
        }
        return currentNum;
    }
}

// first method
// contract Test{
//     int[] nums;
//     uint[] UNums;
    
//     function addnum(int val) public {
//         nums.push(val);
//     }

//     function addUNum(uint val) public{
//         UNums.push(val);
//     }

//     function getMax() public view returns(int){
//         return Math.max(nums);
//     }

//     function getMaxU() public view returns(uint){
//         return Math.max(UNums);
//     }
// }

//second method
using Math for uint[];
using Math for int[];
contract Test{
    int[] nums;
    uint[] UNums;
    
    function addnum(int val) public {
        nums.push(val);
    }

    function addUNum(uint val) public{
        UNums.push(val);
    }

    function getMax() public view returns(int){
        return nums.max();
    }

    function getMaxU() public view returns(uint){
        return UNums.max();
    }
}
