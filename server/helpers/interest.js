const Interest = require('../../database/helpers/interest.js');
const fs = require('fs');

exports.addInterest = (req, res) => {
  let data = req.body;
  Interest.addInterest(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch interest from the server retry"})
    }
  })
}

exports.getInterest = (req, res) => {
    Interest.getInterest( (result) => {
      if(result) {
        res.status(200).send(result);
      }
      else {
        res.status(400).send({message: "can't fetch interest from the server retry"})
      }
    })
}
  

// Seach interest by interval searchInterestByDateInterval()
exports.searchInterestByDateInterval = (req, res) => {
  let data = req.body;
  Interest.searchInterestByDateInterval(data, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch admin from the server retry"})
    }
  })
}