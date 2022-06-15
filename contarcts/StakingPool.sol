//SPDX-LICENSE-IDENTFIER : MIT

pragma solidity 0.8.7;

contract Stakingpool {
    address public admin;
    uint256 public endData;
    bool public finalized;
    uint256 public totalInvested;
    uint256 public totalChange;
    uint256 amount;
    
    mapping (address => uint256) public balances;
    mapping (address => bool) public changeClaimed;

    event newInvestor(address investor);

    constructor() {
        admin = msg.sender;
        endData = block.timestamp + 7 days;
    }

    function invest() external payable {
        require(block.timestamp < endDate , "the time was finished");
        if(balances[msg.sender] == 0) {
            emit newInvestor(msg.sender);
        }
    }

    function finalize() external {
        require(endData <= block.timestamp);
        require(finalized == false);
        finalized = true;
        totalInvested = address(this).balance;
        totalChange = address(this).balance % 32 ether;
    }

    function getChange() external public{
        require(finalized == true);
        require(balances[msg.sender] != 0);
        changeClaimed[msg.sender] = true;
        amount = totalChange * (balances[msg.sender] / totalInvested);
        msg.sender.transfer(amount);
    }

}


//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