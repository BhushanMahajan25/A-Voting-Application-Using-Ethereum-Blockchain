pragma solidity ^0.4.2;

contract Election {
	//store candidate
	//read candidate
	string public candidate; //state variable
	//constructor
	function Election() public{
		candidate = "Candidate 1";
	}
}