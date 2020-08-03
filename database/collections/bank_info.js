var db = require('../config.js');
var BankInfo = require('../models/bank_info.js');

var BankInfo = new db.Collection();

BankInfo.model = BankInfo;

module.exports = BankInfo;