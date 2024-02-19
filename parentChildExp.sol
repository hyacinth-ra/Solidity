// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Parent & Child  //////////////////////////////////
//////////////////////////////// Contarcts //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//Parent
contract Storage{ 
    uint x;
    uint y;

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

//Child
contract Child is Storage{ 
    //child can have several parents like S1,S2,S3. In this case we write the following line instead of above line:
    // contract Child is S1,S2,S3 {}
    
    //override: (same name, same inputs and outputs, do the diffirent things with the function in parent)
    function getX() public view override returns(uint){
        // return x;
        return x + super.getX(); // super.getX() call the function getX from the parent
        // if we want to call getX in this contract just we can write getX().
    }


    //overload: (same name, diff inputs and outputs, do the diffirent things with the function in parent)
    function getY(uint addVal) public view returns(uint){
        // return y+addVal;
        return getY() +addVal ; // call the getY function in the parent contract
    }
}