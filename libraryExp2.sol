// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

library Math{

    function max(int[] memory self, int addVal1, int addVal2) public pure returns(int){
        if (self.length==0){
            return 0;
        }
        int currentNum = self[0];
        for (uint i; i<self.length; i++){
            if (self[i] > currentNum){
                currentNum = self[i];
            }
        }
        return currentNum + addVal1 + addVal2;
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
        return nums.max(1,10); 
        // FirstInput.max(secondInput, thirdInput)
        // This is the reason we name the first Input self.
    }

    function getMaxU() public view returns(uint){
        return UNums.max();
    }
}

