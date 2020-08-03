const User = require('../../database/helpers/user.js');
const jwt = require('jsonwebtoken');
const fs = require('fs');

exports.saveUser = (req, res) => {
  //get params from request body
  let user = req.body;
  //handle some typo with specific params
  let type = parseInt(user.type_id);
  let country = parseInt(user.country_id);
  let profil = user.photo_user;

  // get the temporary location of the file
  var tmp_path = req.file.path;
  // // set where the file should actually exists - in this case it is in the "profil" directory
  var target_path = req.file.destination + Date.now() + req.file.originalname;
  // move the file from the temporary location to the intended location
  fs.rename(tmp_path, target_path, function(err) {
      if (err) {
        res.send({response: "can't save"});
      }
      else {
        user.photo_user = target_path
        user.country_id = country;
        user.type_id = type;

        User.saveUser(user, (result) => {
          
          if (result) {
            res.status(200).send(result);
          } else {
      
            res.status(403).send({
              error: "Duplicate",
              message: "Already exist in the system"
            });
          }
        });

      }

  });
}


exports.updateUser = (req, res) => {
  let data = req.body;
  data.id_user = data.id_user;
  if(req.file){
    // get the temporary location of the file
    var tmp_path = req.file.path;
    // // set where the file should actually exists - in this case it is in the "menu" directory
    var target_path = req.file.destination + Date.now() + req.file.originalname;
    // move the file from the temporary location to the intended location
    fs.rename(tmp_path, target_path, function(err) {
        if (err) {
          res.send({response: "can't save"});
        }
        else {
          // console.log("Target__Path__String__", target_path.substring(16))
          data.photo_user = target_path.substring(16)
          User.updateUser(data, (result) => {
            if(result){
              res.status(200).send(result);
            }
            else {
              res.status(400).send({result: "can't save new photo_user"});
            }
          })
        }
    });
  } else {
    User.updateUser(data, (result) => {
      data.photo_user = 'https://res.cloudinary.com/transition-digital/image/upload/v1579733572/New_Project_2_fymcr2.png';
      if (result) {
          res.status(200).send(result);
        } else {
          res.status(400).send({message: "Error can't update"});
        }
    })
  }
}


// create
exports.createUser = (req, res) => {
  //get params from request body
  let user = req.body;
  user.photo_user = "not define";
  user.userTypeID = 2
  user.createByAdmin = 1
  user.name_user = user.first_name
  
    User.saveUser(user, (result)  => {
      if (result) {
        res.status(200).send(result);
      } else {
        res.status(403).send({
          error: "Duplicate",
          message: "Already exist in the system"
        });
      }
    });
}

exports.getUsers = (req, res) => {
  User.getUsers((result)  => {
    if (result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({ message: "can't return users list" });
    }
  });
}

exports.setUserAdmin = (req, res) => {
  let data = req.body
  User.setUserAdmin(data, (result)  => {
    if (result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({ message: "can't set user to restaurant" });
    }
  });
}

// user for testing
exports.getUsersTest = (req, res) => {
  User.getUsersTest((result)  => {
    if (result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({ message: "can't return users list" });
    }
  });
}

// Get user pagination
exports.getUserPagination = (req, res) => {
  let data = req.body
  User.getUserPagination(data, (result)  => {
    if (result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({ message: "can't return users list" });
    }
  });
}
// get restaurant owner 
exports.getRestaurantOwner = (req, res) => {
  User.getRestaurantOwner((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch restaurants owner from the server"})
    }
  })
}


// Get user count
exports.getUserCount = (req, res) => {
  User.getUserCount((result)  => {
    if (result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({ message: "can't return users list" });
    }
  });
}


// Create user login process
exports.login = (req, res) => {
  data = req.body
  let email = data.email;
  User.getUserInfo(email, userData => {

    if (userData || userData !== null) {
      if (userData.password_user == data.password) {
        delete userData.password_user;
        let token = jwt.sign({
            id_user: userData.id_user,
            email_user: userData.email_user,
            userTypeID: userData.userTypeID,
            photo_user: userData.photo_user,
            phone_user: userData.phone_user
          }, 'secret', { expiresIn: '172h' });
        res.status(200).send({
          token: token,
          data: userData
        });
      } else {
        res.status(400).send({ message: "verify your credentials" });
      }
    } else {
      res.status(400).send({ message: "verify your credentials" });
    }
  });
};


//Search user
exports.searchUsers = (req,res) => {
  let data = req.body;
  User.searchUsers(data, (result) => {
    if (result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({ message: "Error can't find user " });
    }
  });
}

//Search user
exports.getUserInfoByID = (req, res) => {
  // console.log("get here",req.params)
  let id_user = req.params.id_user;
  User.getUserInfoByID(id_user, (result) => {
    if (result) {
      delete result.password_user;
      res.status(200).send(result);
    }
    else {
      res.status(400).send({ message: "Error can't find user " });
    }
  });
}

//Updations
exports.deleteUser = (req, res) => {
  let data = req.body
  User.deleteUser(data, (result)  => {
    if (result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({ message: "can't delete user" });
    }
  });
}
 