var db = require('../config.js');
var Answer = require('../models/answer.js');

var Answers = new db.Collection();

Answers.model = Answer;

module.exports = Answers; 