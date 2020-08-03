const Utils = require('../database/utils.js');
const path = require('path');

exports.returnStat = (req, res) => {
  Utils.returnStat((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch from the server"})
    }
  })
}

exports.getImage = (req, res) => {
  let data = null;
  if(req.query.hasOwnProperty("img_menu") || req.query.hasOwnProperty("img_restaurant") || req.query.hasOwnProperty("img_profil")) {
    data = req.query
  }
  else {
    data = req.body;
  }

  if(data.img_menu) {
    res.sendFile(path.resolve(__dirname + '../../upload/menu/' + data.img_menu));
  } else if (data.img_restaurant) {
    res.sendFile(path.resolve(__dirname + '../../upload/restaurants/'+data.img_restaurant));
  } else {
    res.sendFile(path.resolve(__dirname + '../../upload/profil/' + data.img_profil));
  }
}

exports.topMenu = (req, res) => {
  let rest_id = req.params.rest_id;
  Utils.topMenu(rest_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch top menu from the server retry"})
    }
  })
}