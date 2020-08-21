var db = require('../config.js');
var Question = require('../models/questions.js');

var Questions = new db.Collection();

Questions.model = Question;

module.exports = Questions; 