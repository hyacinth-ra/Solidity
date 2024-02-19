// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//     ///// ======= First approach (send) ========///////////
contract sendingEther1{

    function withDraw() public {
        address payable user = payable(msg.sender);
        bool sent = user.send(address(this).balance);
    }
}

////// ====== Second approach (transfer) =======/////////
contract sendingEther2{
    function withDraw() public {
        address payable user = payable(msg.sender);
        user.transfer(address(this).balance);
    }
}

    ///// ======== Third approach (call) =========//////////
contract sendingEther3{
    function withDraw() public{
        address payable user = payable(msg.sender);
        // (bool sent,bytes memory data) = user.call{value:address(this).balance}("");
        // OR ///
        (bool sent,) = user.call{value:address(this).balance}("");
    }
}
 //////////// The previous call has a little problem ////////////

 ///////// Example ==> Showing call problem ////////////

contract Hello{
    function withdraw() public{
        address payable user = payable (msg.sender);
        (bool sent,) = user.call{value:address(this).balance}("");
    }
    receive() external payable{}
    fallback() external payable{}
}

contract Theif{
    Hello ctr = new Hello();
    function callWithdraw() public {
        ctr.withdraw();
    }
    receive() external payable{
        ctr.withdraw();
    }
    fallback() external payable{}
}

///////// Solve the problem ///////////////

// contract Hello{
//     mapping(address => uint) received;
//     function withdraw () external{
//         uint value = received[msg.sender];
//         received[msg.sender] = 0;
//         payable (msg.sender).call{value:value}("");
//     }
//     receive() external payable{
//         received[msg.sender] += msg.value;
//     }
//     fallback() external payable{
//         received[msg.sender] += msg.value;
//     }
// }