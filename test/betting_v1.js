var MultiNumberBettingV1 = artifacts.require("./BettingV1.sol");

contract('BettingV1', function(accounts) {
  it("should assert true", function() {
    var betting_v1;
    return MultiNumberBettingV1.deployed().then(function(instance){
      betting_v1 = instance;
      //Get the total guesses
      return betting_v1.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      //Make a guess
      betting_v1.guess(1);
      return betting_v1.totalGuesses.call()
    }).then(function(result){
      console.log("Total Guesses=", result.toNumber());
      assert.isTrue(result.toNumber() == 1);
    })
  });
});
