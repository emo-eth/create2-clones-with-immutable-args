// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Test } from "forge-std/Test.sol";
import { Create2ClonesWithImmutableArgs } from "../src/Create2ClonesWithImmutableArgs.sol";
import { ExampleClone } from "../src/ExampleClone.sol";

contract Create2ClonesWithImmutableArgsTest is Test {
    ExampleClone internal clone;

    function setUp() public {
        clone = new ExampleClone();
    }

    function testDerive() public {
        bytes memory packedArgs = abi.encodePacked(address(1), uint256(2), uint256(3), uint256(4));
        address expected =
            Create2ClonesWithImmutableArgs.deriveAddress(address(this), address(clone), packedArgs, bytes32(uint256(5)));
        address actual = Create2ClonesWithImmutableArgs.clone(address(clone), packedArgs, bytes32(uint256(5)));
        assertEq(expected, actual);
    }
}
