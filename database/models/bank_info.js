const db = require("../config.js");

var BankInfo = db.Model.extend({
  tableName: "bank_info",
  hasTimeStamps: true,
});

module.exports = db.model("BankInfo", BankInfo);

