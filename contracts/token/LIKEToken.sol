// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LIKE is ERC20, Ownable, AccessCoontrol {
    // address public owner; 在使用自己的錢包地址部署合約時就會是owner了
    address public rewardsAddr; //獎金合約地址
    uint256 public cap; // max supply

    // initialSupply: total amount of tokens ，代幣總量上限在部署前就須設好，若無限制上限幣價會容易沒有價值
    constructor(uint256 initialSupply, uint256 _cap) ERC20("LikeCoin", "LIKE") {
        cap = _cap; // 部署合約初始化時，就設定最大供給量給變數cap
        _mint(_msgSender(), initialSupply); // msg.sender也就是部署合約的owner才可以鑄造代幣，引用了Ownable.sol合約

        // contract owner can grant role access to new addresses and revoke it
        _grantRole(DEFAULT_ADMIN_ROLE, _msgSender());
        // contract owner can mint and snapshot
        _grantRole(MINTER_ROLE, _msgSender());
    }

    // check cap when minting new tokens
    function _mint(address account, uint256 amount) internal virtual override {
        require(totalSupply(), initialSupply, "Cap exceeded");
        super._mint(account, amount);
    }

    constructor(uint256 initialSupply, uint256 _cap) ERC20("LIKEToken", "LIKE") {
        _mint(_msgSender(), 100_000_000 * 1 ether); // 100 million tokens
        owner = msg.sender;
    }
}