// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721{
  mapping(uint256 => address) private _tokenOwner;
  mapping(address => uint256) private _ownerTokensCount;
  mapping(uint256 => address) private _tokensAproval;



  event Tranfer( 
    address indexed from, 
    address indexed to, 
    uint256 indexed tokenId);

    /// @dev This emits when the approved address for an NFT is changed or
    ///  reaffirmed. The zero address indicates there is no approved address.
    ///  When a Transfer event emits, this also indicates that the approved
    ///  address for that NFT (if any) is reset to none.
    event Approval(
      address indexed _owner, 
      address indexed _approved, 
      uint256 indexed _tokenId);

  function _mint( address to, uint256 tokenId) internal virtual{
    require(to != address(0x0), 'Minting to zero address must be.');
    require(_tokenOwner[tokenId] == address(0x0), 'Token already minted.');

      _tokenOwner[tokenId] = to;
      _ownerTokensCount[to] += 1;

      emit Tranfer(address(0x0), to, tokenId);
    
  }

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
   function balanceOf(address _owner) public view returns (uint256){
      require( _owner != address(0), "Can't get the zero address balance ");
     return _ownerTokensCount[_owner];
   }

    /// @notice Find the owner of an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @param _tokenId The identifier for an NFT
    /// @return The address of the owner of the NFT
   function ownerOf(uint256 _tokenId) public view returns (address){
     address owner = _tokenOwner[_tokenId];
     require( owner != address(0), "Can't get the zero address balance ");
     return owner;
   }

    /// @notice Change or reaffirm the approved address for an NFT
    /// @dev The zero address indicates there is no approved address.
    ///  Throws unless `msg.sender` is the current NFT owner, or an authorized
    ///  operator of the current owner.
    /// @param _approved The new approved NFT controller
    /// @param _tokenId The NFT to approve
    function approve(address _approved, uint256 _tokenId) external payable{
      address owner = ownerOf(_tokenId);
      require(_approved != address(0), "Aprove address can't be zero address");
      require(msg.sender == owner, "The aproval sender must be te token owner");
      require(_approved != owner, "error Aproval to current owner.");
      _tokensAproval[_tokenId] = _approved;

      emit Approval(owner, _approved, _tokenId);
    }
  

}