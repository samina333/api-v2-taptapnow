var db = require('../config.js');
var Transaction = require('../models/transaction.js');

var Transactions = new db.Collection();

Transactions.model = Transaction;

module.exports = Transactions;