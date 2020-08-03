const db = require("../config.js");
require("./user.js");

var Type = db.Model.extend({
  tableName: "type",
  hasTimeStamps: true,
});

module.exports = db.model("Type", Type);
