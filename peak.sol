// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

// OpenZeppelin Contracts (last updated v5.4.0) (token/ERC20/IERC20.sol)

pragma solidity >=0.4.16;

/**
 * @dev Interface of the ERC-20 standard as defined in the ERC.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
 */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// File: @openzeppelin/contracts/interfaces/IERC20.sol

// OpenZeppelin Contracts (last updated v5.4.0) (interfaces/IERC20.sol)

pragma solidity >=0.4.16;

// File: @openzeppelin/contracts/utils/introspection/IERC165.sol

// OpenZeppelin Contracts (last updated v5.4.0) (utils/introspection/IERC165.sol)

pragma solidity >=0.4.16;

/**
 * @dev Interface of the ERC-165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[ERC].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[ERC section]
     * to learn more about how these ids are created.
     *
 * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: @openzeppelin/contracts/interfaces/IERC165.sol

// OpenZeppelin Contracts (last updated v5.4.0) (interfaces/IERC165.sol)

pragma solidity >=0.4.16;

// File: @openzeppelin/contracts/interfaces/IERC1363.sol

// OpenZeppelin Contracts (last updated v5.4.0) (interfaces/IERC1363.sol)

pragma solidity >=0.6.2;

/**
 * @title IERC1363
 * @dev Interface of the ERC-1363 standard as defined in the https://eips.ethereum.org/EIPS/eip-1363[ERC-1363].
 *
 * Defines an extension interface for ERC-20 tokens that supports executing code on a recipient contract
 * after `transfer` or `transferFrom`, or code on a spender contract after `approve`, in a single transaction.
 */
interface IERC1363 is IERC20, IERC165 {
    /*
     * Note: the ERC-165 identifier for this interface is 0xb0202a11.
     * 0xb0202a11 ===
     *   bytes4(keccak256('transferAndCall(address,uint256)')) ^
     *   bytes4(keccak256('transferAndCall(address,uint256,bytes)')) ^
     *   bytes4(keccak256('transferFromAndCall(address,address,uint256)')) ^
     *   bytes4(keccak256('transferFromAndCall(address,address,uint256,bytes)')) ^
     *   bytes4(keccak256('approveAndCall(address,uint256)')) ^
     *   bytes4(keccak256('approveAndCall(address,uint256,bytes)'))
     */

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`
     * and then calls {IERC1363Receiver-onTransferReceived} on `to`.
     * @param to The address which you want to transfer to.
     * @param value The amount of tokens to be transferred.
     * @return A boolean value indicating whether the operation succeeded unless throwing.
     */
    function transferAndCall(address to, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`
     * and then calls {IERC1363Receiver-onTransferReceived} on `to`.
     * @param to The address which you want to transfer to.
     * @param value The amount of tokens to be transferred.
     * @param data Additional data with no specified format, sent in call to `to`.
     * @return A boolean value indicating whether the operation succeeded unless throwing.
     */
    function transferAndCall(address to, uint256 value, bytes calldata data) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the allowance mechanism
     * and then calls {IERC1363Receiver-onTransferReceived} on `to`.
     * @param from The address which you want to send tokens from.
     * @param to The address which you want to transfer to.
     * @param value The amount of tokens to be transferred.
     * @return A boolean value indicating whether the operation succeeded unless throwing.
     */
    function transferFromAndCall(address from, address to, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the allowance mechanism
     * and then calls {IERC1363Receiver-onTransferReceived} on `to`.
     * @param from The address which you want to send tokens from.
     * @param to The address which you want to transfer to.
     * @param value The amount of tokens to be transferred.
     * @param data Additional data with no specified format, sent in call to `to`.
     * @return A boolean value indicating whether the operation succeeded unless throwing.
     */
    function transferFromAndCall(address from, address to, uint256 value, bytes calldata data) external returns (bool);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens and then calls {IERC1363Spender-onApprovalReceived} on `spender`.
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     * @return A boolean value indicating whether the operation succeeded unless throwing.
     */
    function approveAndCall(address spender, uint256 value) external returns (bool);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens and then calls {IERC1363Spender-onApprovalReceived} on `spender`.
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     * @param data Additional data with no specified format, sent in call to `spender`.
     * @return A boolean value indicating whether the operation succeeded unless throwing.
     */
    function approveAndCall(address spender, uint256 value, bytes calldata data) external returns (bool);
}

// File: @openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol

// OpenZeppelin Contracts (last updated v5.3.0) (token/ERC20/utils/SafeERC20.sol)

pragma solidity ^0.8.20;

/**
 * @title SafeERC20
 * @dev Wrappers around ERC-20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    /**
     * @dev An operation with an ERC-20 token failed.
     */
    error SafeERC20FailedOperation(address token);

