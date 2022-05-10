# breathtaking-hardhat-erc721-template

<img src="https://user-images.githubusercontent.com/45223699/167655509-14c96314-cfe3-4338-ac5d-4e32741c5275.gif" width="100%" />

Hey! 👋 This will be your best resource to bootstrap a Hardhat ERC-721 Contract. All of the direct dependencies use their latest available version and the architecture is clean and easy to extend. Have fun BUIDLing! 🤙

## Usage

1. Clone this repo:

```bash
git clone https://github.com/Accretence/breathtaking-hardhat-erc721-template
```

2. Install dependencies using:

```bash
npm install
```

3. Create your `.env` file according to the `sample.env` provided file.

```shell
MAINNET_PRIVATE_KEY=
RINKEBY_PRIVATE_KEY=
ALCHEMY_RINKEBY_ENDPOINT=
ALCHEMY_MAINNET_ENDPOINT=
CMC_KEY=
ETHERSCAN_KEY=
```

4. Test the contract:

There are exhaustive tests provided in the `Test.js` file. You can run the file using this command:

```shell
npx hardhat test
```

## Deploying

You can deploy this contract to Rinkeby testnet. This requires funding a wallet and registering API keys with [Alchemy](https://docs.alchemy.com/alchemy/introduction/getting-started) and [Etherscan]()

```shell
npm run rinkeby
```

You can also use the `verify` scripts to verify the contract on Etherscan.

```
npx hardhat verify --network rinkeby <YOUR_CONTRACT_ADDRESS>
```

Substitute `mainnet` for `rinkeby` to deploy for realsies. good luck!
