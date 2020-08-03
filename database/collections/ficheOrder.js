var db = require('../config.js');
var FicheOrder = require('../models/ficheOrder.js');

var FicheOrders = new db.Collection();

FicheOrders.model = FicheOrder;

module.exports = FicheOrders;