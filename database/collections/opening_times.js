var db = require('../config.js');
var Opening_times = require('../models/opening_times.js');
var Opening_times = new db.Collection();

Opening_times.model = Opening_times;
module.exports = Opening_times;