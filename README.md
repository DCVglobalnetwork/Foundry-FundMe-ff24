## Foundry Fund Me

## Getting Started

### Requirements

`git`
You'll know you did it right if you can run git --version and you see a response like git version x.x.x

`foundry`
You'll know you did it right if you can run forge --version and you see a response like forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)

## Quickstart
```sh
git clone https://github.com/DCVglobalnetwork/Foundry-FundMe-ff24.git
cd Foundry-FundMe-ff24
```

### Usage

### Deploy

```shell
forge script script/DeployFundMe.s.sol
```

### Test

Testing
3 test tiers in this repo

Unit
Integration
Forked

```shell
$ forge test
```

```sh
forge test --fork-url $SEPOLIA_RPC_URL
```
### Test Coverage

```sh
Test Coverage
```
### Deployment to a testnet or mainnet

Setup environment variables
You'll want to set your SEPOLIA_RPC_URL and PRIVATE_KEY as environment variables. You can add them to a .env file, similar to what you see in .env.example.

PRIVATE_KEY: The private key of your account (like from metamask). NOTE: FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
You can learn how to export it here.
SEPOLIA_RPC_URL: This is url of the sepolia testnet node you're working with. You can get setup with one for free from Alchemy
Optionally, add your ETHERSCAN_API_KEY if you want to verify your contract on Etherscan.

Get testnet ETH
Head over to faucets.chain.link and get some testnet ETH. You should see the ETH show up in your metamask.

### Deploy
```sh
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```
### Scripts
After deploying to a testnet or local net, you can run the scripts.

```sh
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```
or
```sh
forge script script/Interactions.s.sol:FundFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```

### Withdraw
```sh
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```
### Estimate gas
You can estimate how much gas things cost by running:
```sh
forge snapshot
```
And you'll see an output file called `.gas-snapshot`

Using cast deployed locally example:
### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
