// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

/// @title SimpleSalaryPayment
/// @notice Lets an employer pay salaries in an ERC-20 token, with every payment logged on-chain.
/// @dev The owner must first approve this contract to spend their tokens.
contract SimpleSalaryPayment {
    address public immutable owner;
    IERC20 public immutable token;

    /// @notice Emitted for every salary payment, giving a transparent record of who was paid what.
    event SalaryPaid(address indexed from, address indexed to, uint256 amount);

    constructor(address _tokenAddress) {
        require(_tokenAddress != address(0), "Token address cannot be zero.");
        owner = msg.sender;
        token = IERC20(_tokenAddress);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    /// @notice Pays `amount` tokens from the owner's wallet to `recipient`.
    function paySalary(address recipient, uint256 amount) external onlyOwner {
        require(token.transferFrom(owner, recipient, amount), "Failed to transfer salary.");
        emit SalaryPaid(owner, recipient, amount);
    }
}
