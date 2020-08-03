const db = require('../config.js');
const Menu = require(`../models/menu.js`);

exports.saveMenu = (menu, cb) => {
  new Menu({})
    .save(menu, { method: 'insert' })
    .then((saveMenu) => cb(saveMenu))
    .catch(error => console.log(error))
}

exports.deleteMenu = (menuID, cb) => {
  Menu.query(function (query) {
        query.where('id_menu', '=', menuID)
  })
  .destroy()
  .then((result) => cb(result, null))
  .catch(error => cb(null, error))
}

exports.getMenus = (rest_id, cb)=> {
  Menu.query('where', 'restaurantMenuID', '=', rest_id)
  .fetchAll()
  .then(function(model) {
    cb(model)
  })
  .catch(error => cb(error))
}

exports.updateMenu = (data,cb) => {
    Menu
    .where({id_menu: data.id_menu})
    .save(data, {patch: true})
    .then((model)=>{
        cb(model)
    })
    .catch(error => cb(error))
}