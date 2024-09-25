// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {AchebeNFT} from "../src/AchebeNFT.sol";

contract AcheberNFTTest is Test {
    AchebeNFT public achebeNFT;
    address public admin = address(0xABC);
    address public player = address(0x123);

    function setUp() public {
        achebeNFT = new AchebeNFT("Acheber.Net", "ACN", admin);
    }

    function testAdmin() public view {
        assertEq(achebeNFT.owner(), admin, "Owner not admin");
    }

    function testMintNFT() public {
        vm.deal(player, 1 ether);

        vm.prank(player);
        achebeNFT.mintNFT("ipfs://example_token_uri");

        assertEq(achebeNFT.ownerOf(1), player, "Player is not owner of NFT");
    }
}
