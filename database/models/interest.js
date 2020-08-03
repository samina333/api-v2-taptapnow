const db = require("../config.js");

var Interest = db.Model.extend({
  tableName: "interest",
  hasTimeStamps: true,
});

module.exports = db.model("Interest", Interest);
