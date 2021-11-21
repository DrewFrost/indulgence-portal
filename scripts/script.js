const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const contractFactory = await hre.ethers.getContractFactory('MorningPortal');
  const contract = await contractFactory.deploy();
  await contract.deployed();

  console.log('Contract deployed at address: ' + contract.address);
  console.log('Contract deployed by: ' + owner.address);

  let sendMessageTx = await contract.sendMorningMessage(
    'Defending my diploma today, wish me luck'
  );
  sendMessageTx.wait();
  
  sendMessageTx = await contract
    .connect(randomPerson)
    .sendMorningMessage('Going for job interview today');
  sendMessageTx.wait();
  await contract.getAllMorningMessages();
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (e) {
    console.error('Contract exited with error: ' + e.message);
    process.exit(1);
  }
};

runMain();
