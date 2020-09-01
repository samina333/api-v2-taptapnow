const db = require('../config.js');
const Restaurant = require(`../models/restaurant.js`);

exports.getRestaurantById = (rest_id, cb) => {  
  let query = `
    SELECT * FROM restaurant , user 
    WHERE 
    restaurant.id_restaurant = ${rest_id}
    AND restaurant.adminRestID = user.id_user
  `;
  db.knex.raw(query).then(function(response) {
    cb(response[0]);
  }).catch(error => cb(error))
}

//get restaurant by id user
exports.getRestaurantByIdUser = (user_id, cb)=> {
  Restaurant.query('where', 'adminRestID', '=', user_id)
  .fetchAll()
  .then(function(model) {
    cb(model)
  })
  .catch(error => cb(error))
}


// All restaurant with pagination
exports.getRestaurant = (data,cb) => {
  let limit = data.limit;
  let offset = data.offset;  
  let query = `SELECT * FROM restaurant
  limit ${limit} offset ${offset}
  `;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}

// All restaurant without pagination
exports.getRestaurantWithOutPagination = (cb) => {
  let query = `SELECT * FROM restaurant`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}
 
// Count restaurant .. !
exports.getRestaurantCount = (cb) => {
  let queryCount = `SELECT COUNT(*) as restaurantLength FROM restaurant;`
  db.knex.raw(queryCount).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}

// Save restaurant
exports.saveRestaurant = (restaurant, cb) => {
  new Restaurant({})
    .save(restaurant, { method: 'insert' })
    .then((saveRestaurant) => cb(saveRestaurant))
    .catch(error => console.log(error))
}

// Update restaurant
exports.updateRestaurant = (data,cb) => {
    Restaurant
    .where({id_restaurant: data.id_restaurant})
    .save(data, {patch: true})
    .then((model)=>{
        cb(model)
    })
    .catch(error => cb(error))
}

// Search restauraut
exports.searchRestaurant = (value, cb) => {
  let restaurant_name = value.restaurant;
  let adminRestID = value.adminRestID;
  let userTypeID = value.userTypeID;
  console.log(restaurant_name)
  let query = ``;
  if (userTypeID == 2) {
     query = `
    SELECT * FROM restaurant  
    WHERE 
    restaurant.name_restaurant LIKE '%${restaurant_name}%'
    AND restaurant.adminRestID = ${adminRestID}`;
  }
  else {
    query = `
    SELECT * FROM restaurant  
    WHERE 
    restaurant.name_restaurant LIKE '%${restaurant_name}%'`;
  } 
  
  db.knex.raw(query).then(function (response) {
    cb(response[0]);
  }).catch(error => cb(error))
}


// Total dish of
exports.statRestaurantMenu = (data, cb) => {
  // Total dish of
  let id_user = data.id_user;
  let usertype = data.userType;
  let query = '';
  if (usertype == 1) {

    query = `
      SELECT * FROM menu, restaurant WHERE
      menu.restaurantMenuID = restaurant.id_restaurant
    `;
  } else {
    query = `
      SELECT * FROM menu, restaurant WHERE
      menu.restaurantMenuID = restaurant.id_restaurant
      AND restaurant.adminRestID = ${id_user} 
  `;
  }
  
  db.knex.raw(query).then(function (response) {
    cb(response[0]);
  }).catch(error => cb(error))
}


//updations
exports.getRestaurantByZip = (data,cb) => {
  let zipcode = data.zipcode;
    
  let query = `SELECT * FROM restaurant where zipcode= ${zipcode}`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}


exports.alert = (rest_id, cb) => { 
  // const rest_lat = 0;
  // const rest_long = 0;

  let query = `
    SELECT * FROM restaurant , user 
    WHERE 
    restaurant.id_restaurant = ${rest_id}
    AND restaurant.adminRestID = user.id_user
  `;

  db.knex.raw(query).then(function(response) {
    //cb(response[0]);
        console.log(response[0][0].lat_restaurant)
      const  rest_lat = response[0][0].lat_restaurant;
      const  rest_long = response[0][0].long_restaurant;

        let query2 = `SELECT *, ( 3959 * acos( cos( radians(lat) ) * cos( radians( ${rest_lat} ) ) * 
        cos( radians( longit ) - radians(${rest_long}) ) + sin( radians(lat) ) * 
        sin( radians(${rest_lat} ) ) ) ) AS distance FROM user HAVING distance < 30 ORDER BY distance;`

        db.knex.raw(query2).then(function(response) {
          cb(response[0]);
          }).catch(error => cb(error))


  }).catch(error => cb(error))

  
}

exports.getServicefee = (cb) => {
    
  let query = `SELECT id_restaurant, name_restaurant, service_fee FROM restaurant`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
}

exports.updateServicefee= (dataa, cb) => {
  let data = dataa; 

  //update data.fee
  //delete data.username

  Restaurant
  .where({id_restaurant: data.id_restaurant})
  .save(data, {patch: true})
    .then((model) => {
      cb(model) 
  })
  .catch(error => cb(error))
};