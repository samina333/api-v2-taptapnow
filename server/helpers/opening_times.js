const Opening_times = require('../../database/helpers/opening_times.js');

// Get opening times
exports.getOpeningTimes = (req, res) => {
    let restaurant_fk = req.params.id_restaurant;
    Opening_times.getOpeningTimes(restaurant_fk, (result) => {
        if(result) {
            res.status(200).send(result);
        }
        else {
        res.status(400).send({message: "can't get opening time"})
        }
    })
}

// Save opening times
exports.saveOpeningTime = (req, res) => {
    let data = req.body
    Opening_times.saveOpeningTime ( data,(result) => {
        if (result) {
            res.status(200).send(result);
        } 
        else {
            res.status(400).send({message: "can't get opening time"})
        }
    })
}

// Delete open times 
exports.deleteOpeningTime = (req, res) => {
    let restaurant_fk = req.params.id_restaurant;
    Opening_times.deleteOpeningTime (restaurant_fk,(result) => {
        if(result) {
            res.status(200).send(result);
        }
        else {
        res.status(400).send({message: "can't get opening time"})
        }
    })
}
  