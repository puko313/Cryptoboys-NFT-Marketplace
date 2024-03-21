// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.8.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  event MigrationCompleted(unit indexed completed)

  constructor() {
    owner = msg.sender;
  }

  modifier restricted() {
     require(msg.sender == owner, "Restricted to owner only");
     _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
    emit MigrationCompleted(completed)
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}


