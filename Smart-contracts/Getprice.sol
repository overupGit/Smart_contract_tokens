// SPDX-License-Identifier: MIT

pragma solidity ^0.6.7;

import "./AggregatorV3Interface.sol";
// import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";



contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;
    constructor() public {
        priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    }

    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        // If the round is not complete yet, timestamp is 0
        require(timeStamp > 0, "Round not complete");
        return (price / (10 ** 5)) ;
    }
}