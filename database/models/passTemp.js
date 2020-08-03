const db = require("../config.js");

var PassTemp = db.Model.extend({
  tableName: "pass_temp",
  hasTimeStamps: true,
});

module.exports = db.model("PassTemp", PassTemp);
