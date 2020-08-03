const db = require("../config.js");

var Transaction = db.Model.extend({
  tableName: "transaction",
  hasTimeStamps: true,
});

module.exports = db.model("Transaction", Transaction);
