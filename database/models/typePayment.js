const db = require("../config.js");
require("./transaction.js");

var TypePayment = db.Model.extend({
  tableName: "type_paiement",
  hasTimeStamps: true,
});

module.exports = db.model("TypePayment", TypePayment);
