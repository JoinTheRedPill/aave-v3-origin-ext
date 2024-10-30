// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MarketInput.sol";

contract ReentalMarketInput is MarketInput {
    address internal constant REENTAL_MS_ADDRESS = 0x414F65A595b1cb51b685C936169a3BBdF5dC07c5;
    address internal constant REENTAL_EOA_ADDRESS = 0x94D300A6629BD1C51c632f070De929F5e96eE139;
    address internal constant WNATIVE_TOKEN_ADDRESS = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;
    address internal constant WNATIVE_TOKEN_USD_ORACLE = 0xAB594600376Ec9fD91F8e885dADF0CE036862dE0;
    address internal constant USDT_USD_ORACLE = 0x0A6513e40db6EB1b165753AD52E80663aeA50545;
    address internal constant AAVE_DAO_COLLECTOR = 0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383;

    function _getMarketInput(address deployer)
        internal
        pure
        override
        returns (
            Roles memory roles,
            MarketConfig memory config,
            DeployFlags memory flags,
            MarketReport memory deployedContracts
        )
    {
        roles.marketOwner = REENTAL_MS_ADDRESS; //MS,
        roles.emergencyAdmin = REENTAL_EOA_ADDRESS; //deployer EOA, pausa y despausa.
        roles.poolAdmin = REENTAL_MS_ADDRESS; // EOA deployer primero y luego MS a los pocos días

        config.marketId = "Aave V3 Reental Market Polygon";
        config.providerId = 1;
        config.oracleDecimals = 8;
        config.flashLoanPremiumTotal = 0.0005e4;
        config.flashLoanPremiumToProtocol = 0.0004e4;
        config.wrappedNativeToken = WNATIVE_TOKEN_ADDRESS;
        config.networkBaseTokenPriceInUsdProxyAggregator = WNATIVE_TOKEN_USD_ORACLE;
        config.marketReferenceCurrencyPriceInUsdProxyAggregator = USDT_USD_ORACLE;
        config.treasury = REENTAL_MS_ADDRESS;
        config.treasuryPartner = AAVE_DAO_COLLECTOR;
        config.treasurySplitPercent = 80_00;

        return (roles, config, flags, deployedContracts);
    }
}
