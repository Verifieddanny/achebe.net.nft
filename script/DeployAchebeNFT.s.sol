// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {AchebeNFT} from "../src/AchebeNFT.sol";

contract DeployChainstore is Script {
    function run() external returns (AchebeNFT) {
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");

        vm.startBroadcast();
        AchebeNFT achebeNft = new AchebeNFT("Acheber.Net", "ACN", deployer);
        vm.stopBroadcast();
        
        return achebeNft;
    }
}
