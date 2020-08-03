const db = require("../config.js");

var Photos = db.Model.extend({
  tableName: "photos",
  hasTimeStamps: true,
});

module.exports = db.model("Photos", Photos);

