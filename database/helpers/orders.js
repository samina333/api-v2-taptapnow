const db = require('../config.js');
const FicheOrder = require(`../models/ficheOrder.js`);
const Question = require(`../models/questions.js`);
const Answer = require(`../models/answer.js`);

const nodemailer = require('nodemailer');
const transporter = nodemailer.createTransport({
	service : 'gmail',
	auth    : {
		user : 'infotaptapnow@gmail.com',
		pass : 'Su33er99',
	},
});

// get orders base on restaurant id
// exports.getOrders = (rest_id, cb) => {

//   let query =
//     `select u.id_user, u.name_user, u.email_user, 
//     u.tel_user, u.photo_user, f.id_fiche,
//      f.status_fiche, f.qty_total,
//     f.montant_total,
//     t.montant_transaction,
//     t.restaurant_fk,
//      f.restaurant_fk , f.created_fiche, t.date_transaction
//      FROM user u,
//      fiche_order f, transaction t
//       where f.status_fiche <>  1
//       AND t.id_commande_fk = f.id_fiche
//       AND (f.restaurant_fk = ${rest_id} AND u.id_user = f.userFicheID)`;

//   db.knex.raw(query).then(function (response) {

//     cb(response[0]);
//   });
// };

// get orders base on fiche orders id
exports.getOrderDetails = (order_id, cb) => {
  let query =
    `SELECT * FROM order_menu , menu , fiche_order ,user,restaurant, transaction
    WHERE order_menu.menuOrderID = menu.id_menu AND
    fiche_order.id_fiche = order_menu.ficheOrderID AND
    fiche_order.userFicheID = user.id_user AND
    restaurant.id_restaurant = fiche_order.restaurant_fk AND
    transaction.id_commande_fk = fiche_order.id_fiche AND
    order_menu.ficheOrderID = ${order_id} `;
    db.knex.raw(query).then(function(response) {
      cb(response[0]);
    });
};



// get orders base on restaurant id
exports.updateOrder = (fiche_order, cb) => {
  let data = fiche_order; 
  sendMailToUserAboutOrderStauts(data);    

  delete data.email_user
  delete data.username

  FicheOrder
  .where({id_fiche: data.id_fiche})
  .save(data, {patch: true})
    .then((model) => {
      cb(model) 
  })
  .catch(error => cb(error))
};

// send email order 
sendMailToUserAboutOrderStauts = (data) => {
  // console.log('data fro email', data);
  let {status_fiche,email_user,username,id_fiche, comment} = data
  let mailOptions = {
    from: 'info@taptapnow.com', // sender address
    to: email_user, // list of receivers
    subject: 'Order status,', // Subject line
    html: `
		<div>
				<p> 
        Hi ${username} 
        your order  ${
          status_fiche == 2 ? ` is review wait a moment. ` :  
          status_fiche == 3 ? ` is ready to pickup we 're waiting for you` :  
          status_fiche == 4 ? ` is completed thank you very much ` :  
          status_fiche == 5 ? ` have been report cause ${comment}` :  
          null
        }
				</p>
        <p>
          Order reference ${id_fiche}
				</p>
				<p>
					Mèsi anpil pou sipò ou,
				</p>
				<p>
					Tap Tap Now Team
				</p>
				<p>
					<img src="https://res.cloudinary.com/transition-digital/image/upload/v1579733572/New_Project_2_fymcr2.png"
					 style="
						width: 140px;
					"/>
				</p>
		</div>
		`,
  }


  transporter.sendMail(mailOptions, function (err, info) {
		if (err) {
			console.log(' Send email error ', err);
		}
		else {
		}
	});
}


// get orders base on admin restaurant
exports.getOrdersStat = (data, cb) => {
  let id_user = data.id_user ;
  let usertype = data.userType;

  let query = '';
  if (usertype == 1) {
    query = `SELECT * FROM fiche_order, restaurant, transaction
    WHERE fiche_order.restaurant_fk = restaurant.id_restaurant
    AND transaction.id_commande_fk = fiche_order.id_fiche
    `;
  } else {
    query = `SELECT * FROM fiche_order, restaurant
    WHERE fiche_order.restaurant_fk = restaurant.id_restaurant
    AND restaurant.adminRestID = ${id_user || 0} `;
  }
  db.knex.raw(query).then(function(response) {
    cb(response[0]);
  });
};


// Get orders base on restaurant id
exports.getOrders = (rest_id, cb) => {
  let query =
    `select u.id_user, u.name_user, u.email_user, 
    u.tel_user, u.photo_user, f.id_fiche,
     f.status_fiche, f.qty_total,
    f.montant_total,
    f.created_fiche,
    t.date_transaction,
    t.montant_transaction,
    t.restaurant_fk,
    f.restaurant_fk 
     FROM user u, fiche_order f, transaction t
      where f.status_fiche <> 1
      AND t.id_commande_fk = f.id_fiche
      AND (f.restaurant_fk = ${rest_id} AND u.id_user = f.userFicheID)
      ORDER BY f.created_fiche ASC`;
  db.knex.raw(query).then(function(response) {
    cb(response[0]);
  });
};

// Get orders base on restaurant id
exports.getOrdersCompleted = (rest_id, cb) => {
  let query =
    `select u.id_user, u.name_user, u.email_user, 
    u.tel_user, u.photo_user, f.id_fiche,
     f.status_fiche, f.qty_total,
    f.montant_total,
    f.created_fiche,
    t.date_transaction,
    t.montant_transaction,
    t.restaurant_fk,
    f.restaurant_fk 
     FROM user u, fiche_order f, transaction t
      where f.status_fiche = 4
      AND t.id_commande_fk = f.id_fiche
      AND (f.restaurant_fk = ${rest_id} AND u.id_user = f.userFicheID)
      ORDER BY f.created_fiche ASC`;
  db.knex.raw(query).then(function(response) {
    cb(response[0]);
  });
};

// Get orders base on restaurant id need to set it by date of last payment for this restaurant
exports.getRestaurantReadyToGetPaid = (cb) => {
  let restaurant_to_pay_view = `SELECT * FROM all_restaurant_to_pay_view`;
  db.knex.raw(restaurant_to_pay_view).then(function (response) {
    cb(response[0]);
  });
};


 // Save questions
exports.addQuestions = (question, cb) => {
  new Question({})
    .save(question, { method: 'insert' })
    .then((saveQuestions) => cb(saveQuestions))
    .catch(error => console.log(error))
} 

exports.getquestions= (cb) => {
    let query=`SELECT * FROM question`
    db.knex.raw(query).then(function(response) {
      cb(response[0]);
    })
    .catch(error => cb(error))
}; 

exports.addAnswer= (answer, cb) => {
  new Answer({})
    .save(answer, { method: 'insert' })
    .then((saveData) => cb(saveData))
    .catch(error => console.log(error))
}
 
exports.getAnswer= (cb) => {
  console.log("samm")
    let query=`SELECT * FROM answer`
    db.knex.raw(query).then(function(response) {
      cb(response[0]);
    })
    .catch(error => cb(error))
};