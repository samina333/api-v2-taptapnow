var db = require('../config.js');
var Rating = require('../models/rating.js');

var Ratings = new db.Collection();

Ratings.model = Type;

module.exports = Rating;