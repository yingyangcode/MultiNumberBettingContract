pragma solidity ^0.4.4;


contract BettingV4 {
    // Ex-1 Part-1
    // Added public to generate the getters
    uint public loserCount;
    uint public winnerCount;

    uint public lastWinnerAt;

    //Ex - 2 Part - 1 Remove this variable
    // string lastWinnerName;

    // Ex - 2 Keep this
    address winner;

    uint8[3] numArray;

    // Ex-1 Part - 1  Declare a struct
    struct Winner {
      string name;
      address winnerAddress;
      uint8 guess;
      uint guessedAt;
    }
    // Ex-1 Part - 2 Add a mapping
    mapping(address=>Winner) winnersMapping;

    function BettingV4(uint8 num0, uint8 num1, uint8 num2) {
		//constructor
	    numArray[0] = num0;
	    numArray[1] = num1;
	    numArray[2] = num2;
    }

	function guess(uint8 num, string name) returns (bool) {
    // Ex-4 If num > 10 throw; replace throw with revert()
    if( num > 10 ) {
      revert();
    }
  
		for (uint8 i = 0; i < numArray.length; i++) {
			if (numArray[i] == num) {
				//Increase the winner count
				winnerCount++;

        // Ex - 1 Part - 3
        winnersMapping[msg.sender].winnerAddress= msg.sender;
        winnersMapping[msg.sender].name= name;
        winnersMapping[msg.sender].guess= num;
        winnersMapping[msg.sender].guessedAt= now;


        // Ex - 2 Part - 2 removed the lastWinnerName
        // So delete this line
        // lastWinnerName = name;

        lastWinnerAt = winnersMapping[msg.sender].guessedAt;
        winner = msg.sender;


     

				return true;
			}			
		}
		loserCount++;
		return false;
    }

    function totalGuesses() returns (uint) {
	    return (winnerCount + loserCount);
    }

  // Ex - 2 Part - 3 Comment delete this function
  /* 
    function getLastWinner() returns (string) {

      bytes memory nameBytes = bytes(lastWinnerName);
      //If no winner send "***"
      if (nameBytes.length == 0) {
          return "***";
      }
    
      string memory rtnString = new string(3);
      bytes memory toReturn = bytes(rtnString);

      // 2nd check to cover a winner name less than 3 bytes
      for (uint i = 0; i < 3; i++) {
          toReturn[i] = nameBytes[i];
      }

      return string(toReturn);
    }
  */
   
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
    function getLastWinnerInfo() returns(address winnerAddress, string name, uint guess, uint guessedAt) {
      winnerAddress = winnersMapping[winner].winnerAddress;
      name = winnersMapping[winner].name;
      guess = winnersMapping[winner].guess;
      guessedAt = winnersMapping[winner].guessedAt;
    }
    // Ex - 3 Part - 1
    function checkWinning(address addr) returns (bool) {
      return (winnersMapping[addr].guessedAt != 0);
    }

}
