// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Transactions {
    uint256 transactionCount;

    event Transfer(
        address from,
        address receiver,
        uint256 amount,
        string message,
        uint256 timestamp,
        string keyword
    );

    struct TransactionStruct {
        address sender;
        address receiver;
        uint256 amount;
        string message;
        uint256 timestap;
        string keyword;
    }

    TransactionStruct[] transactions;

    function addToBlockChain(
        address payable recevier,
        uint256 amount,
        string memory message,
        string memory keyword
    ) public {
        transactionCount += 1;
        transactions.push(
            TransactionStruct(
                msg.sender,
                recevier,
                amount,
                message,
                block.timestamp,
                keyword
            )
        );

        emit Transfer(
            msg.sender,
            recevier,
            amount,
            message,
            block.timestamp,
            keyword
        );
    }

    function getAllTranscactions()
        public
        view
        returns (TransactionStruct[] memory)
    {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}