    /**
     * @dev Indicates a failed `decreaseAllowance` request.
     */
    error SafeERC20FailedDecreaseAllowance(address spender, uint256 currentAllowance, uint256 requestedDecrease);

    /**
     * @dev Transfer `value` amount of `token` from the calling contract to `to`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     */
    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeCall(token.transfer, (to, value)));
    }

    /**
     * @dev Transfer `value` amount of `token` from `from` to `to`, spending the approval given by `from` to the
     * calling contract. If `token` returns no value, non-reverting calls are assumed to be successful.
     */
    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeCall(token.transferFrom, (from, to, value)));
    }

    /**
     * @dev Variant of {safeTransfer} that returns a bool instead of reverting if the operation is not successful.
     */
    function trySafeTransfer(IERC20 token, address to, uint256 value) internal returns (bool) {
        return _callOptionalReturnBool(token, abi.encodeCall(token.transfer, (to, value)));
    }

    /**
     * @dev Variant of {safeTransferFrom} that returns a bool instead of reverting if the operation is not successful.
     */
    function trySafeTransferFrom(IERC20 token, address from, address to, uint256 value) internal returns (bool) {
        return _callOptionalReturnBool(token, abi.encodeCall(token.transferFrom, (from, to, value)));
    }

    /**
     * @dev Increase the calling contract's allowance toward `spender` by `value`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     *
     * IMPORTANT: If the token implements ERC-7674 (ERC-20 with temporary allowance), and if the "client"
     * smart contract uses ERC-7674 to set temporary allowances, then the "client" smart contract should avoid using
     * this function. Performing a {safeIncreaseAllowance} or {safeDecreaseAllowance} operation on a token contract
     * that has a non-zero temporary allowance (for that particular owner-spender) will result in unexpected behavior.
     */
    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 oldAllowance = token.allowance(address(this), spender);
        forceApprove(token, spender, oldAllowance + value);
    }

    /**
     * @dev Decrease the calling contract's allowance toward `spender` by `requestedDecrease`. If `token` returns no
     * value, non-reverting calls are assumed to be successful.
     *
     * IMPORTANT: If the token implements ERC-7674 (ERC-20 with temporary allowance), and if the "client"
     * smart contract uses ERC-7674 to set temporary allowances, then the "client" smart contract should avoid using
     * this function. Performing a {safeIncreaseAllowance} or {safeDeceptAllowance} operation on a token contract
     * that has a non-zero temporary allowance (for that particular owner-spender) will result in unexpected behavior.
     */
    function safeDecreaseAllowance(IERC20 token, address spender, uint256 requestedDecrease) internal {
        unchecked {
            uint256 currentAllowance = token.allowance(address(this), spender);
            if (currentAllowance < requestedDecrease) {
                revert SafeERC20FailedDecreaseAllowance(spender, currentAllowance, requestedDecrease);
            }
            forceApprove(token, spender, currentAllowance - requestedDecrease);
        }
    }

    /**
     * @dev Set the calling contract's allowance toward `spender` to `value`. If `token` returns no value,
     * non-reverting calls are assumed to be successful. Meant to be used with tokens that require the approval
     * to be set to zero before setting it to a non-zero value, such as USDT.
     *
     * NOTE: If the token implements ERC-7674, this function will not modify any temporary allowance. This function
     * only sets the "standard" allowance. Any temporary allowance will remain active, in addition to the value being
     * set here.
     */
    function forceApprove(IERC20 token, address spender, uint256 value) internal {
        bytes memory approvalCall = abi.encodeCall(token.approve, (spender, value));

        if (!_callOptionalReturnBool(token, approvalCall)) {
            _callOptionalReturn(token, abi.encodeCall(token.approve, (spender, 0)));
            _callOptionalReturn(token, approvalCall);
        }
    }

    /**
     * @dev Performs an {ERC1363} transferAndCall, with a fallback to the simple {ERC20} transfer if the target has no
     * code. This can be used to implement an {ERC721}-like safe transfer that rely on {ERC1363} checks when
     * targeting contracts.
     *
     * Reverts if the returned value is other than `true`.
     */
    function transferAndCallRelaxed(IERC1363 token, address to, uint256 value, bytes memory data) internal {
        if (to.code.length == 0) {
            safeTransfer(token, to, value);
        } else if (!token.transferAndCall(to, value, data)) {
            revert SafeERC20FailedOperation(address(token));
        }
    }

    /**
     * @dev Performs an {ERC1363} transferFromAndCall, with a fallback to the simple {ERC20} transferFrom if the target
     * has no code. This can be used to implement an {ERC721}-like safe transfer that rely on {ERC1363} checks when
     * targeting contracts.
     *
     * Reverts if the returned value is other than `true`.
 */
    function transferFromAndCallRelaxed(
        IERC1363 token,
        address from,
        address to,
        uint256 value,
        bytes memory data
    ) internal {
        if (to.code.length == 0) {
            safeTransferFrom(token, from, to, value);
        } else if (!token.transferFromAndCall(from, to, value, data)) {
            revert SafeERC20FailedOperation(address(token));
        }
    }

    /**
     * @dev Performs an {ERC1363} approveAndCall, with a fallback to the simple {ERC20} approve if the target has no
     * code. This can be used to implement an {ERC721}-like safe transfer that rely on {ERC1363} checks when
     * targeting contracts.
     *
     * NOTE: When the recipient address (`to`) has no code (i.e. is an EOA), this function behaves as {forceApprove}.
     * Opposedly, when the recipient address (`to`) has code, this function only attempts to call {ERC1363-approveAndCall}
     * once without retrying, and relies on the returned value to be true.
     *
     * Reverts if the returned value is other than `true`.
     */
    function approveAndCallRelaxed(IERC1363 token, address to, uint256 value, bytes memory data) internal {
        if (to.code.length == 0) {
            forceApprove(token, to, value);
        } else if (!token.approveAndCall(to, value, data)) {
            revert SafeERC20FailedOperation(address(token));
        }
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     *
     * This is a variant of {_callOptionalReturnBool} that reverts if call fails to meet the requirements.
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        uint256 returnSize;
        uint256 returnValue;
        assembly ("memory-safe") {
            let success := call(gas(), token, 0, add(data, 0x20), mload(data), 0, 0x20)
            // bubble errors
            if iszero(success) {
                let ptr := mload(0x40)
                returndatacopy(ptr, 0, returndatasize())
                revert(ptr, returndatasize())
            }
            returnSize := returndatasize()
            returnValue := mload(0)
        }

        if (returnSize == 0 ? address(token).code.length == 0 : returnValue != 1) {
            revert SafeERC20FailedOperation(address(token));
        }
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     *
     * This is a variant of {_callOptionalReturn} that silently catches all reverts and returns a bool instead.
     */
    function _callOptionalReturnBool(IERC20 token, bytes memory data) private returns (bool) {
        bool success;
        uint256 returnSize;
        uint256 returnValue;
        assembly ("memory-safe") {
            success := call(gas(), token, 0, add(data, 0x20), mload(data), 0, 0x20)
            returnSize := returndatasize()
            returnValue := mload(0)
        }
        return success && (returnSize == 0 ? address(token).code.length > 0 : returnValue == 1);
    }
}

