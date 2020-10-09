const Order = require('../../database/helpers/orders.js');
const db = require('../../database/config.js');


0
// iOS Notification
sendIosNotifications = (restaurant_token, message) => {
	var apn = require('apn')
	var options = {
		token:{
			key: '../api-v2-taptapnow/AuthKey_KX7B3GKJ5D.p8',
			keyId: 'KX7B3GKJ5D',
			teamId: 'G8538JXDQ3'
		},
		production: true
	}

	var apnProvider = new apn.Provider(options)
	// let deviceToken = 'f61c70cc1cf5fc54ab047e7897e67c1fb68bb0ed0fc8db7770be7066280ef1e'
	var note = new apn.Notification()
	note.expiry = Math.floor(Date.now() / 1000) + 3600
	note.badge = 1
	note.sound = "ping.aiff"
	note.alert = message
	note.payload = {'messageFrom': 'Special Offer'}
	note.topic = 'com.axscentgroup.taptapnow'
		apnProvider.send(note, restaurant_token).then( (response) =>{
		response.sent.forEach( (token) => {
			console.log('Notifications Sent')
        })
            
	    response.failed.forEach((failure)=>{
		if (failure.error)	{
			console.log('error',error)
		}else{
			console.log(failure.status)
			console.log(failure.response)
		}
	})
})
}
	

// Android Notifications
sendAndroidNotifications =(restaurant_token,messageText)=> {
  
const FCM = require('fcm-node')
const serverKey = require('../../taptap-now-1576868620811-firebase-adminsdk-hpzjx-6b74c7244b.json')
const fcm = new FCM(serverKey)

	var message = {
		to: restaurant_token,
		// collapse_key: 'Tap Tap Now',

		notification: {
			title: 'Order Update',
			body: messageText
		}
	}

	fcm.send(message, function(err, response){
		if(err)	{
			console.log('Something wrong ->',err)
		} else{
			console.log('Notification sent ->',response)
		}
	})
}


// Get order by restaurantID 
exports.getOrders = (req, res) => {
  let rest_id = req.params.rest_id;
  Order.getOrders(rest_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}


 
exports.getOrdersCompleted = (req, res) => {
  let rest_id = req.params.rest_id;
  Order.getOrdersCompleted(rest_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}

// Get order details by id order 
exports.getOrderDetails = (req, res) => {
  let order_id = req.params.order_id;
  Order.getOrderDetails(order_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}


// Update fiche order 
exports.updateOrder = (req, res,cb) => {
  let fiche_order = req.body;
  Order.updateOrder(fiche_order, (result) => {
    if(result) {
      
      let query = `SELECT userFicheID FROM fiche_order where id_fiche= ${req.body.id_fiche}`;
  db.knex.raw(query).then(function (response) {
    //cb(response[0])
    console.log(response[0][0].userFicheID)

    let query2 = `SELECT token_notification FROM user where id_user= ${response[0][0].userFicheID}`;
  db.knex.raw(query2).then(function (response) {
    //cb(response[0])
    console.log(response[0][0].token_notification);
    restaurantToken = response[0][0].token_notification;
   if (restaurantToken.length > 64) {
          sendAndroidNotifications(restaurantToken, "your food is ready to pickup")
          } else {
            sendIosNotifications(restaurantToken, "your food is ready to pickup")
            }
res.status(200).send(result);
  }).catch(error => cb(error))


  }).catch(error => cb(error))


    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  }) 
} 
// // Get order by id user
// exports.getOrders = (req, res) => {
//   let rest_id = req.params.rest_id;
//   Order.getOrders(rest_id, (result) => {
//     if(result) {
//       res.status(200).send(result);
//     }
//     else {
//       res.status(400).send({message: "can't return list orders"})
//     }
//   })
// }


// Get order stat
exports.getOrdersStat = (req, res) => {

  let data = req.body
  Order.getOrdersStat(data, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}



// Get getRestaurantReadyToGetPaid
  // List of all restaurant who have orders at the time of the last payment  
exports.getRestaurantReadyToGetPaid = (req, res) => {
  // let data = req.body
  Order.getRestaurantReadyToGetPaid((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}



exports.addQuestions = (req, res) => {
  data = req.body;
  
    //handle type issues

for (var i=0; i<data.question.length ; i++){
questions ={}
  let question = data.question[i];

  questions.question = question;

  console.log(" Format result ", questions)


console.log(questions)
        Order.addQuestions(questions, (result) => {
          if(result){
            //res.status(200).send(result);
            console.log(result)
          }
          else {
            //res.status(400).send({result: "can't save new restaurant"});
                        console.log("error")

          }
        })    
}   
res.status(200).send("success");

}

exports.getquestions = (req, res) => {

    Order.getquestions((result) => {
        if(result) {
            res.status(200).send(result);
        }
        else {
        res.status(400).send({message: "can't get"})
        }
    })
}


exports.addAnswer = (req, res) => {
  data = req.body;
  
for (var i=0; i<data.answer.length ; i++){
answers ={}

  
  let id_question_fk = data.id_question_fk[i];
  let question = data.question[i];
  let answer = data.answer[i];

  answers.id_question_fk = id_question_fk;
  answers.question = question;
  answers.answer = answer;

  console.log(" Format result ", answers)
  console.log(answers)
        Order.addAnswer(answers, (result) => {
          if(result){
            //res.status(200).send(result);
            console.log(result)
          }
          else {
            //res.status(400).send({result: "can't save new restaurant"});
                        console.log("error")

          }
        })    
}   
res.status(200).send("success");

}

exports.getAnswer = (req, res) => {
console.log("sam")
    Order.getAnswer((result) => {
        if(result) {
            res.status(200).send(result);
        }
        else {
        res.status(400).send({message: "can't get"})
        }
    })
}
 
exports.getAnswer2 = (req, res) => {
console.log("sam")
    Order.getAnswer2((result) => {
        if(result) {
            res.status(200).send(result);
        }
        else {
        res.status(400).send({message: "can't get"})
        }
    })
}