const db = require("../config.js");

var Question = db.Model.extend({
  tableName: "question",
  hasTimeStamps: true,
});

module.exports = db.model("Question", Question);
 