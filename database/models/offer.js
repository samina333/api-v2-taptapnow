const db = require("../config.js");

var Offers = db.Model.extend({
  tableName: "offer",
  hasTimeStamps: true,
});

module.exports = db.model("Offers", Offers);
