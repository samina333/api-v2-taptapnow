var db = require('../config.js');
var Restaurant = require('../models/restaurant.js');

var Restaurants = new db.Collection();

Restaurants.model = Restaurant;

module.exports = Restaurants;