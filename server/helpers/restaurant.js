const Restaurant = require('../../database/helpers/restaurant.js');
const fs = require('fs');


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
	var FCM = require('fcm-node')
	var serverKey = require('../../taptap-now-1576868620811-firebase-adminsdk-hpzjx-6b74c7244b.json')
	var fcm = new FCM(serverKey)
// Android Notifications
sendAndroidNotifications =(restaurant_token,messageText)=> {
	var message = {
		to: restaurant_token,
		// collapse_key: 'Tap Tap Now',

		notification: {
			title: 'Special Offer',
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


exports.getRestaurant = (req, res) => {
  let data = req.body;
  Restaurant.getRestaurant(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}

// restaurant with paginations
exports.getRestaurantWithOutPagination = (req, res) => {
  Restaurant.getRestaurantWithOutPagination((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}

// Count restaurant 
exports.getRestaurantCount = (req, res) => {
  Restaurant.getRestaurantCount((result) => {
    if (result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}

// by id restaurant
exports.getRestaurantById = (req, res) => {
  let id = req.params.rest_id;
  Restaurant.getRestaurantById(id,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}




// Get restaurant by id users

exports.getRestaurantByIdUser = (req, res) => {
  let id_user = req.params.id_user;
  Restaurant.getRestaurantByIdUser(id_user,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}


exports.saveRestaurant = (req, res) => {
  data = req.body;
  restaurant ={}
    //handle type issues
  let user = parseInt(data.adminRestID);
  let name_restaurant = data.restaurant_name;
  let countryRestID = parseInt(data.countryRestID);
  let lat = data.lat_restaurant;
  let long = data.long_restaurant;
  let tel_restaurant = data.tel_restaurant;
  let adresse_restaurant = data.adresse_restaurant;
  let zipcode = data.zipcode;
  let state = data.state;

  let delivery_service = data.delivery_service;
  let delivery_fee = data.delivery_fee;
  
   
  restaurant.adminRestID = user;
  restaurant.countryRestID = countryRestID;
  restaurant.name_restaurant = name_restaurant;
  restaurant.lat_restaurant = lat;
  restaurant.long_restaurant = long;
  restaurant.tel_restaurant = tel_restaurant; 
  restaurant.adresse_restaurant = adresse_restaurant;
  restaurant.zipcode = zipcode;
  restaurant.state = state;
  restaurant.delivery_service = delivery_service;
  restaurant.delivery_fee = delivery_fee;

  // default value define
  restaurant.email_restaurant = 'service@taptapnow.com';
  restaurant.website_restaurant = 'not defined';
  restaurant.img_restaurant = 'not defined';
  restaurant.open_restaurant = 0;
  restaurant.rate = 0;
  restaurant.tax = 10;

  console.log(" Format result restaurant ", restaurant)

  if (req.file) {
    // get the temporary location of the file
    var tmp_path = req.file.path;
    // // set where the file should actually exists - in this case it is in the "menu" directory
    var target_path = req.file.destination+Date.now()+req.file.originalname;


    // move the file from the temporary location to the intended location
    fs.rename(tmp_path, target_path, function(err) {
        if (err) {
          res.send({response: "can't save"});
        }
        else {
          restaurant.logo_restaurant = target_path.substring(21)
          Restaurant.saveRestaurant(restaurant, (result) => {
            if(result){
              res.status(200).send(result);
            }
            else {
              res.status(400).send({result: "can't save new restaurant"});
            }
          })

        }

    });

  } else {
    restaurant.logo_restaurant = '2019-12-21T16:11:06.879ZresLogo.jpg';
        Restaurant.saveRestaurant(restaurant, (result) => {
          if(result){
            res.status(200).send(result);
          }
          else {
            res.status(400).send({result: "can't save new restaurant"});
          }
        })    
    }
}

exports.updateRestaurant = (req,res) => {
  let data = req.body;

  data = req.body;
  restaurant ={}
    //handle type issues
  let user = parseInt(data.adminRestID);
  let name_restaurant = data.restaurant_name;
  let countryRestID = parseInt(data.countryRestID);
  let lat = data.lat_restaurant;
  let long = data.long_restaurant;
  let tel_restaurant = data.tel_restaurant;
  let adresse_restaurant = data.adresse_restaurant;
  let zipcode = data.zipcode;
  let state = data.state;
  let tax = data.tax;
  let delivery_service = data.delivery_service;
  let delivery_fee = data.delivery_fee;
  let stripeId = data.stripeId;
  let id_restaurant = data.id_restaurant;

  restaurant.adminRestID = user;
  restaurant.countryRestID = countryRestID;
  restaurant.name_restaurant = name_restaurant;
  restaurant.lat_restaurant = lat;
  restaurant.long_restaurant = long;
  restaurant.tel_restaurant = tel_restaurant; 
  restaurant.adresse_restaurant = adresse_restaurant;
  restaurant.zipcode = zipcode;
  restaurant.state = state;
  restaurant.tax = tax;
  
  restaurant.delivery_service = delivery_service;
  restaurant.delivery_fee = delivery_fee;
  restaurant.stripeId = stripeId;

  restaurant.id_restaurant = id_restaurant

  restaurant.open_restaurant = data.open_restaurant;
  // default value define
  restaurant.email_restaurant = 'service@taptapnow.com';
  restaurant.website_restaurant = 'not defined';
  restaurant.img_restaurant = 'not defined';

  if (req.file) {
    // get the temporary location of the file
    var tmp_path = req.file.path;
    // // set where the file should actually exists - in this case it is in the "menu" directory
    var target_path = req.file.destination+Date.now()+req.file.originalname;
    // move the file from the temporary location to the intended location
    fs.rename(tmp_path, target_path, function(err) {
        if (err) {
          res.send({response: "can't save"});
        }
        else {
          restaurant.logo_restaurant = target_path.substring(21)

          Restaurant.updateRestaurant(restaurant, (result) => {
            if (result) {
                res.status(200).send(result);
            }
            else {
                res.status(400).send({message: "Error can't update"});
            }
        })
      }
    });
  } else {
    // restaurant.logo_restaurant = '2019-12-21T16:11:06.879ZresLogo.jpg'
    Restaurant.updateRestaurant(restaurant, (result) => {
        if(result){
          res.status(200).send(result);
        }
        else {
          res.status(400).send({message: "Error can't update"});
        }
    })  
  }
  
}

// Search restaurant
exports.searchRestaurant = (req,res) => {
  let data = req.body;
  console.log(req.body)
  Restaurant.searchRestaurant(data, (result) => {
    if (result) {
        res.status(200).send(result);
      }
      else {
         res.status(400).send({message: "Error can't update"});
      }
  })
}
 
// statRestaurantMenu
exports.statRestaurantMenu = (req, res) => {

  let data = req.body;

  Restaurant.statRestaurantMenu(data, (result) => {
    if (result) {
        res.status(200).send(result);
      }
      else {
          res.status(400).send({message: "Error can't update"});
      }
  })
}


//updation
exports.getRestaurantByZip = (req, res) => {
  let data = req.body;
  Restaurant.getRestaurantByZip(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}

exports.alert = (req, res) => {
  let id = req.body.rest_id;
  let message = req.body.message;
console.log(message)
  Restaurant.alert(id,(result) => {
    if(result) {
      //res.status(200).send(result);
      var tabledata = JSON.stringify(result);
      var datt = JSON.parse(tabledata);
     
      let arr = [];
          datt.map(sensor => {
            arr.push(sensor.token_notification);
            })

     
      let restaurantToken = arr ;    

      for (let i = 0 ; i<restaurantToken.length ; i++){
      // if (restaurantToken) {

        if (restaurantToken[i].length > 64) {
          sendAndroidNotifications(restaurantToken[i], message)
          } else {
            sendIosNotifications(restaurantToken[i], message)
            }    
           // }
      }
            
                                res.status(200).json({
                                    "status": 200,
                                    "success": true,
                                    "error":null,
                                    "response": "notification send"
                                });
      
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}

exports.getServicefee = (req, res) => {

  Restaurant.getServicefee((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants from the server"})
    }
  })
}

exports.updateServicefee = (req, res) => {
  let dataa = req.body;
  Restaurant.updateServicefee(dataa, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return fees"})
    }
  }) 
} 

