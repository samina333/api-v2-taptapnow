const AdminPayment = require('../../database/helpers/admin_payment.js');
const fs = require('fs');

const nodemailer = require('nodemailer');
const transporter = nodemailer.createTransport({
	service : 'gmail',
	auth    : {
		user : 'infotaptapnow@gmail.com',
		pass : 'Su33er99',
	},
});

exports.getAdminPayment = (req, res) => {
    AdminPayment.getAdminPayment( (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}
  
exports.getAdminPaymentByIdRestaurant = (req, res) => {
  let res_id = req.params.res_id
    AdminPayment.getAdminPaymentByIdRestaurant(res_id, (result) => {
      if(result) {
        res.status(200).send(result);
      }
      else {
        res.status(400).send({message: "can't fetch admin from the server retry"})
      }
  })
}
  
exports.makePaymentAdmin = (req, res) => {
  let data = req.body
  sendMailToUserAboutPayment(data)
  // So send an email to the admin .
  delete data.email_user;
  delete data.name_user;

  AdminPayment.makePaymentAdmin( data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}

exports.searchAdminPaymentBy = (req, res) => {
  let data = req.body;

  AdminPayment.searchAdminPaymentBy(data, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}

// Seach payment by interval searchByDateInterval()
exports.searchByDateInterval = (req, res) => {
  let data = req.body;

  AdminPayment.searchByDateInterval(data, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}

sendMailToUserAboutPayment = (data) => {
  // console.log('data fro email', data);
  let {email_user,name_user, amount, restaurant_fk} = data
  let mailOptions = {
    from: 'info@taptapnow.com', // sender address
    to:  email_user, // list of receivers
    subject: 'Payment informations,', // Subject line
    html: `
		<div>
				<p> 
        Hi ${name_user} 
          you have been received and payment for your restaurant 
				</p>
        <p>
          Payment reference #${restaurant_fk}
        </p>
        <p>
          Amount $ ${(amount).toFixed(2)} USD
        </p>
        <p>
        Fees 15% 
      </p>
      <p>
        Total amount $ ${ (amount.toFixed(2)  - amount.toFixed(2) * 15 / 100).toFixed(2)} USD
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
  
// Admin_payment
exports.getPaymentStat = (req, res) => {
  let data = req.body
  AdminPayment.getPaymentStat(data, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}