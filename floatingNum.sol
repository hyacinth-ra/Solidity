// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Floating number ////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//for controling underflow
contract Hello{
    function testMath(uint8 x, uint8 y) public pure returns(uint8){
        assert(y<=x);
        return x-y;
    }
}
/////////////////////// SafeMath library (for old versions) ////////////////////////////
// import "https://github.com/OpenZeppelin/openzepplin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
// // import "zeppelin-solidity/contracts/token/MintableToken.sol";

// contract HelloWorld{
//     using SafeMath for uint;
//     function test(uint x, uint y) public pure returns(uint){
//         return x.mod(y); // we can write this because we add line "using SafeMath for uint;"
//         // return SafeMath.sub(x,y); //This does not need this line "using SafeMath for uint;"
//         // return SafeMath.add(x,y);
//         // return SafeMath.div(x,y);
//         // return SafeMath.mul(x,y);
//         // return SafeMath.mod(x,y);
//     }
// }

// //////// showing big number
// contract Hello2{
//     uint x = 2.899849749723e12;
    
// }