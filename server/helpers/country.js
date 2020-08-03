
// country

const Country = require('../../database/helpers/country.js');
const fs = require('fs');


exports.getCountry = (req, res) => {
    Country.getCountry( (result) => {
      if(result) {
        res.status(200).send(result);
      }
      else {
        res.status(400).send({message: "can't fetch interest from the server retry"})
      }
    })
  }
  