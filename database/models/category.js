const db = require("../config.js");

var Category = db.Model.extend({
  tableName: "category",
  hasTimeStamps: true,
});

module.exports = db.model("Category", Category);

