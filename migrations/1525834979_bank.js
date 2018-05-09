var Bank = artifacts.require("Bank");

module.exports = function(deployer) {
  let ownerAddress = web3.eth.accounts[0];
  deployer.deploy(Bank, ownerAddress);
};
