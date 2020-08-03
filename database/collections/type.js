var db = require('../config.js');
var Type = require('../models/type.js');

var Types = new db.Collection();

Types.model = Type;

module.exports = Types;