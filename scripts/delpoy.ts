import { ContractFactory } from "ethers";
import { ethers } from "hardhat";

async function main(contract: string) {
  const getContractFactory: ContractFactory = await ethers.getContractFactory(
    contract
  );
  const web3Vid = await getContractFactory.deploy();
  await web3Vid.deployed();
  console.log(`${contract} delpoyed to: ${web3Vid.address}`);
}

main("Web3Vid").catch((err: any) => {
  console.error(err);
  process.exitCode = 1;
});
