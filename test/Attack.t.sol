// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {Test, console2} from "forge-std/Test.sol";

contract ForkTest is Test {
    // the identifiers of the forks
    uint256 optimismFork;

    //Access variables from .env file via vm.envString("varname")
    //Replace ALCHEMY_KEY by your alchemy key or Etherscan key, change RPC url if need
    //inside your .env file e.g:
    //MAINNET_RPC_URL = 'https://eth-mainnet.g.alchemy.com/v2/ALCHEMY_KEY'
    //string MAINNET_RPC_URL = vm.envString("MAINNET_RPC_URL");
    //string OPTIMISM_RPC_URL = vm.envString("OPTIMISM_RPC_URL");

    // create two _different_ forks during setup
    function setUp() public {
        // optimismFork = vm.createFork(
        //     "https://optimism-mainnet.infura.io/v3/84ae029a3e6242a49c0e49d18fdcfc01"
        // );
    }

    // set `block.number` of a fork
    function testAttack() public {
        // vm.selectFork(optimismFork);
        address bentoUtil = address(0xBc1Bb37A522EDB1cAa073ac2B3DEbAcd5E89D81d);
    }
}
