require("@nomicfoundation/hardhat-toolbox");

task("accounts", "Prints the list of accounts", async () => {
  const accounts = await ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  paths: {
    artifacts: "./artifacts",
    sources: "./contracts",
    cache: "./cache",
    tests: "./tests"
  },
  //npx hardhat run --network ganache scripts/gretterDeploy.js
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545"
    }
  },
  defaultNetwork: "ganache",
  // polygonmatic: {
  //   url: "https://rpc-mumbai.maticvigil.com",
  //   accounts: ["privatekey"]
  // }
};
