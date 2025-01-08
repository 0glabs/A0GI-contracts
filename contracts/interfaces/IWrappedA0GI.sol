// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

interface IWrappedA0GI {
    // Events
    event Approval(address indexed src, address indexed guy, uint wad);
    event Transfer(address indexed src, address indexed dst, uint wad);
    event Deposit(address indexed dst, uint wad);
    event Withdrawal(address indexed src, uint wad);
    event Mint(address indexed minter, address indexed dst, uint wad);
    event Burn(address indexed minter, uint wad);

    // ERC-20 compatible
    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function decimals() external view returns (uint8);

    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint);

    function approve(address spender, uint wad) external returns (bool);

    function transfer(address recipient, uint wad) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint wad
    ) external returns (bool);

    // Deposit & Withdraw
    function deposit() external payable;

    function withdraw(uint wad) external;

    // Mint & Burn
    function mint(address recipient, uint wad) external;

    function burn(uint wad) external;
}
