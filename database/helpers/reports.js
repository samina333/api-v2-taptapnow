const db = require('../config.js');
const Restaurant = require(`../models/restaurant.js`);
console.log("sam")
exports.logsCallsandDirections = (data,cb) => {
  let rest_id_fk = data.rest_id_fk;
    
  let query = `SELECT * FROM log_call_directions where id_restaurant_fk= ${rest_id_fk}`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}

exports.sales = (data,cb) => {
  let rest_id_fk = data.rest_id_fk;
    
  let query = `SELECT * FROM order_menu where id_restaurant_fk= ${rest_id_fk}`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}

exports.reviews = (cb) => {
    
  let query = `SELECT * FROM answer`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}
