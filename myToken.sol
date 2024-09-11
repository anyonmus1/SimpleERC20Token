// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the OpenZeppelin ERC20 and Ownable contracts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// MyToken contract inheriting from OpenZeppelin's ERC20 and Ownable
contract MyToken is ERC20, Ownable {

    // Constructor to set token details (name and symbol)
    constructor() ERC20("MyToken", "MTK") Ownable(msg.sender) {
        // Optionally, mint some initial tokens to the deployer (msg.sender)
        _mint(msg.sender, 1000 * 10 ** decimals()); // Mints 1000 * 10 power 18 or a 1 with 21 zeros behind it to the deployer of the contarct
    }

    // Mint function to create new tokens, only the owner can call this
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn function to destroy tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}