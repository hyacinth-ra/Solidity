// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////     Enums    //////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

contract Test{

    enum Status{
        Pending,
        Shipped,
        Delivered
    }

    Status public status;
    function setStatus(Status val) public {
        status = val;
    }

    function isDelivered() public view returns(bool){
        return status==Status.Delivered;
    }

}
