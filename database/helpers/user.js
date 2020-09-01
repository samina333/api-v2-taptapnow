const db = require('../config.js');
const User = require('../models/user.js');
const Restaurant = require(`../models/restaurant.js`);

const nodemailer = require('nodemailer');
const transporter = nodemailer.createTransport({
	service : 'gmail',
	auth    : {
		user : 'infotaptapnow@gmail.com',
		pass : 'Su33er99',
	},
});

exports.getUserInfo = (email, cb) => {
  new User({ email_user: email })
    .fetch()
    .then(function(model) {
      if (model === null) {
        cb(null);
      } else {
        let user = model.attributes;
        cb(user);
      }
    })
    .catch(function(error) {
      console.log("we got an error: ", error);
    });
};

// Give user restaurant to admin
exports.setUserAdmin = (data, cb) => {
    Restaurant
    .where({id_restaurant: data.id_restaurant})
      .save({
          adminRestID: data.user_id,
          isActive: 1
        }, { patch: true }
      )
      .then((model) => {
        User
        .where({id_user: data.user_id})
          .save({
            restaurant_owner: 1,
            actif_user: 1
          }, { patch: true })
          // Send mail        
        sendMailToUser(data.currentUser.email_user, data.currentUser.createByAdmin, data.currentUser.name_user, data.currentUser.last_name);        
        cb(model)
    })
    .catch(error => cb(error))
}


// Add new user
exports.saveUser = (user, cb) => {
  new User({ email_user: user['email_user'] })
    .fetch()
    .then(function(model) {
      if (model === null) {
        new User({})
          .save(user, { method: "insert" })
          .then(function(saveUser) {
            let userValue = saveUser.attributes;
            cb(userValue, {});
          })
          .catch(err => console.log(err));
      } else {
        cb( null, { error: "User already exists" } );
      }
    })
    .catch(function(error) {
      console.log("we got an error: ", error);
    });
};

// Return user list for super admin
exports.getUsers = cb => {
  User.query("where", "id", "!=", 0)
    .fetchAll()
    .then(function(model) {
      cb(model);
    })
    .catch(error => cb(error));
};

// return user list for super admin
exports.getUsersTest = cb => {
  User
    .fetchAll()
    .then(function(model) {
      cb(model);
    })
    .catch(error => cb(error));
};

// Get user pagination


exports.getUserPagination =( data, cb) => {
  let limit = data.limit;
  let offset = data.offset;  
  let query = `SELECT * FROM user
  limit ${limit} offset ${offset}
  `;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
};

// get restaurant owner

exports.getRestaurantOwner = ( cb)=> {
  User.query('where', 'restaurant_owner', '=', 1)
  .fetchAll()
  .then(function(model) {
    cb(model)
  })
  .catch(error => cb(error))
}

exports.getUserCount = cb => {
  let queryCount = `SELECT COUNT(*) as userDataLength FROM user;`
  db.knex.raw(queryCount).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
};

// return user list for super admin

exports.searchUsers = (value, cb) => {
  let user_name = value.user_name
  User.query('where', 'name_user',  'like', `%${user_name}%`)
  .fetchAll()
    .then(function (model) {
    cb(model)
  })
  .catch(error => cb(error))
}

exports.getUserInfoByID = (id_user, cb) => {
  new User({ id_user: id_user })
    .fetch()
    .then(function(model) {
      if (model === null) {
        cb(null);
      } else {
        let user = model.attributes;
        cb(user);
      }
    })
    .catch(function(error) {
      console.log("we got an error: ", error);
    });
};

// update user 
exports.updateUser = (data,cb) => {
  User
  .where({id_user: data.id_user})
  .save(data, {patch: true})
  .then((model)=>{
      cb(model)
  })
  .catch(error => cb(error))
}

// send mail function to notify user
sendMailToUser = (email, createdByAdmin, name, last_name) => {
  let mailOptionsuserCreateByAdmin = {
		from    : 'info@taptapnow.com', // sender address
		to      : email, // list of receivers
		subject : 'You have admin access,', // Subject line
		html    : `
		<div>
				<p> 
				Hi ${last_name}Thank you for join Tap Tap Now as a restaurant admin.
				</p>
        <p>
          Connect to your account and you 'll be able to manage your restaurant with

          Your email: ${email},
          Your password: taptapnow01@,
				</p>
				<p>
					Mèsi anpil pou sipò ou,
				</p>

				<p>  Pleae change your password on login the first time </p>
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
	};

	let mailOptionsuserSelfCreate = {
		from    : 'info@taptapnow.com', // sender address
		to      : email, // list of receivers
		subject : 'You have admin access,', // Subject line
		html    : `
		<div>
				<p> 
        Hi ${name} Thank you for join Tap Tap Now as a restaurant admin.
				</p>
        <p>
          Connect to your account and you 'll be able to manage your restaurant.
				</p>
				<p>
					Mèsi anpil pou sipò ou,
				</p>

				<p> </p>
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
  };
  
  if (createdByAdmin == 1) {
    mailOptions = mailOptionsuserCreateByAdmin;
  } else {
    mailOptions = mailOptionsuserSelfCreate;
  }
  
  // console.log("mail i wanna send", mailOptions)
  
  transporter.sendMail(mailOptions, function (err, info) {
		if (err) {
			console.log(' Send email error ', err);
		}
		else {
		}
	});
};

//Updations
exports.deleteUser =( data, cb) => {
  let email = data.email;
  
  let query = `Delete from user where email_user="${email}"`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
};

exports.suspendUser =( data, cb) => {
  let email = data.email;
  
  let query = `update  user set user_status = ${0} where email_user="${email}"`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
};

exports.releaseUser =( data, cb) => {
  let email = data.email;
  
  let query = `update  user set user_status = ${1} where email_user="${email}"`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
};

exports.getSuspendeduser =(cb) => {
  
  let query = `select * from user where user_status = ${0}`;
  db.knex.raw(query).then(function (response) {
    cb(response[0])
  }).catch(error => cb(error))
};