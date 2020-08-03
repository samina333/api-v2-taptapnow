const db = require("../config.js");

var OrderMenu = db.Model.extend({
  tableName: "order_menu",
  hasTimeStamps: true,
});

module.exports = db.model("OrderMenu", OrderMenu);
