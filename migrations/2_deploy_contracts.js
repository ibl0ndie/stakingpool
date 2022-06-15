const StakingPool = artifacts.require("StakingPool")

module.exports = async function (deployer) {
    await deployer.deploy(StakingPool)
}