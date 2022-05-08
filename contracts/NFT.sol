// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721, Pausable, Ownable, ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    // Enums
    enum MintState { WAITING, MINTING }
    
    // Variables
    uint256 private mintPrice;
    uint256 private maxSupply;
    string private endpoint;

    MintState public mintState = MintState.WAITING;

    // Owner-only Functions
    constructor() ERC721("NFT Collection", "NFT") {}

    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function setMintState(MintState value) external onlyOwner {
        mintState = value;
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function setEndpoint(string calldata value) external onlyOwner {
        endpoint = value;
    }

    function setPrice(uint256 value) external onlyOwner {
        mintPrice = value;
    }

    function setMaxSupply(uint256 value) external onlyOwner {
        maxSupply = value;
    }

    function publicMint() public payable nonReentrant {
        require(msg.value == mintPrice, 'WRONG VALUE');
        require(mintState == MintState.MINTING, 'WRONG MINTSTATE');

        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId < maxSupply, 'MAX REACHED');
        _tokenIdCounter.increment();

        _safeMint(msg.sender, tokenId);
    }

    // Internal Functions
    function _baseURI() internal view virtual override returns (string memory) {
        return endpoint;
    }
}