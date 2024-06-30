// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageContext {
    // Mapping to store the balance of each address
    mapping(address => uint256) public balances;

    // Event to log the deposit action
    event Deposit(address indexed sender, uint256 amount);

    // Function to deposit Ether into the contract
    function deposit() public payable {
        // Ensure the amount sent is greater than 0
        require(msg.value > 0, "Amount must be greater than 0");

        // Update the balance of the sender
        balances[msg.sender] += msg.value;

        // Emit the Deposit event
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        // Ensure the sender has enough balance to withdraw
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Update the balance of the sender
        balances[msg.sender] -= amount;

        // Transfer the amount to the sender
        payable(msg.sender).transfer(amount);
    }

    // Function to get the contract balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Function to check the sender's balance
    function checkMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
