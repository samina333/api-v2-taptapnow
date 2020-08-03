const db = require("../config.js");

var Restaurant = db.Model.extend({
  tableName: "restaurant",
  hasTimeStamps: true,
});

module.exports = db.model("Restaurant", Restaurant);
