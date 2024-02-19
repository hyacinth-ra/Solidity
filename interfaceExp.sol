// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Interface  ////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

interface ReturnValue{
    // // X uint x; we cannot define this line in an interface. 
    ///// we cannot have state variable in an interface.
    ///// But we can have enum or struct in an interface.
    function getValue() external view returns(string memory);
}

contract A is ReturnValue{
    string str = "Hello";
    function getValue() external view override returns(string memory){
        return str;
    }
    function getValue2() external view returns(string memory){
        return str;
    }
}

contract B is ReturnValue{
    string str = "World";
    function getValue() external view override returns(string memory){
        return str;
    }
    function getValue2() external view returns(string memory){
        return str;
    }
}

contract test{
    ReturnValue[] values = [ReturnValue(new A()), new B()];
    function getValues() public view returns(string[] memory){
        string[] memory valueList = new string[](values.length);
        for (uint i; i<values.length; i++){
            valueList[i] = values[i].getValue(); 
            // In this line we cannot call getValue2 (however both A and B have this function) 
            // because it has not defined in the interface ReturnValue and 
            // we defined the type of the array as ReturnValue. 
        }
        return valueList;
    }

}
