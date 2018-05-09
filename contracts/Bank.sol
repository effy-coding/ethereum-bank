pragma solidity ^0.4.4;

contract Bank {
    address public owner;

    function Bank(address _owner) public {
        owner = _owner;
    }

    function deposit() public payable {
        require(msg.value > 0);
    }

    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
}
