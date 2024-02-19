// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Parent & Child  //////////////////////////////////
//////////////////////////////// Contarcts //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// //// Now consider that the parent contract has a constructor which gets an input. How we can define our child?
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// //Parent
contract Storage{ 
    uint x;
    uint y;

    constructor(uint startingValue){
        x = startingValue;
    }

    function setX(uint val) public {
        x = val;
    }

    function getX() public view virtual returns(uint){
        return x+10;
    }

    function setY(uint val) public{
        y = val;
    }

    function getY() public view virtual returns(uint){
        return y+10;
    }
}

// fisrt method 
contract Child is Storage(100){ 

    function getX() public view override returns(uint){
        return x;
    }

    function getY(uint addVal) public view returns(uint){
        return y+addVal;
    }
}

// // second method
// contract Child is Storage{ 
//     constructor(uint startingValue) Storage(startingValue){
//     }
    
//     function getX() public view override returns(uint){
//         return x;
//     }

//     function getY(uint addVal) public view returns(uint){
//         return y+addVal;
//     }
// }