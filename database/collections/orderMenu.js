var db = require('../config.js');
var OrderMenu = require('../models/orderMenu.js');

var OrderMenu = new db.Collection();

OrderMenus.model = OrderMenu;

module.exports = OrderMenus;