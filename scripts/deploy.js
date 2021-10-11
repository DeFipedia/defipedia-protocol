async function main() {

    const [deployer] = await ethers.getSigners()
    console.log('Deploying contracts with the account: ', deployer.address)

    const WikiToken = await ethers.getContractFactory('WikiToken')
    const wiki = await WikiToken.deploy();
    console.log('$WIKI is de[ployed to: ', wiki.address)

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error('Error occurred while deploying contracts ', error)
        process.exit(1)
    })