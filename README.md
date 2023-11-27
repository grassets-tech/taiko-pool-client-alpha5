# taiko-pool-client for Alpha 5

This is a L2 Taiko pool prover docker package, which allow you to join the Taiko pool with awesome prove-runners.

Your node will be added in the list of nodes which will be wisely selected to prove Taiko blocks.

Requirements:
 - CPU: Intel i9-12900K or AMD 9550x or similar, should be CPU with more than 3500 Mhz.
 - Modify .env with your prover's Name and wallets ID for Rewards.
 - Check that port is open on your firewall.

How to run:
   - Modify `.env` accordingly:
   - Set `PROVER_PORT` normally should not be changed, unless it is already in use
   - Set `PROVER_WALLET` it will be used to distribute rewards if proof is accepted by Taiko smartcontract
   - Set `PROVER_NAME` your prover fency name
   - Run docker-compose by `docker-compose up -d`

Note:
 - Upon image update you will need to delete old image to be able to use new one `docker image rm davaymne/taiko-pool-proverd-alpha-5`


> NOTE: " Taiko pool" is currently in beta version, so expect servers restart, code updates, bug fix and new feature delivery activities.

> It is your responsibility to keep your server up and running and conduct appropriately.

### Prover Warming up
When prover joins Taiko Pool it puts on hold for a period of 10 min. Once 10 mins is expired porver may start getting tasks for proving.

### Prover Jail

> Your node can be jailed for a period up to 24 hrs, in case of node unavailability during prooving cycle. Please, keep an eye on it and do not reboot/restart your node if it is unnecessarily. 

How to properly shutdown node:
 1. Go to the dashboard https://dashboard.taikopool.xyz and check whether your producer is on the "Producers in work" tab.
 > If your producer currently prooving block, shutdown will cause your prover to be jailed for a period up to 24 hrs.
 2. Go to you docker and stop `taiko-pool-client` first by:
 ```
  docker stop taiko_pool_client 
 ```
 3. Follow with dashboard and once you prover is done with block prooving, it will no longer be on the "Producers in work" tab. Go and completelly shutdown you prover.
 ```
 docker-compose down
 ```

Participation Benefits:
 - You may be eligible to earn Sepolia Eth as a rewards.
 - If you are active and contribute into the project, your prover wallet will be shared with Taiko team.


  > Note: It is important to note that all on-chain activities will be happening using "Taiko Pool wallet"

How it works:

Once you configure your endpoint and start docker, client will be sending periodic register messages with your public Endpoint and wallet address to the Pool Manager.
Pool manager will assess your node against HW requirements and if it meets will be added in the list of Provers then.
Once new block which requires prove is detected, prover endpoint will be selected from the list and get assigned block to prove.
Prover generate prove and submit it to Taiko Pool, which will be submitted to the contract using Pool Wallet.

<img width="715" alt="Screenshot 2023-08-16 at 21 32 51" src="https://github.com/davaymne/taiko-pool-client-alpha5/assets/29555611/eec89543-fba4-42c4-b97f-04baf6b5d175">

# Disclaimer #
- "Taiko pool" is currently in beta version on Testnet, so expect servers restart, code updates, bugs fix and new feature delivery activities.
- "Taiko pool" has no responsibility if any expenses incurred related for node running
- Pool development activity can be closed at any time without any notice
