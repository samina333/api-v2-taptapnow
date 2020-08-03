const db = require('../config.js');
const Photos = require(`../models/photos.js`);

exports.savePhotos = (photos, cb) => {
  new Photos({})
    .save(photos, { method: 'insert' })
    .then((savephotos) => cb(savephotos))
    .catch(error => console.log(error))
}

exports.deletePhotos = (photosID, cb) => {
    Photos.query(function (query) {
        query.where('photos_id', '=', photosID)
  })
  .destroy()
  .then((result) => cb(result, null))
  .catch(error => cb(null, error))
}

exports.getPhotos = ( cb)=> {
  Photos
  .fetchAll()
  .then(function(model) {
    cb(model)
  })
  .catch(error => cb(error))
}

exports.updatePhotos = (data,cb) => {
    Photos
    .where({photos_id: data.photos_id})
    .save(data, {patch: true})
    .then((model)=>{
        cb(model)
    })
    .catch(error => cb(error))
}