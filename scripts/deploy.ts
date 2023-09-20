import { ethers } from "hardhat";

const STB_address = "0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199";

async function main() {

  const stablecoinTransaction = await ethers.deployContract("StablecoinTransaction", [STB_address]);

  await stablecoinTransaction.waitForDeployment();

  console.log("StablecoinTransaction deployed to : ",await stablecoinTransaction.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
