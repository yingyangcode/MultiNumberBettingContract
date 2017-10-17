pragma solidity ^0.4.4;

import "./BettingAbstractV1.sol";

contract BettingV5 is BettingAbstractV1 {

    uint public loserCount;
    uint public winnerCount;

    uint public lastWinnerAt;

    address winner;

    uint8[3] numArray;

    struct Winner {
      string name;
      address winnerAddress;
      uint8 guess;
      uint guessedAt;
      // Ex - 3 Part - 2
      uint ethersReceived;
    }

    mapping(address=>Winner) winnersMapping;

    function BettingV5(uint8 num0, uint8 num1, uint8 num2) {
		  //constructor
	    numArray[0] = num0;
	    numArray[1] = num1;
	    numArray[2] = num2;
    }

	function guess(uint8 num, string name) payable returns (bool) {

    if( num > 10 ) {
      revert();
    }
    
    // Ex - 3 Part - 3
    uint recvd = msg.value;

    // Ex - 4 Part - 1
    if (recvd < MIN_BET || recvd > MAX_BET) {revert();}

		for (uint8 i = 0; i < numArray.length; i++) {
			if (numArray[i] == num) {
				//Increase the winner count
				winnerCount++;

        winnersMapping[msg.sender].winnerAddress= msg.sender;
        winnersMapping[msg.sender].name= name;
        winnersMapping[msg.sender].guess= num;
        winnersMapping[msg.sender].guessedAt= now;
        
        lastWinnerAt = winnersMapping[msg.sender].guessedAt;
        winner = msg.sender;

        // Ex - 4 Part - 2
        // Send the ethers - make sure you address the issue raised in 
        // Ex - 4 Part - 2 a
        if( recvd * 2 > msg.value) {
          msg.sender.send(msg.value);
          revert();
        }else {
          winnersMapping[msg.sender].ethersReceived = recvd * 2;
          msg.sender.send(recvd * 2);
        }
     

				return true;
			}			
		}
		loserCount++;
		return false;
    }

    function totalGuesses() returns (uint) {
	    return (winnerCount + loserCount);
    }
   
    function daysSinceLastWinning() returns(uint) {
      return (now - lastWinnerAt*1 days);
    }
    function hoursSinceLastWinning() returns(uint) {
      return (now - lastWinnerAt*1 hours);

    }
    function minutesSinceLastWinning() returns(uint) {
      return (now - lastWinnerAt*1 minutes);      
    }
    // Ex - 2 Part - 3 
    function getLastWinnerInfo() returns(address winnerAddress, string name, uint guess, uint guessedAt, uint ethersReceived) {
      winnerAddress = winnersMapping[winner].winnerAddress;
      name = winnersMapping[winner].name;
      guess = winnersMapping[winner].guess;
      guessedAt = winnersMapping[winner].guessedAt;
      ethersReceived = winnersMapping[winner].ethersReceived;
    }

    function checkWinning(address addr) returns (bool) {
      return (winnersMapping[addr].guessedAt != 0);
    }

}