// File: @openzeppelin/contracts/utils/Context.sol

// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)

pragma solidity ^0.8.20;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}

// File: contracts/FixedOwnable.sol

pragma solidity ^0.8.20;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This is a fixed version of Ownable that removes the transferOwnership functionality.
 */
abstract contract FixedOwnable is Context {
    address private immutable _owner;

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account);

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _owner = initialOwner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    }

    // Note: transferOwnership functionality has been intentionally removed
}

// File: @openzeppelin/contracts/security/ReentrancyGuard.sol

// OpenZeppelin Contracts (last updated v4.9.0) (security/ReentrancyGuard.sol)

pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    //pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be _NOT_ENTERED
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
     * `nonReentrant` function in the call stack.
     */
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == _ENTERED;
    }
}

// File: before2.sol

pragma solidity ^0.8.25;

/**
 * PEAK CAPITAL with Duration-Based Rewards
 * @notice Staking contract with tiered daily rewards based on staking duration
 * - 1-20 days: 0.75% daily
 * - 21-30 days: 1.5% daily
 * - 31-50 days: 2% daily
 * - 51-90 days: 3% daily
 * - 91+ days: 4% daily
 * - 10% on Direct Referral
 * - 10% stake tax
 * - Unstake tax based on duration: 8% (1-20d), 6% (21-30d), 5% (31-50d), 3% (51-90d), 2% (91+d)
 * - Real-time dividend calculation (per-second accrual)
 */
 
