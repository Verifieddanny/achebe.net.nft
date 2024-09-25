// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title A simple earn NFT Contract
 * @author Daniel Nwachukwu (DevDanny)
 * @notice This contract is for rewarding users nft for for answering questions on Chinua Achebe
 * @dev Impements NFT Mint
 */
contract AchebeNFT is ERC721URIStorage, Ownable {
    uint256 private s_tokenIds;

    event NFTMinted(address recipient, uint256 tokenId, string tokenURI);

    constructor(string memory name, string memory symbol, address achebeNetAdmin)
        ERC721(name, symbol)
        Ownable(achebeNetAdmin)
    {}

    function mintNFT(string memory _tokenURI) public {
        s_tokenIds += 1;
        uint256 newNftId = s_tokenIds;

        _mint(msg.sender, newNftId);
        _setTokenURI(newNftId, _tokenURI);

        emit NFTMinted(msg.sender, newNftId, _tokenURI);
    }

    function _setTokenURI(uint256 _tokenId, string memory _tokenURI) internal virtual override {
        super._setTokenURI(_tokenId, _tokenURI);
    }
}
