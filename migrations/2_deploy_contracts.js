var BettingV1 = artifacts.require("./BettingV1.sol");
var BettingV1 = artifacts.require("./BettingV2.sol");
var BettingV3 = artifacts.require("./BettingV3.sol");
var BettingV4 = artifacts.require("./BettingV4.sol");


module.exports = function(deployer) {
  // Number passed to constructor 1,3,9
  //deployer.deploy(BettingV1,1,3,9);
  deployer.deploy(BettingV2,1,3,9);
};
