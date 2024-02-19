// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
////////////////////////////// Structs //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

contract DefinePerson{
    mapping (address => Person) people;

    struct Person{
        string name;
        address addr;
        uint balance;
    }

    function createPerson (string memory name) public payable{
        Person memory p = Person({name:name, addr:msg.sender, balance:msg.value});
        people[msg.sender] = p;
    }

    function getName()public view returns(string memory){
        return people[msg.sender].name;
    }

    function setName(string memory newName) public {
        people[msg.sender].name = newName;
    }
}

////////////////// add the list of the friends in Person //////////////////
contract Friends{
    mapping(address => Person) people;

    struct Person{
        string name;
        address addr;
        Person[] friends;
    }

    // function createPerson(string memory name) public payable{
    //     Person memory p;
    //     p.name = name;
    //     p.addr = msg.sender;
    //     p.balance = msg.value;
    //     people[msg.sender] = p;
    // }
    function setName(string memory newName) public{
        people[msg.sender].addr = msg.sender;
        people[msg.sender].name = newName;
    }
    function addFriends(address friend) public {
        require(people[friend].addr != address(0),"friend has not set name");
        people[msg.sender].friends.push(people[friend]);
    }
    function getFriends() public view returns(string[] memory){
        uint numF = people[msg.sender].friends.length;
        string[] memory listFriends = new string[](numF);
        for (uint i; i<numF; i++){
            listFriends[i] = people[msg.sender].friends[i].name;
        }
        return listFriends;
    }
}