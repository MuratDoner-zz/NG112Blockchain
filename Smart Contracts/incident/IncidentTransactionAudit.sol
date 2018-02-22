pragma solidity ^0.4.2;

// Modified Greeter contract. Based on example at https://www.ethereum.org/greeter.

contract mortal {
    /* Define variable owner of the type address*/
    address owner;

    /* this function is executed at initialization and sets the owner of the contract */
    function mortal() public { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() public { if (msg.sender == owner) selfdestruct(owner); }
}

contract IncidentTransactionAudit is mortal {
    /* define variable lastIncidentUpdateJson of the type string */
    string lastIncidentUpdateJson;

    /* this runs when the contract is executed */
    function IncidentTransactionAudit(string _lastIncidentUpdateJson) public {
        lastIncidentUpdateJson = _lastIncidentUpdateJson;
    }

    function setLastIncidentUpdateJson(string _lastIncidentUpdateJson) public {
        Modified(lastIncidentUpdateJson, _lastIncidentUpdateJson, lastIncidentUpdateJson, _lastIncidentUpdateJson);
        lastIncidentUpdateJson = _lastIncidentUpdateJson;
    }

    /* main function */
    function getLastIncidentUpdateJson() public constant returns (string) {
        return lastIncidentUpdateJson;
    }

    /* we include indexed events to demonstrate the difference that can be
    captured versus non-indexed */
    event Modified(
        string indexed oldDataIdx, string indexed newDataIdx,
        string oldData, string newData);
}
