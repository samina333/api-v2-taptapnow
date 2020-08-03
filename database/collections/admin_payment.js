var db = require('../config.js');
var AdminPayment = require('../models/admin_payment.js');

var AdminPayment = new db.Collection();

AdminPayment.model = AdminPayment;

module.exports = AdminPayment;