var MultiNumberBettingV4 = artifacts.require("./BettingV4.sol");

contract('BettingV2', function(accounts) {
  it("should assert true", function() {
    var betting_v2;
    return MultiNumberBettingV4.deployed().then(function(instance){
      betting_v4 = instance;

      // Send a losing guess
      betting_v4.guess(8,"John Miller");

      // Get the winner name
      return betting_v4.getLastWinner.call(); 
    }).then(function(result){
      console.log("Winner Name= "+result);
     
      // Send a winning guess
      betting_v4.guess(3,'drake');
      return betting_v4.totalGuesses.call();
    }).then(function(result){
      // Get the winner name
      return betting_v4.getLastWinner.call();
    }).then(function(result){
      console.log("Winner Name= " +result);
      assert.isTrue((result) == 'drake');
    });
  });
});
