const db = require("../config.js");

var Answer = db.Model.extend({
  tableName: "answer",
  hasTimeStamps: true,
});

module.exports = db.model("Answer", Answer);
 