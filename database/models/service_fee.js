const db = require("../config.js");

var Service_fee = db.Model.extend({
  tableName: "service_fee",
  hasTimeStamps: false,
});

module.exports = db.model("Service_fee", Service_fee);
 