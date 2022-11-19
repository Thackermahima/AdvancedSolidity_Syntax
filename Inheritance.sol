// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract A {
function foo() public virtual pure returns(string memory){
    return "Contract A";
}
}

contract B is A{
function foo() public pure virtual override  returns(string memory){
 return "Contract B";
}
}
contract C is A{
    /*
    Both virtual and override means, A.foo() is override but also make c.foo()
    override later 
    */
    function foo() public pure virtual override  returns(string memory){
 return "Contract C";
}

}

contract D is B, C {
     function foo() public pure virtual override(B,C)  returns(string memory){
         //Order matters in inheritence left to right so in this case c will be executes first 
         //Super keyword is a special keyword that lets you call your parent functions.
       return super.foo();
     }

}
