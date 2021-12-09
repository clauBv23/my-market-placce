// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
    address public owner;
    uint256 public last_completed_migration;

    modifier restricted() {
        // if (msg.sender == owner) _;
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function setCompleted(uint256 completed) public restricted {
        last_completed_migration = completed;
    }

    function update(address new_aaddress) public restricted {
        Migrations upgraded = Migrations(new_aaddress);
        upgraded.setCompleted(last_completed_migration);
    }
}
