pragma solidity >=0.4.0 <0.5.0;
pragma experimental ABIEncoderV2;


contract IM {
    // 合約擁有者
    address private owner;
    
    struct imageInfo {
        bool exists;
        string imgContent;
        string textContent;
    }
        
    mapping (address => imageInfo[]) private imageList;

    event TransferOwnerEvent(address indexed oldOwner, address indexed newOwner, uint256 timestamp);

    modifier isOwner() {
        require(owner == msg.sender, "you are not owner");
        _;
    }

    // 建構子
    constructor() public payable {
        owner = msg.sender;
    }

    // -------------------------- Ether --------------------------

    // get owner
    function getOwner() public view returns (address)  {
        return owner;
    }

    // 轉移 owner
    function transferOwner(address newOwner) public isOwner {
        // transfer ownership
        address oldOwner = owner;
        owner = newOwner;

        // emit TransferOwnerEvent
        emit TransferOwnerEvent(oldOwner, newOwner, now);
    }

    function kill() public isOwner {
        selfdestruct(owner);
    }
    
    
    function getImageByIndex(address towner, uint index) public view returns (bool, string memory, string memory){
        require(imageList[towner][index].exists);
         
        return (imageList[towner][index].exists, imageList[towner][index].imgContent, imageList[towner][index].textContent);
    }
    
    function getImageList(address towner) public view returns (imageInfo[] memory) {
        return imageList[towner];
    }
    
    function uploadImage(address towner, string memory imgContent, string memory textContent) public {
        imageList[towner].push(imageInfo(true, imgContent, textContent)) ;
    }
    
    function num_of_images(address towner) public view returns (uint) {
        return imageList[towner].length;
    }
    
}