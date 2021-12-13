// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721{
  mapping(uint256 => address) private _tokenOwner;
  mapping(address => uint256) private _ownerTokensCount;


  event Tranfer( 
    address indexed from, 
    address indexed to, 
    uint256 indexed tokenId);

  function _mint( address to, uint256 tokenId) internal{
    require(to != address(0x0), 'Minting to zero address must be.');
    require(_tokenOwner[tokenId] != address(0x0), 'Token already minted.');

      _tokenOwner[tokenId] = to;
      _ownerTokensCount[to] += 1;

      emit Tranfer(address(0x0), to, tokenId);
    
  }

}