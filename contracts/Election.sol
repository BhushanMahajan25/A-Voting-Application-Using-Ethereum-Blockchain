pragma solidity ^0.4.2;

contract Election {
	//model a candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}
	
	//store accounts that have voted
	mapping(address => bool) public voters;
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

	function vote(uint _candidateID) public {
		//require that they haven't voted before
		require(!voters[msg.sender]);

		//require a valid candidate
		require(_candidateID > 0 && _candidateID <= candidatesCount);

		//gas used to check above both the 'requires' will not get refunded to sender
		//hence contracts should be written bugfree as there may be wastage if not

		//record that voter has voted
		voters[msg.sender] = true; //if voter has voted set bool=true; default bool=> false

		//update candidate vote count
		candidates[_candidateID].voteCount++;
	}

}