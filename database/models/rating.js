const db = require("../config.js");

var Rating = db.Model.extend({
  tableName: "rating",
  hasTimeStamps: true,
});

module.exports = db.model("Rating", Rating);
