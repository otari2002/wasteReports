// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract ReportContract {
    uint256 public reportCount = 0;
    
    struct Report {
        uint256 id;
        string cin;
        string name;
        string adresse;
        bool isAccepted;
    }
    mapping(uint256 => Report) public reports;
    event ReportCreated(
        uint256 id,
        string cin,
        string nom,
        string adresse,
        bool isAccepted
    );
    event ReportDeleted(
        uint256 id
    );
    function createReport(string memory _cin, string memory _name, string memory _adresse) public {
        reportCount++;
        reports[reportCount] = Report(reportCount, _cin, _name, _adresse, false);
        emit ReportCreated(reportCount, _cin, _name, _adresse, false);
    }
    function deleteReport(uint256 _id) public {
        delete reports[_id];
        emit ReportDeleted(_id);
        reportCount--;
    }
} 