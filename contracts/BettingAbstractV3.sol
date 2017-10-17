/**
 * Exercise: V7
 * Section: 7
 * Part of an online course - for more info checkout link below
 * http://acloudfan.com/learn-blockchain
 */

contract BettingAbstractV3 {

  // Ex - 1
  event WinningBet(address winnerAddress, string name, uint amount);
  event LosingBet(address loserAddress, string name, uint amount);

  uint public constant MAX_BET = 0.0005 ether;
  uint public constant MIN_BET = 0.000001 ether;
  
  address owner;

  modifier ownerOnly {
    if(owner == msg.sender) {
      _ ;
    }else {
      revert();
    }
  }

  function ownerWithdraw(uint amt) returns (uint);
  function guess(uint8 num, string name) payable returns (bool);

  function totalGuesses() returns (uint);
  function daysSinceLastWinning() returns(uint);
  function hoursSinceLastWinning() returns(uint);
  function minutesSinceLastWinning() returns(uint);
  function getLastWinnerInfo() returns(address winnerAddress, string name, uint guess, uint guessedAt, uint ethersReceived);
  function checkWinning(address addr) returns (bool); 

}