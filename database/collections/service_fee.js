var db = require('../config.js');
var Service_fee = require('../models/service_fee.js');

var Service_fees = new db.Collection();

Service_fees.model = Service_fee;

module.exports = Service_fees; 