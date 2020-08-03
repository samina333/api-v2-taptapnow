var db = require('../config.js');
var TypePayment = require('../models/typePayment.js');

var TypePayments = new db.Collection();

TypePayments.model = TypePayment;

module.exports = TypePayments;