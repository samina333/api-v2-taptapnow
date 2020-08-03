const db = require('../config.js');
const Country = require(`../models/country.js`);

exports.getCountry = (cb)=> {
    Country
    .fetchAll()
    .then(function(model) {
      cb(model)
    })
    .catch(error => cb(error))
}
  

// exports.getCountry = (value, cb)=> {
//     Country.query('where', 'name_owner', '=', value)
//     .fetchAll()
//     .then(function(model) {
//       cb(model)
//     })
//     .catch(error => cb(error))
//  }

