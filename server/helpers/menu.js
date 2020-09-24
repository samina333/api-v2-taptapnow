const Menu = require('../../database/helpers/menu.js');
const fs = require('fs');
const db = require('../../database/config.js');

exports.saveMenu = (req, res , cb) => {
    let data = req.body;
    data.prix_menu = parseFloat(data.prix_menu);
    if(req.file){
      // get the temporary location of the file
      var tmp_path = req.file.path;
      // // set where the file should actually exists - in this case it is in the "menu" directory
      var target_path = req.file.destination+Date.now()+req.file.originalname;      // move the file from the temporary location to the intended location
     
      fs.rename(tmp_path, target_path, function (err) {
          if (err) {
            res.send({response: "can't save"});
          }
          else {
            data.img_menu = target_path.substring(14)
            Menu.saveMenu(data, (result) => {
              if(result){
                //res.status(200).send(result);
                query = `update restaurant set takeout= ${1} WHERE id_restaurant = '${req.body.restaurantMenuID}'`;
          
          db.knex.raw(query).then(function (response) {
            cb(response[0]);
            }).catch(error => cb(error))
              }
              else {
                res.status(400).send({result: "can't save new menu"});
              }
            })
          }
      });
    } else {
      data.img_menu = "https://res.cloudinary.com/transition-digital/image/upload/v1579733572/New_Project_2_fymcr2.png";
      Menu.saveMenu(data, (result) => {
        if(result){
          //res.status(200).send(result);
          query = `update restaurant set takeout= ${1} WHERE id_restaurant = '${req.body.restaurantMenuID}'`;
          
          db.knex.raw(query).then(function (response) {
            cb(response[0]);
            }).catch(error => cb(error))
        }
        else {
          res.status(400).send({result: "can't save new menu"});
        }
      })
    }
  } 

exports.deleteMenu = (req, res) => {
  let menu_id = req.params.menu_id;
  Menu.deleteMenu(menu_id, (result, error) => {
    if(result!==null){
      res.status(200).send({message: "menu deleted", deleted_menu: result});
    }
    else if(error!==null)
    {
      res.status(404).send({result: "menu not found"});
    }
    else {
      res.status(400).send({result: "other issue"});
    }
  })

}

exports.getMenus = (req, res) => {
  let restaurant_id = req.params.rest_id;

  Menu.getMenus(restaurant_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch menu from the server retry"})
    }
  })
}

exports.updateMenu = (req, res) => {
  
  let data = req.body;
  data.id_menu = data.id_menu;

  if(req.file){
    // get the temporary location of the file
    var tmp_path = req.file.path;
    // // set where the file should actually exists - in this case it is in the "menu" directory
    var target_path = req.file.destination+Date.now()+req.file.originalname;
    // move the file from the temporary location to the intended location
    console.log("menu updata", target_path)

    fs.rename(tmp_path, target_path, function(err) {
        if (err) {
          res.send({response: "can't save"});
        }
        else {
          data.img_menu = target_path.substring(14)
          Menu.updateMenu(data, (result) => {
            if(result){
              res.status(200).send(result);
            }
            else {
              res.status(400).send({result: "can't save new menu"});
            }
          })
        }
    });
  } else {
    Menu.updateMenu(data, (result) => {
      if (result) {
          res.status(200).send(result);
        }
        else {
          res.status(400).send({message: "Error can't update"});
        }
    })
  }
}