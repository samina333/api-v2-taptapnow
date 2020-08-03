const Photos = require('../../database/helpers/photos.js');
const fs = require('fs');

exports.getPhotos = (req, res) => {
    Photos.getPhotos ( (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}

exports.savePhotos = (req, res) => {
  // Take on body
  let data = req.body
  if (req.file) { 
    var tmp_path = req.file.path;
    // Set where the file should actually exists - in this case it is in the "menu" directory
    var target_path = req.file.destination+Date.now()+req.file.originalname;      // Move the file from the temporary location to the intended location
    fs.rename(tmp_path, target_path, function (err) {
        if (err) {
          res.send({response: "can't save"});
        }
        else {
          data.img_menu = target_path.substring(14)
          Photos.savePhotos( data, (result) => {
            if(result) {
              res.status(200).send(result);
            } else {
              res.status(400).send({message: "can't fetch admin from the server retry"})
            }
          })
        }
    });
  } else {
    res.status(400).send({message: "can't fetch admin from the server retry"})
  }
}

exports.deletePhotos = (req, res) => {
    let id = req.params.photos_id
    // Take on params
    Photos.deletePhotos( id, (result) => {
    if(result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({message: "can't delete photo from the server retry"})
    }
  })
}

exports.updatePhotos = (req, res) => {
    // Take on body
    Photos.updatePhotos( data, (result) => {
    if(result) {
      res.status(200).send(result);
    } else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}