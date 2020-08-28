const Reports = require('../../database/helpers/reports.js');
const fs = require('fs');
console.log("sam")

exports.logsCallsandDirections = (req, res) => {
  let data = req.body;
  Reports.logsCallsandDirections(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch"})
    }
  })
}

exports.sales = (req, res) => {
  let data = req.body;
  Reports.sales(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch"})
    }
  })
}

exports.reviews = (req, res) => {
  Reports.reviews((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch"})
    }
  })
}

exports.byzip = (req, res) => {
  let data = req.body;
  Reports.byzip(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch"})
    }
  })
}

exports.bystate = (req, res) => {
  let data = req.body;
  Reports.bystate(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch"})
    }
  })
}

exports.getdishes = (req, res) => {
  Reports.getdishes((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch"})
    }
  })
}

exports.getdishsales = (req, res) => {
  let data = req.body;
  Reports.getdishsales(data,(result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't fetch"})
    }
  })
}