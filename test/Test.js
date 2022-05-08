const { expect, assert } = require('chai')
const { ethers } = require('hardhat')
const colors = require('colors')

describe('NFT', async () => {
    let nftContractFactory, nftContract

    describe('DeployNFT', () => {
        it('Should deploy.', async function() {
            nftContractFactory = await ethers.getContractFactory('NFT')

            nftContract = await nftContractFactory.deploy()
            await nftContract.deployed()

            console.log(`nftContract address is: ${nftContract.address}`.blue)
        })
    })

    describe('setEndpoint', () => {
        it('Should change endpoint.', async function() {
            await nftContract.setEndpoint(
                'https://nft.herokuapp.com/api/tokenURI/'
            )
        })
    })

    describe('setPrice', () => {
        it('Should change price.', async function() {
            await nftContract.setPrice(ethers.utils.parseEther('1'))
        })
    })

    describe('setMaxSupply', () => {
        it('Should modify maxSupply.', async function() {
            await nftContract.setMaxSupply(5)
        })
    })

    describe('setMintState', () => {
        it('Should modify mintState.', async function() {
            await nftContract.setMintState(1)
        })
    })

    describe('Mint', () => {
        it('Should mint.', async function() {
            const [
                owner,
                second,
                third,
                fourth,
                fifth,
                sixth,
                seventh,
            ] = await hre.ethers.getSigners()

            const signers = [owner, second, third]

            if (hre.network.config.chainId == 31337) {
                for (const signer of signers) {
                    await nftContract.connect(signer).publicMint({
                        value: ethers.utils.parseEther('1'),
                    })
                }
            } else {
                await nftContract.publicMint({
                    value: ethers.utils.parseEther('1'),
                })
            }

            // console.log(`tokenURI: ${await nftContract.tokenURI(0)}`.yellow);
        })
    })
})
