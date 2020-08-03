const db = require("../config.js");

var Menu = db.Model.extend({
  tableName: "menu",
  hasTimeStamps: true,
});

module.exports = db.model("Menu", Menu);
