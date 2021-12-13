// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract KriptoBirdz is ERC721Connector {
    // string public name;
    // string public symbol;

    string[] public kriptoBirdz;
    mapping(string => bool) private _kriptoBirdsExist;

    constructor() ERC721Connector('KriptoBirdz', 'KRIPTOBIRDZ'){
    }

    function mint( string memory kriptoBird) public {
        require(!_kriptoBirdsExist[kriptoBird], 
            'The kriptoBird already exist.');

        kriptoBirdz.push(kriptoBird);
        uint256 _id = kriptoBirdz.length - 1;
        
        _mint(msg.sender, _id);
        _kriptoBirdsExist[kriptoBird] = true;

    }
}
