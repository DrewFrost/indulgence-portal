const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();
  console.log('Contract deployed by:', deployer.address);
  console.log('Deployer has balance of:', accountBalance.toString());
  const Token = await hre.ethers.getContractFactory('IndulgencePortal');
  const portal = await Token.deploy();
  await portal.deployed();

  console.log('Indulgence portal address:', portal.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (e) {
    console.error('Programm exited with error: ' + e.message);
    process.exit(1);
  }
};
runMain();
