// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.11;

contract Lottery {
    address payable[] public player;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function GetBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function GetPlayers() public view returns (address payable[] memory) {
        return player;
    }

    function EnterToLottery() public payable {
        require(msg.value > 1 ether);
        player.push(payable(msg.sender));
    }

    function GetRandomNumber() public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(admin, block.timestamp)));
    }

    function Winner() public OnlyAdmin {
        uint256 index = GetRandomNumber() % player.length;
        player[index].transfer(address(this).balance);

        player = new address payable[](0);
    }

    modifier OnlyAdmin() {
        require(msg.sender == admin);
        _;
    }
}
