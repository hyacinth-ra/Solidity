// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
///////////////////////////////// Time //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

contract Test{
    function getTime() public view returns(uint){
        return block.timestamp; 
        // //output is an integer number. number of seconds has been passed since special date(Jan1, 1970)
        // //it is called epoch time
        // return block.timestamp - 1 days;
        // return block.timestamp - 1 seconds; // minutes, hours, weeks

    }
}

////////////////. define a contract just works for 1 minute. //////////////////
contract OneMin{
    uint expiry;
    uint count;
    constructor () {
        expiry = block.timestamp + 1 minutes;
    }
    function test() public{
        require(block.timestamp < expiry, "Timeout");
        count++;
    }
}

/////////////// write a contract that shows  /////////
/////////////// the difference btw the last time called function and now  //////////////
contract DurationTime {
    uint public lastTime;
    uint count;

    constructor(){
        lastTime = block.timestamp;
    }

    function increment() public{
        count ++;
        lastTime = block.timestamp;
    }
    function getMinutesSinceLastCall() public view returns(uint){
        return (block.timestamp-lastTime)/ 1 minutes;
    }
}
