// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC165.sol';
import './interfaces/IERC721Metadata.sol';

contract ERC721Metadata is IERC721Metadata, ERC165{

  string private _name;
  string private _symbol;

  constructor(string memory named, string memory symbolize){
      _name = named;
      _symbol = symbolize;
     
      _registerInterface(bytes4(keccak256('name()')^keccak256('symbol()')));
  }

  function name() external view override returns(string memory){
    return _name;
  }

  function symbol() external view override returns(string memory){
    return _symbol;
  }
}