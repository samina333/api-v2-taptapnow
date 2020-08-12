const Restaurant = require('../../database/helpers/restaurant.js');
const fs = require('fs');

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
  
   
  restaurant.adminRestID = user;
  restaurant.countryRestID = countryRestID;
  restaurant.name_restaurant = name_restaurant;
  restaurant.lat_restaurant = lat;
  restaurant.long_restaurant = long;
  restaurant.tel_restaurant = tel_restaurant; 
  restaurant.adresse_restaurant = adresse_restaurant;
  restaurant.zipcode = zipcode;
  restaurant.state = state;

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


