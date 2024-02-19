// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;



enum Size{
    Small,
    Medium,
    Large
}

enum Type{
    OnePercent,
    TwoPercent
}

contract Item{
    uint price;

    constructor(uint _price){
        price = _price;
    }

    function getPrice() public view returns(uint){
        return price;
    }
}

contract Milk is Item{
    Type milkType;
    uint liters;
    constructor(Type _milkType , uint _liters, uint _price) Item(_price){
        milkType = _milkType;
        liters = _liters;
    }
}

contract Shirt is Item{
    Size size;
    constructor(Size _size,uint _price) Item(_price){
        size = _size;
    }
}

contract Shopping{
    Item[] items;
    function addMilk(Type _type, uint _liter, uint _price) public {
        Milk milk = new Milk(_type, _liter, _price);
        items.push(milk);
    }

    function addShirt(Size _size, uint _price) public{
        Shirt shirt = new Shirt(_size, _price);
        items.push(shirt);
    }

    function getTotalPrice() public view returns(uint){
        uint totalPrice;
        for (uint i;i<items.length;i++){
            totalPrice += items[i].getPrice();
        }
        return totalPrice;
    }

}