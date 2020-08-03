const db = require('../config.js');
const BankInfo = require(`../models/bank_info.js`);

 
exports.saveBankInfo = (data, cb) => {
  new BankInfo({})
    .save(data, { method: 'insert' })
    .then((saveBankInfo) => cb(saveBankInfo))
    .catch(error => console.log(error))
}

exports.getBankInfoByUserId = (value, cb) => {
  let query = `SELECT * FROM bank_info WHERE user_id_fk = ${value}`;
  db.knex.raw(query).then(function (response) {
    cb(response[0]);
  })
  .catch(error => cb(error))
}

exports.updateBankInfo = (data, cb) => {
  BankInfo
  .where({id_bank_info: data.id_bank_info})
  .save(data, {patch: true})
  .then((model)=>{
      cb(model)
  })
  .catch(error => cb(error))
}


