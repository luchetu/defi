pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenFarm is Ownable {
    address[] public allowedTokens;
    mapping(address=>mapping(address=>uint256)) stakingBalance;

    function stakeToken(uint256 _amount, address _token) public {
        require(_amount > 0, "Amount must be greater than 0");
         require(tokenIsAllowed(_token), "Token is not required");
         IERC20(token).transferFrom(msg.sender, address(this), _amount);
    }

    function addAllowedToken(address _token) public onlyOwner {
        allowedTokens.push(_token);
    }

    function tokenIsAllowed(address _token) returns (boo) {
        for (
            uint256 allowedTokenIndex = 0;
            allowedTokenIndex < allowedTokens.length;
            allowedTokenIndex++
        ) {
            if (allowedTokens[allowedTokenIndex] == _token) {
                return true;
            }
        }
        return false;
    }
}
