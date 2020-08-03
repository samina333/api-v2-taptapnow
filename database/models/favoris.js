const db = require("../config.js");

var Favoris = db.Model.extend({
  tableName: "favoris",
  hasTimeStamps: true,
});

module.exports = db.model("Favoris", Favoris);
