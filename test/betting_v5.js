var MultiNumberBettingV5 = artifacts.require("./BettingV5.sol");

contract('BettingV5', function(accounts) {
  it("should assert true", function() {
    var betting_v5;
    return MultiNumberBettingV5.deployed().then(function(instance){
      betting_v5 = instance;

      // Send a losing guess
      betting_v5.guess(8,"John Miller");

      // Get the winner name
      return betting_v5.getLastWinner.call(); 
    }).then(function(result){
      console.log("Winner Name= "+result);
     
      // Send a winning guess
      betting_v5.guess(3,'drake');
      return betting_v5.totalGuesses.call();
    }).then(function(result){
      // Get the winner name
      return betting_v5.getLastWinner.call();
    }).then(function(result){
      console.log("Winner Name= " +result);
      assert.isTrue((result) == 'drake');
    });
  });
});
