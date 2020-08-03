const BankInfo = require('../../database/helpers/bank_info.js');
const fs = require('fs');

// Save bank info
exports.saveBankInfo = (req, res) => {
  let data = req.body
  BankInfo.saveBankInfo( data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}
// Get bank info by user
exports.getBankInfoByUserId = (req, res) => {
  let id_user = req.params.id_user
  BankInfo.getBankInfoByUserId( id_user,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}
  

exports.updateBankInfo = (req, res) => {
  let data = req.body
  BankInfo.updateBankInfo(data, (result) => {
    if (result) {
        res.status(200).send(result);
      }
      else {
        res.status(400).send({message: "Error can't update"});
      }
  })
}

