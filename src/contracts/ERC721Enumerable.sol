// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721.sol';

contract ERC721Enumerable is ERC721{
  
    uint256[] private _allTokens;
    mapping(uint256=>uint256) private _tokenIdTokenIdx;
    mapping(uint256=>uint256) private _tokenIdownerListIdx;

    mapping(address =>uint256[]) private _ownerTokens;


    /// @notice Count NFTs tracked by this contract
    /// @return A count of valid NFTs tracked by this contract, where each one of
    ///  them has an assigned and queryable owner not equal to the zero address
    function totalSupply() public view returns (uint256){
        return _allTokens.length; 
    }

     /// @notice Enumerate valid NFTs
    /// @dev Throws if `_index` >= `totalSupply()`.
    /// @param _index A counter less than `totalSupply()`
    /// @return The token identifier for the `_index`th NFT,
    ///  (sort order not specified)
    function tokenByIndex(uint256 _index) public view returns (uint256){
      require(_index < totalSupply(), "The idx cant excede the total suply");
      return _allTokens[_index];
    }

    /// @notice Enumerate NFTs assigned to an owner
    /// @dev Throws if `_index` >= `balanceOf(_owner)` or if
    ///  `_owner` is the zero address, representing invalid NFTs.
    /// @param _owner An address where we are interested in NFTs owned by them
    /// @param _index A counter less than `balanceOf(_owner)`
    /// @return The token identifier for the `_index`th NFT assigned to `_owner`,
    ///   (sort order not specified)
    function tokenOfOwnerByIndex(address _owner, uint256 _index) public view returns (uint256){
      require(_owner != address(0), "The zero address can't be the owner");
      require(_index < balanceOf(_owner), "The idx cant excede the owner balance");
      
      return _ownerTokens[_owner][_index];
    }

   function _mint( address to, uint256 tokenId) internal override(ERC721){
    super._mint(to, tokenId);

    _tokenIdTokenIdx[tokenId] = _allTokens.length;
    _allTokens.push(tokenId);
    _tokenIdownerListIdx[tokenId] = _ownerTokens[to].length;
    _ownerTokens[to].push(tokenId);
  }
} 