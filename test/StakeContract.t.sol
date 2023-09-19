// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.13;

import "ds-test/test.sol";
import "../src/StakeContract.sol";
import "./mocks/MockERC20.sol";

contract StakeContractTest is DSTest {
    StakeContract public stakeContract;
    MockERC20 public mockToken; 

    function setUp() public {
        stakeContract = new StakeContract();
        mockToken = new MockERC20();
    }

    function test_staking_tokens_fuzz(uint8 amount) public {
        mockToken.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount, address(mockToken));
        assertTrue(stakePassed);
    }

}