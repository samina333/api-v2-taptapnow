const db = require("../config.js");

var FicheOrder = db.Model.extend({
  tableName: "fiche_order",
  hasTimeStamps: true,
});

module.exports = db.model("FicheOrder", FicheOrder);
