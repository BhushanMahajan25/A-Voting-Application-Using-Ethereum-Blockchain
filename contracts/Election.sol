pragma solidity ^0.4.2;

contract Election {
	//model a candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}
	//Store Candidates
	//Fetch Candidates
	mapping(uint => Candidate) public candidates;
	//store candidates count
	uint public candidatesCount; //counter cache

	function Election() public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}
	//_name -> local var not a state var. private -> only contract does the mapping of no of candidates.
	function addCandidate (string _name) private{
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
}