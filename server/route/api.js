
const express = require('express');
const absolutex = require('../handler/absolutex');
const iquidus = require('../handler/iquidus');

const router = express.Router();

router.get('/address/:hash', absolutex.getAddress);
router.get('/block/average', absolutex.getAvgBlockTime());
router.get('/block/is/:hash', absolutex.getIsBlock);
router.get('/block/:hash', absolutex.getBlock);
router.get('/coin', absolutex.getCoin);
router.get('/coin/history', absolutex.getCoinHistory);
router.get('/coin/week', absolutex.getCoinsWeek());
router.get('/masternode', absolutex.getMasternodes);
router.get('/masternode/average', absolutex.getAvgMNTime());
router.get('/masternode/:hash', absolutex.getMasternodeByAddress);
router.get('/masternodecount', absolutex.getMasternodeCount);
router.get('/peer', absolutex.getPeer);
router.get('/supply', absolutex.getSupply);
router.get('/top100', absolutex.getTop100);
router.get('/tx', absolutex.getTXs);
router.get('/pos', absolutex.getPos);
router.get('/rewards', absolutex.getRewards);
router.get('/movements', absolutex.getMovements);
router.get('/timeIntervals', absolutex.getTimeIntervals);
router.get('/social', absolutex.getSocial);
router.get('/tx/latest', absolutex.getTXLatest);
router.get('/tx/week', absolutex.getTXsWeek());
router.get('/tx/:hash', absolutex.getTX);
router.post('/sendrawtransaction', absolutex.sendrawtransaction);
router.post('/login', absolutex.login);

// Iquidus Explorer routes.
router.get('/getdifficulty', iquidus.getdifficulty);
router.get('/getconnectioncount', iquidus.getconnectioncount);
router.get('/getblockcount', iquidus.getblockcount);
router.get('/getblockhash', iquidus.getblockhash);
router.get('/getblock', iquidus.getblock);
router.get('/getrawtransaction', iquidus.getrawtransaction);
router.get('/getnetworkhashps', iquidus.getnetworkhashps);

module.exports = router;
