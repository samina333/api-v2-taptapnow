const Opening_times = require(`../models/opening_times.js`);
const db = require('../config.js');
// Get opennig time
exports.getOpeningTimes = (restaurant_id, cb) => {
    let query=`SELECT * FROM opening_times WHERE restaurant_fk = ${restaurant_id}`
    db.knex.raw(query).then(function(response) {
      cb(response[0]);
    })
    .catch(error => cb(error))
};
 
//add new user
exports.saveOpeningTime = (data, cb) => {
    new Opening_times({})
    .save(data, { method: "insert" })
    .then(function(saveOpeningTime) {
    let openTime = saveOpeningTime.attributes;

    cb(openTime, {});
    })
      .catch(err =>
        // console.log(err)
        cb(err, null)
      )
};

exports.deleteOpeningTime = (id_opening_time, cb) => {
    Opening_times.query(function (query) {
          query.where('id_opening_time', '=', id_opening_time)
    })
    .destroy()
    .then((result) => cb(result, null))
    .catch(error => cb(null, error))
  }