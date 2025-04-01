// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract QualityContract {
    address public singleStakeholder;
    uint256 public qualityScore;

    // Modifier to allow only the stakeholder to run specific functions
    modifier onlyStakeholder() {
        require(msg.sender == singleStakeholder, "Only stakeholder can execute this function");
        _;
    }

    // Event to log quality score updates
    event QualityScoreUpdated(uint256 newScore);

    // Constructor sets the stakeholder at deployment time
    constructor(address _stakeholder) {
        require(_stakeholder != address(0), "Stakeholder address cannot be zero");
        singleStakeholder = _stakeholder;
        qualityScore = 0; // default score
    }

    // Function to update the quality score
    function updateQualityScore(uint256 newScore) external onlyStakeholder {
        qualityScore = newScore;
        emit QualityScoreUpdated(newScore);
    }
}

// address public singleStakeholder;	State Variable	Stores the stakeholder's Ethereum address.
// uint256 public qualityScore;	        State Variable	Stores the current quality score.
// modifier onlyStakeholder()	        Access Control	Restricts functions to only the stakeholder.
// constructor(address _stakeholder)	Initialization	Sets the stakeholder address when deploying.
// updateQualityScore(uint256)	        Function	    Allows the stakeholder to update the score.
// emit QualityScoreUpdated(newScore);	Event	        Useful for logging and off-chain apps (like UI).
