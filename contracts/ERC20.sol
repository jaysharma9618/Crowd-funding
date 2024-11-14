// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 <= 0.9.0;

interface ERC20Interface{
    function totalSupply() external view returns(uint);
    function balanceof(address tokenOwner) external view returns(uint balance);
    function transfer(address to , uint tokens) external  returns(bool success);

    function allowance(address tokenOwner, address spender) external view  returns(uint remaining);
    function approve(address spender, uint tokens) external view returns(bool success);
    function transferFrom(address form , address to , uint tokens) external view returns(bool success);

    event Transfer(address indexed from , address indexed to , uint tokens);
    event Approval (address indexed tokenOwner, address indexed spender, uint tokes);
}

abstract contract Block is ERC20Interface{

    string public name= "block ";
    string public symbol = "BLK";
    uint public decimal=0;
    uint public override totalSupply;
    address public founder;
    mapping (address => uint) public balances;
    mapping (address => mapping (address => bool)) allowed;

    constructor(){
        totalSupply = 1000;
        founder= msg.sender;
        balances[founder]= totalSupply;

    }

    function balanceof(address tokenOwner) external view returns(uint ){
        return balances[tokenOwner];
    }

    function transfer(address to , uint tokens) external override returns(bool success){
        require(balances[msg.sender]>= tokens, "you have insufficent balance");
        balances[to]+=tokens;
        balances[msg.sender]-=tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}

