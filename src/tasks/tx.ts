import { ethers } from "ethers";
import { task, types } from "hardhat/config";

task("tx:raw", "get raw transaction")
  .addParam("key", "private key", undefined, types.string, false)
  .setAction(async (taskArgs: { key: string }, hre) => {
    const wa0gi = await hre.ethers.getContractFactory("WrappedA0GI");
    const data = (await wa0gi.getDeployTransaction()).data;

    const wallet = new ethers.Wallet(taskArgs.key);

    const tx = {
        type:     0,
        nonce:    0,
        gasPrice: ethers.parseUnits("100", "gwei"),
        gasLimit: 1000000n,
        to:       null,
        value:    0,
        data:     data,
        chainId:  0n
    };

    const signedTx = await wallet.signTransaction(
      ethers.Transaction.from(tx)
    );

    console.log("Raw Transaction (without chainId):", signedTx);
    /**
  curl RPC_URL \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_sendRawTransaction","params":["signedTx"],"id":1}'

     */
  });
