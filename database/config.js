var knex = require("knex")({
  client: "mysql",
  connection: process.env.DATABASE_URL || {
	  host: "3.19.229.100",
	  port: "3306",
    user: "taptapnowuser",
    password: "taptapnowpassword",
    database: "taptapnow"
  },
  pool: { min: 0, max: 1 }
});

var db = require("bookshelf")(knex);
db.plugin("registry");

//create country table
db.knex.schema.hasTable("country").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("country", function(count) {
        count.increments("id_country").primary();
        count.string("shortname_country", 100).unique();
        count.string("globalname_country", 150).unique();
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


//create type favoris
db.knex.schema.hasTable("favoris").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("favoris", function(fav) {
        fav.increments("id_favoris").primary();
        fav.integer("user_fk").notNullable();
        fav.integer("restaurant_fk").notNullable();
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create type_payment table
db.knex.schema.hasTable("type_paiement").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("type_paiement", function(tp) {
        tp.increments("id_type_pay").primary();
        tp.string("name_type_pay", 100).notNullable();;
        tp.string("img_type_pay", 250).notNullable();
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create type_payment table
db.knex.schema.hasTable("type").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("type", function(tp) {
        tp.increments("id_type").primary();
        tp.string("value_type", 100).unique();
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create user table add relation with country
db.knex.schema.hasTable("user").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("user", function(user) {
        user.increments("id_user").primary();
        user
          .integer("userTypeID")
          .notNullable();
          user
          .integer("countryIDUser")
          .notNullable();
        user.string("first_name", 250).notNullable();
        user.string("last_name", 250).notNullable();
        user.string("name_user", 250).notNullable();
        user.string("tel_user", 100).notNullable().unique();
        user.string("email_user", 100).notNullable().unique();
        user.string("password_user", 250).notNullable();
        user.string("photo_user", 500).defaultTo("default.jpg");
        user.integer("createByAdmin").defaultTo(0);
        user.integer("restaurantOwner").defaultTo(0);
        user.integer("actif_user").defaultTo(1);
        user.timestamp("created_user").defaultTo(knex.fn.now());
        user.timestamp("updated_user").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create restaurant table add relation with country and created user
db.knex.schema.hasTable("restaurant").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("restaurant", function(rest) {
        rest.increments("id_restaurant").primary();
        rest.integer("countryRestID").notNullable();
        rest.integer("adminRestID").notNullable();
        rest.string("name_restaurant", 250).notNullable();
        rest.string("email_restaurant", 100);
        rest.string("tel_restaurant", 100).notNullable();
        rest.string("website_restaurant", 250);
        rest.string("img_restaurant", 250);
        rest.string("logo_restaurant", 250);
        rest.string("adresse_restaurant", 250);
        rest.string("create_restaurant", 250);
        rest.string("updated_restaurant", 250);
        rest.string('lat_restaurant', 250);
        rest.string('long_restaurant', 250);
        rest.integer("open_restaurant").notNullable().defaultTo(1);
        rest
          .decimal("rate")
          .unsigned()
          .notNullable()
          .defaultTo(4);
        rest.decimal("tax", 10, 2).notNullable();
        rest.string("zipcode", 250).defaultTo(null);
        rest.string("state", 250).defaultTo(null);
        
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create category table add relation with restaurant
db.knex.schema.hasTable("category").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("category", function(cat) {
        cat.increments("id_category").primary();
        cat.string("value_category", 250).unique();
        cat.string("desc_category", 500);
        cat.string("img_category", 500).defaultTo("defaultcat.jpg");
        cat.string("creation_user", 50);
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create menu table add relation with category and restaurant
db.knex.schema.hasTable("menu").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("menu", function(men) {
        men.increments("id_menu").primary();
        men.integer("restaurantMenuID").notNullable();
        men.integer("categoryMenuID").notNullable();
        men.string("name_menu", 150);
        men.string("description_menu", 500);
        men.string("prix_menu", 250).notNullable();
        men.string("img_menu", 500);
        men.integer("actif_menu").defaultTo(0);
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create table offer
db.knex.schema.hasTable("offer").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("offer", function(off) {
        off.increments("id_offer").primary();
        off.integer("menuOfferID").notNullable();
        off.string("name_offer", 250);
        off.decimal("price_offer", 10, 2).notNullable();
        off.timestamp("date_start_offer").defaultTo(knex.fn.now());
        off.timestamp("date_end_offer").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});

//create rating table
db.knex.schema.hasTable("rating").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("rating", function(rate) {
        rate.increments("id_rating").primary();
        rate.integer("userRatID").notNullable();
        rate.integer("restRatID").notNullable()
        rate.string("comm_rating", 500);
        rate.decimal("value_rating", 10, 2);
        rate.timestamp("date_rating").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


//Create transaction table
db.knex.schema.hasTable("transaction").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("transaction", function(trans) {
        trans.increments("id_transaction").primary();
        trans
          .integer("id_user_fk")
          .notNullable();
        trans
          .integer("id_commande_fk")
          .notNullable();
        trans.decimal("montant_transaction", 10, 2);
        trans.timestamp("date_transaction").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


db.knex.schema.hasTable("fiche_order").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("fiche_order", function(order) {
        order.increments("id_fiche").primary();
        order.integer("userFicheID").notNullable();
        order.integer("restaurant_fk").notNullable();
        order.integer("status_fiche").notNullable();
        order.integer("qty_total");
        order.decimal("montant_total", 10, 2);
        order.timestamp("pickup_fiche").defaultTo(knex.fn.now());
        order.timestamp("created_fiche").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


db.knex.schema.hasTable("interest").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("interest", function(int) {
        int.increments("id_interest").primary();
        int.string("name_owner", 250).notNullable();
        int.text("adress_restaurant").notNullable();
        int.string("name_restaurant", 250).unique().notNullable();
        int.string("telephone", 250).notNullable();
        int.string("email_owner", 250).notNullable();
        int.timestamp("date").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


db.knex.schema.hasTable("order_menu").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("order_menu", function(orderMen) {
        orderMen.increments("id_order").primary();
        orderMen.integer("menuOrderID").notNullable();
        orderMen.integer("ficheOrderID").notNullable();
        orderMen.integer("id_restaurant_fk").notNullable();
        orderMen.integer("qty_order").notNullable();
        orderMen.decimal("price_order", 10, 2);
        orderMen.text("specification_order");
        orderMen.timestamp("created_order").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


db.knex.schema.hasTable("pass_temp").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("pass_temp", function(pass) {
        pass.increments("id_pass").primary();
        pass.integer("user_passID").notNullable();
        pass.string("value_temp", 250).notNullable();
        pass.integer("not_use").defaultTo(0);
        pass.timestamp("created_pass").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


db.knex.schema.hasTable("admin_payment").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("admin_payment", function(int) {
        int.increments("id_admin_payment").primary();
        int.string("restaurant_fk", 11).notNullable();
        int.text("user_fk", 11).notNullable();
        int.string("amount", 11).notNullable();
        int.string("create_by_admin_fk",11).notNullable();
        int.string("status_admin_payment",11).notNullable();
        int.timestamp("date_admin_payment").defaultTo(knex.fn.now());
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});
db.knex.schema.hasTable("photos").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("photos", function(int) {
        int.increments("photos_id").primary();
        int.string("label");
        int.string("img_menu").unique();
        int.date("date", 55).notNullable()
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


db.knex.schema.hasTable("bank_info").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("bank_info", function(field) {
        field.increments("id_bank_info").primary();
        field.integer("user_id_fk").notNullable();
        field.string("restaurant_legal_name");
        field.string("tax_number");
        field.string("bank_routing");
        field.string("account_number");
        field.string("mailing_address");
        field.string("phone_line");
        field.string("state");
        field.string("county_tax_rate");
        field.date("date", 55).nullable()
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


//updations
db.knex.schema.hasTable("question").then(function(exists) {
  if (!exists) {
    db.knex.schema
      .createTable("question", function(rest) {
        rest.increments("id_question").primary();
        rest.string("question", 2500);
      })
      .then(function(table) {
        console.log(`${table} created`);
      });
  }
});


// Comment it cause i have a special mysql compose key on it 
// db.knex.schema.hasTable("opening_times").then(function(exists) {
//   if (!exists) {
//     db.knex.schema
//       .createTable("opening_times", function(int) {
//         int.integer("restaurant_fk", 11).notNullable();
//         int.increments("id_opening_time").primary();
//         int.string("weekday").unique();
//         int.string("start_hour", 55).notNullable();
//         int.string("end_hour", 55).notNullable();
//       })
//       .then(function(table) {
//         console.log(`${table} created`);
//       });
//   }
// });

module.exports = db;
