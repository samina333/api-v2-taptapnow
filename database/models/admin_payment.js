const db = require("../config.js");

var AdminPayment = db.Model.extend({
  tableName: "admin_payment",
  hasTimeStamps: true,
});

module.exports = db.model("AdminPayment", AdminPayment);

