// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// 0xd9145CCE52D386f254917e481eB44e9943F39138
contract MyShop {
    address owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable  {
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}
