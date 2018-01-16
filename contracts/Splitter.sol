pragma solidity ^0.4.6;

/*There are 3 people
	Three addresses
We can see the balance of the Splitter contract
	Get the balance of the contract
We can see balances of all 3 people
	Function to get the balance of each person
We can send Ether to the contract from the web page
	-Whenever Alice sends ether to contract, half to Bob half to Carol
	-Anyone can contribute to the contract normally. If it is alice 
	who is contributing, then half to bob and half to carol.
*/

contract Splitter { 
	address public owner;
	uint public splitterBalance;
	mapping(address => uint) public balances;
    
    function Splitter() public{ //no need for arguments
        owner = msg.sender;
    }
    
 
    function sendEth(address Bob, address Carol) public payable returns(bool success) {
        require(msg.value!=0);
        if(msg.sender == owner) {
            uint halfValue = msg.value/2;
            Bob.transfer(halfValue);
            Carol.transfer(halfValue);
            
            balances[Bob] += halfValue;
            balances[Carol] += halfValue;
            balances[owner] -= msg.value;
        }
        else {
            splitterBalance += msg.value;
        }
        
        
        return true;
    }

    //not sure how to iterate through a mapping to return balances
/*	function peopleBalance() public constant returns(uint[] bals) {
	    for(i=0; i <= balances.length; i++) {
	        
	    }
	    return balances;
	}*/
	
	function contractBalance() public constant returns(uint bal) {
		return splitterBalance;
	}

}