# breathtaking-hardhat-erc721

![Lisa](https://media1.giphy.com/media/3orif0X0NtXPresE24/giphy.gif?cid=790b7611511e3a52eeb29a669a8654b57decdaa6cbadc7d4&rid=giphy.gif&ct=g)

## Usage

Checkout this repo and install dependencies

```shell
npm install
```

Create your `.env` file according to the `sample.env` provided file.

```shell
MAINNET_PRIVATE_KEY=
RINKEBY_PRIVATE_KEY=
ALCHEMY_RINKEBY_ENDPOINT=
ALCHEMY_MAINNET_ENDPOINT=
CMC_KEY=
ETHERSCAN_KEY=
```

## Testing

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
