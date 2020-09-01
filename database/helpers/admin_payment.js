const db = require('../config.js');
const AdminPayment = require(`../models/admin_payment.js`);
const Service_fee = require(`../models/service_fee.js`);

exports.getAdminPayment = (cb) => {
  let query =
    `SELECT * FROM admin_payment, restaurant , user WHERE restaurant.adminRestID= user.id_user 
    AND admin_payment.restaurant_fk = restaurant.id_restaurant `;
    db.knex.raw(query).then(function(response) {
      cb(response[0]);
    })
    .catch(error => cb(error))
}
  
exports.getAdminPaymentByIdRestaurant = (value, cb) => {
  let query = `
    SELECT * FROM admin_payment, restaurant , user WHERE restaurant.adminRestID= user.id_user 
    AND admin_payment.restaurant_fk = restaurant.id_restaurant AND admin_payment.restaurant_fk = ${value}`;
    db.knex.raw(query).then(function(response) {
      cb(response[0]);
    })
    .catch(error => cb(error))
}
 
exports.makePaymentAdmin = (data, cb) => {
  new AdminPayment({})
    .save(data, { method: 'insert' })
    .then((savePayemnt) => cb(savePayemnt))
    .catch(error => console.log(error))
}

exports.searchAdminPaymentBy = (value, cb) => {
  let payment_id = value.payment_id
  AdminPayment.query('where', 'id_admin_payment',  '=', `${payment_id}`)
  .fetchAll()
  .then(function(model) {
    cb(model)
  })
  .catch(error => cb(error))
}
 
exports.searchByDateInterval = (data, cb) => {
  let { start_date, end_date } = data;
  let query = `
    SELECT * FROM admin_payment, restaurant , user 
    WHERE restaurant.adminRestID = user.id_user 
    AND admin_payment.restaurant_fk = restaurant.id_restaurant
    AND  date_admin_payment between '${start_date}' 
    AND '${end_date}' 
  `;

  db.knex.raw(query).then(function(response) {
    cb(response[0]);
  })
  .catch(error => cb(error))
}


exports.getPaymentStat = (data, cb) => {
  let id_user = data.id_user ;
  let usertype = data.userType;
  
  let query = '';
  if (usertype == 1) {
    query = `
      SELECT * FROM admin_payment;
    `;
  } else {
    query = 
     `
      SELECT * FROM admin_payment, restaurant
      WHERE restaurant.adminRestID = ${id_user} 
    `;
  }
  db.knex.raw(query).then(function(response) {
    cb(response[0]);
  });
};


exports.addfee= (service_fee, cb) => {
  new Service_fee({})
    .save(service_fee, { method: 'insert' })
    .then((saveData) => cb(saveData))
    .catch(error => console.log(error))
}

exports.getfee= (cb) => {
    let query=`SELECT * FROM service_fee`
    db.knex.raw(query).then(function(response) {
      cb(response[0]);
    })
    .catch(error => cb(error))
};

exports.updatefee= (dataa, cb) => {
  let data = dataa; 

  //update data.fee
  //delete data.username

  Service_fee
  .where({id_restaurant_fk: data.id_restaurant_fk})
  .save(data, {patch: true})
    .then((model) => {
      cb(model) 
  })
  .catch(error => cb(error))
};