contract PeakUSDTStaking is FixedOwnable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    IERC20 public immutable usdtToken;
    
    uint8 public constant USDT_DECIMALS = 18;
    uint8 public constant INTERNAL_DECIMALS = 6;
    uint256 public constant DECIMAL_CONVERSION_FACTOR = 10 ** (USDT_DECIMALS - INTERNAL_DECIMALS);
    
    uint256 public constant MIN_INVESTMENT = 10 * (10 ** INTERNAL_DECIMALS);
    uint256 public constant SECONDS_PER_DAY = 86400;
    
    uint256 public totalStaked;
    uint256 public totalWithdrawals;
    uint256 public totalUsers;
    uint256 public totalRewardsDistributed;
    address public dev2Wallet;
    uint256 public constant STAKE_TAX_RATE = 1000;
    uint256 public constant BASIS_POINTS = 10000;

    uint256 public constant REFERRAL_RATE = 1000; // 10%

    uint256 public constant MAX_SPONSORED_ACCOUNTS = 20;
    uint256 public constant SPONSORED_ACCOUNT_LIMIT = 200 * (10 ** INTERNAL_DECIMALS);
    uint256 public sponsoredAccountsCount;

    mapping(address => uint256) private _sponsoredDeposits;
    mapping(address => bool) public sponsoredWithdrawalApproved;
    mapping(address => uint256) public accumulatedReferralEarnings;

    struct Stake {
        uint256 amount;
        uint256 startTime;
        uint256 lastDividendClaim;
        uint256 claimedDividends;
        uint256 referralEarnings;
        address referrer;
        bool isSponsored;
    }


    mapping(address => Stake) public stakes;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isSponsored;
    mapping(address => address[]) public referrals;
    

    event Staked(address indexed user, uint256 amount, address referrer, uint256 taxAmount, bool isSponsored);
    event Unstaked(address indexed user, uint256 amount, uint256 dividends, uint256 taxAmount, bool isSponsored);
    event DividendClaimed(address indexed user, uint256 amount);
    event ReferralEarning(address indexed referrer, address indexed user, uint256 amount); // Simplified event
    event SponsorAccountAdded(address indexed account, uint256 amount);
    event Dev2WalletUpdated(address indexed oldWallet, address indexed newWallet);
    event SponsoredWithdrawalApproved(address indexed account, bool approved);
    event ReferralEarningsWithdrawn(address indexed referrer, uint256 amount);

    constructor(address _usdtToken, address initialOwner, address _dev2Wallet) FixedOwnable(initialOwner) {
        require(_usdtToken != address(0), "Zero token address");
        require(initialOwner != address(0), "Zero owner address");
        require(_dev2Wallet != address(0), "Zero dev2 wallet address");
        
        usdtToken = IERC20(_usdtToken);
        dev2Wallet = _dev2Wallet;
    }

    function setDev2Wallet(address _dev2Wallet) external onlyOwner {
        require(_dev2Wallet != address(0), "Zero dev2 wallet address");
        emit Dev2WalletUpdated(dev2Wallet, _dev2Wallet);
        dev2Wallet = _dev2Wallet;
    }

    function stake(uint256 _amount, address _referrer) external nonReentrant {
        require(_amount >= MIN_INVESTMENT * DECIMAL_CONVERSION_FACTOR, "Amount below minimum");
        
        Stake storage s = stakes[msg.sender];
        uint256 currentSponsored = _sponsoredDeposits[msg.sender];
        uint256 currentReal = s.amount > currentSponsored ? s.amount - currentSponsored : 0;
        uint256 newTotalReal = currentReal + (_amount / DECIMAL_CONVERSION_FACTOR);
        
        if (s.isSponsored) {
            require(newTotalReal <= SPONSORED_ACCOUNT_LIMIT, "Sponsored cap exceeded");
        }

        uint256 taxAmount = (_amount * STAKE_TAX_RATE) / BASIS_POINTS;
        uint256 netAmount = _amount - taxAmount;
        
        uint256 halfTax = taxAmount / 2;
        usdtToken.safeTransferFrom(msg.sender, owner(), halfTax);
        usdtToken.safeTransferFrom(msg.sender, dev2Wallet, taxAmount - halfTax);

        if (s.amount > 0) {
            _claimDividends(msg.sender);
        } else {
            if (!hasStaked[msg.sender]) {
                totalUsers++;
                hasStaked[msg.sender] = true;
            }

            s.startTime = block.timestamp;
            s.lastDividendClaim = block.timestamp;

            if (_referrer != address(0) && _referrer != msg.sender && 
                (hasStaked[_referrer] || stakes[_referrer].amount > 0)) {
                s.referrer = _referrer;
                referrals[_referrer].push(msg.sender);
            }
        }

        usdtToken.safeTransferFrom(msg.sender, address(this), netAmount);

        uint256 netAmountInternal = netAmount / DECIMAL_CONVERSION_FACTOR;
        s.amount += netAmountInternal;
        totalStaked += netAmountInternal;

        if (s.referrer != address(0)) {
            _distributeReferralBonus(s.referrer, netAmountInternal);
        }

        emit Staked(msg.sender, netAmountInternal, s.referrer, taxAmount / DECIMAL_CONVERSION_FACTOR, s.isSponsored);
    }

    function unstake() external nonReentrant {
        Stake memory s = stakes[msg.sender];
        require(s.amount > 0, "No active stake");

        uint256 dividends = calculateDividends(msg.sender);
        uint256 totalAmountInternal = s.amount + dividends;
        
        uint256 userRealAmount;
        if (s.isSponsored) {
            uint256 sponsoredAmount = _sponsoredDeposits[msg.sender];
            userRealAmount = s.amount > sponsoredAmount ? s.amount - sponsoredAmount : 0;
        } else {
            userRealAmount = s.amount;
        }
        
        uint256 stakingDays = (block.timestamp - s.startTime) / SECONDS_PER_DAY;
        uint256 unstakeTaxRate = getUnstakeTaxRate(stakingDays);
        uint256 unstakeTax = (userRealAmount * unstakeTaxRate) / BASIS_POINTS;
        
        if (s.isSponsored) {
            uint256 sponsoredAmount = _sponsoredDeposits[msg.sender];
            require(sponsoredAmount == 0 || sponsoredWithdrawalApproved[msg.sender], "Sponsored withdrawal not approved");
        }
        
        uint256 netAmountInternal = totalAmountInternal - unstakeTax;
        uint256 netAmount = netAmountInternal * DECIMAL_CONVERSION_FACTOR;

        uint256 halfTax = unstakeTax / 2;
        usdtToken.safeTransfer(owner(), halfTax * DECIMAL_CONVERSION_FACTOR);
        usdtToken.safeTransfer(dev2Wallet, (unstakeTax - halfTax) * DECIMAL_CONVERSION_FACTOR);

        if (s.isSponsored) {
            delete _sponsoredDeposits[msg.sender];  
            delete isSponsored[msg.sender];
            delete sponsoredWithdrawalApproved[msg.sender];
            sponsoredAccountsCount--;
        }

        delete stakes[msg.sender];
        totalStaked -= s.amount;
        totalWithdrawals += netAmountInternal;
        totalRewardsDistributed += dividends;
        usdtToken.safeTransfer(msg.sender, netAmount);

        emit Unstaked(msg.sender, s.amount, dividends, unstakeTax, s.isSponsored);
    }

    function claimDividends() external nonReentrant {
        require(stakes[msg.sender].amount > 0, "No active stake");
        uint256 dividends = _claimDividends(msg.sender);
        totalRewardsDistributed += dividends;
        
        
        emit DividendClaimed(msg.sender, dividends);
    }

    function getUnstakeTaxRate(uint256 _stakingDays) public pure returns (uint256) {
        if (_stakingDays >= 91) return 200;
        if (_stakingDays >= 51) return 300;
        if (_stakingDays >= 31) return 500;
        if (_stakingDays >= 21) return 600;
        return 800;
    }
  
    function calculateDividends(address _user) public view returns (uint256) {
        Stake memory s = stakes[_user];
        if (s.amount == 0) return 0;
        
        uint256 stakingDays = (block.timestamp - s.startTime) / SECONDS_PER_DAY;
        uint256 dailyRate = getDailyRate(stakingDays);
        
        uint256 secondsSinceLastClaim = block.timestamp - s.lastDividendClaim;
        uint256 dividendPerSecond = (s.amount * dailyRate) / (BASIS_POINTS * SECONDS_PER_DAY);
        
        return dividendPerSecond * secondsSinceLastClaim;
    }

    function getDailyRate(uint256 _stakingDays) public pure returns (uint256) {
        if (_stakingDays >= 91) return 400;
        if (_stakingDays >= 51) return 300;
        if (_stakingDays >= 31) return 200;
        if (_stakingDays >= 21) return 150;
        return 75;
    }

    function _claimDividends(address _user) internal returns (uint256) {
        uint256 dividends = calculateDividends(_user);

        if (dividends > 0) {
            stakes[_user].claimedDividends += dividends;
            stakes[_user].lastDividendClaim = block.timestamp;

            usdtToken.safeTransfer(_user, dividends * DECIMAL_CONVERSION_FACTOR);
            totalWithdrawals += dividends;
        }

        return dividends;
    }

    function _distributeReferralBonus(address _referrer, uint256 _amount) internal {
        if (_referrer == address(0)) return;

        uint256 commission = (_amount * REFERRAL_RATE) / BASIS_POINTS;
        
        accumulatedReferralEarnings[_referrer] += commission;
        stakes[_referrer].referralEarnings += commission;

        emit ReferralEarning(_referrer, msg.sender, commission);
    }

    function withdrawReferralEarnings() external nonReentrant {
        uint256 earnings = accumulatedReferralEarnings[msg.sender];
        require(earnings > 0, "No referral earnings to withdraw");
        
        accumulatedReferralEarnings[msg.sender] = 0;
        usdtToken.safeTransfer(msg.sender, earnings * DECIMAL_CONVERSION_FACTOR);
        totalWithdrawals += earnings;
        
        emit ReferralEarningsWithdrawn(msg.sender, earnings);
    }

    function getAvailableReferralEarnings(address _referrer) public view returns (uint256) {
        return accumulatedReferralEarnings[_referrer];
    }

    function getUserReferralEarnings(address _user) public view returns (uint256 totalReferralEarnings) {
        totalReferralEarnings = stakes[_user].referralEarnings;
    }

    function addSponsorAccount(address _account, uint256 _sponsoredAmount) external onlyOwner {
        require(sponsoredAccountsCount < MAX_SPONSORED_ACCOUNTS, "Max sponsored accounts reached");
        require(!hasStaked[_account], "Account already has real stake");
        require(_sponsoredAmount > 0, "Amount must be greater than zero");
        require(_sponsoredAmount <= SPONSORED_ACCOUNT_LIMIT, "Amount exceeds sponsor limit");

        require(!isSponsored[_account], "Account is already sponsored");

        isSponsored[_account] = true;
        sponsoredAccountsCount++;
        _sponsoredDeposits[_account] = _sponsoredAmount;

        Stake storage s = stakes[_account];
        
        if (s.amount == 0) {
            s.amount = _sponsoredAmount;
            s.startTime = block.timestamp;
            s.lastDividendClaim = block.timestamp;
            s.isSponsored = true;

            if (!hasStaked[_account]) {
                totalUsers++;
                hasStaked[_account] = true;
            }
        } else {
            s.amount += _sponsoredAmount;
            s.isSponsored = true;
        }

        totalStaked += _sponsoredAmount;

        emit SponsorAccountAdded(_account, _sponsoredAmount);
        emit Staked(_account, _sponsoredAmount, address(0), 0, true);
    }

    function setSponsoredWithdrawalApproval(address _account, bool _approved) external onlyOwner {
        require(isSponsored[_account], "Account is not sponsored");
        sponsoredWithdrawalApproved[_account] = _approved;
        emit SponsoredWithdrawalApproved(_account, _approved);
    }

    function getUserRealAmount(address _user) external view returns (uint256) {
        Stake memory s = stakes[_user];
        uint256 sponsoredAmount = _sponsoredDeposits[_user];
        return s.amount > sponsoredAmount ? s.amount - sponsoredAmount : 0;
    }

    function getEstimatedRewards(address _user) public view returns (uint256) {
        return calculateDividends(_user);
    }

    function getTimeUntilNextReward(address _user) public view returns (uint256) {
        Stake memory s = stakes[_user];
        if (s.amount == 0) return 0;
        
        uint256 lastClaimTime = s.lastDividendClaim;
        uint256 nextRewardTime = lastClaimTime + 1 days;
        
        return block.timestamp >= nextRewardTime ? 0 : nextRewardTime - block.timestamp;
    }

    function canClaimRewards(address _user) public view returns (bool) {
        return calculateDividends(_user) > 0;
    }

    function getCurrentAPR(address _user) public view returns (uint256) {
        Stake memory s = stakes[_user];
        if (s.amount == 0) return 0;
        
        uint256 stakingDays = (block.timestamp - s.startTime) / SECONDS_PER_DAY;
        uint256 dailyRate = getDailyRate(stakingDays);
        
        return dailyRate * 365;
    }

    function getTotalEarnings(address _user) public view returns (uint256) {
        Stake memory s = stakes[_user];
        return s.claimedDividends + s.referralEarnings + calculateDividends(_user);
    }

    function getUserStakeInfoBasic(address _user) public view returns (
        uint256 amount,
        uint256 startTime,
        uint256 stakingDays,
        uint256 currentDividends,
        uint256 claimedDividends,
        uint256 referralEarnings,
        uint256 accumulatedReferral,
        address referrer,
        uint256 referralCount
    ) {
        Stake memory userStake = stakes[_user];
        
        amount = userStake.amount;
        startTime = userStake.startTime;
        stakingDays = (block.timestamp - userStake.startTime) / SECONDS_PER_DAY;
        currentDividends = calculateDividends(_user);
        claimedDividends = userStake.claimedDividends;
        referralEarnings = userStake.referralEarnings;
        accumulatedReferral = accumulatedReferralEarnings[_user];
        referrer = userStake.referrer;
        referralCount = referrals[_user].length;
    }

    function getContractStats() public view returns (
        uint256 _totalStaked,
        uint256 _totalWithdrawals,
        uint256 _totalUsers,
        uint256 _contractBalance,
        uint256 _sponsoredAccountsCount,
        uint256 _totalRewardsDistributed
    ) {
        _totalStaked = totalStaked;
        _totalWithdrawals = totalWithdrawals;
        _totalUsers = totalUsers;
        _contractBalance = usdtToken.balanceOf(address(this));
        _sponsoredAccountsCount = sponsoredAccountsCount;
        _totalRewardsDistributed = totalRewardsDistributed;
    }
}