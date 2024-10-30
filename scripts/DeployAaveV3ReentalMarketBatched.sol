// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import {DeployAaveV3MarketBatchedBase} from "./misc/DeployAaveV3MarketBatchedBase.sol";

import {ReentalMarketInput} from "../src/deployments/inputs/ReentalMarketInput.sol";

contract Reental is DeployAaveV3MarketBatchedBase, ReentalMarketInput {}
