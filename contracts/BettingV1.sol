pragma solidity ^0.4.4;


contract BettingV1 {
	
	uint loserCount;
	uint winnerCount;

	uint8[3] numArray;

	function BettingV1(uint8 num0, uint8 num1, uint8 num2) {
		//constructor
		numArray[0] = num0;
		numArray[1] = num1;
		numArray[2] = num2;
	}

	function guess(uint8 num) returns (bool) {
		for(uint8 i=0; i<numArray.length; i++) {
			if (numArray[i] == num) {
				//Increase the winner count
				winnerCount++;
				return true;
			}			
		}
		loserCount++;
		return false;
	}

	function totalGuesses() returns (uint) {
		return (winnerCount + loserCount);
	}

}
