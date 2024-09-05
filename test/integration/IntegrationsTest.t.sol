// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract IntegrationsTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant STARTING_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deploy = new DeployFundMe();
        fundMe = deploy.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testUserCanFundInteractions() public {
        FundFundMe fundFundMe = new FundFundMe();

        // Set the prank to simulate actions from USER
        vm.prank(USER);
        // Provide USER with sufficient balance
        vm.deal(USER, 1e18);

        // USER funds the contract
        fundMe.fund{value: SEND_VALUE}();

        // Optionally check if USER is correctly recorded as the funder
        // address funder = fundMe.getFunder(0);
        // assertEq(funder, USER);

        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        // Withdraw funds from the contract
        withdrawFundMe.withdrawFundMe(address(fundMe));

        // Assert that the contract's balance is now 0
        assert(address(fundMe).balance == 0);
    }
}
