// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
///////////////////////// Selfdestruct ( address ) //////////////////////////
////////////////////////////////////////////////////////////////////////////

contract Test{
    address owner;
    
    constructor(){
        owner = msg.sender;
    }

    receive() external payable {}

    function destroy() external{
        require( owner== msg.sender, "you are not the owner");
        selfdestruct(payable(owner));
    }

    function getOwner() public view returns (address){
        return owner;
    }

}
