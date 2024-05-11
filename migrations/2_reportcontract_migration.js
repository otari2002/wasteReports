const ReportContract = artifacts.require("ReportContract");

module.exports = function(deployer) {
    deployer.deploy(ReportContract);
};