const db = require("../config.js");

var Country = db.Model.extend({
  tableName: "country",
  hasTimeStamps: true,
});

module.exports = db.model("Country", Country);
