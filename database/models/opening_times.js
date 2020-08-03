const db = require("../config.js");

var Opening_times = db.Model.extend({
  tableName: "opening_times",
  hasTimeStamps: true,
});

module.exports = db.model("Opening_times", Opening_times);

