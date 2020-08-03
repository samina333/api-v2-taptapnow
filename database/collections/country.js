var db = require('../config.js');
var Country = require('../models/country.js');

var Countries = new db.Collection();

Countries.model = Country;

module.exports = Countries;