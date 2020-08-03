const db = require("./config.js");

// Query's not good i fixed it for you by passing the id ,
exports.returnStat = (cb) => {
  //count base on restaurant_id
  // SELECT (select count(*) from fiche_order where `restaurant_id` = 1) as total_orders, (select count(*) from user where type_id = 3 and `restaurant_id` = 1) as customer, (select count(*) from user where type_id = 2 and `restaurant_id` = 1) as employees

  //Query to fix
  let query =
    `SELECT (select count(*) from fiche_order) as total_orders, (select count(*) from user where type_id = 3) as customer, (select count(*) from user where type_id = 2) as employees`;

  db.knex.raw(query).then(function (response) {
    cb(response[0]);
  });
};

exports.topMenu = (rest_id, cb) => {
  let query =
    `select count(*) as order_total, menu_id, m.name_menu, m.prix, m.img_menu from order_menu, menu m where m.id = order_menu.menu_id and order_menu.restaurant_id = ${rest_id} GROUP BY menu_id`;

  db.knex.raw(query).then(function (response) {
    cb(response[0]);
  });
};

