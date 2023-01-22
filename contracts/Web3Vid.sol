// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Web3Vid {
    //Initialising the video count to 0 by default
    uint256 public videoCount = 0;
    //name of the contract
    string public name = "Web3Vid";
    //mapping the videoCount to the videos
    mapping(uint256 => Video) public videos;

    //creating a struct with the following parameters
    struct Video{
        uint256 id;
        string hash;
        string title;
        string description;
        string location;
        string category;
        string thumbnailHash;
        string date;
        address author;
    }

    event VideoUploaded (
        uint256 id,
        string hash,
        string title,
        string description,
        string location,
        string category,
        string thumbnailHash,
        string date,
        address author
    );

    constructor(){}

    //Fucntion to upload a video
    function uploadVideo(
        string memory _videoHash,
        string memory _title,
        string memory _description,
        string memory _location,
        string memory _category,
        string memory _thumbnailHash,
        string memory _date
    )public {
        //Validating the videohash, title, and sender address
        require(bytes(_videoHash).length>0);
        require(bytes(_title).length>0);
        require(msg.sender != address(0));

        //Incrementing the video count
        videoCount++;
        //Adding the videos to the contract
        videos[videoCount] = Video(
            videoCount,
            _videoHash,
            _title,
            _description,
            _location,
            _category,
            _thumbnailHash,
            _date,
            msg.sender
        );
        // Triggering the event
        emit VideoUploaded(
            videoCount,
            _videoHash,
            _title,
            _description,
            _location,
            _category,
            _thumbnailHash,
            _date,
            msg.sender
        );
    }
}