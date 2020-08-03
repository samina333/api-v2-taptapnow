const Order = require('../../database/helpers/orders.js');

// Get order by restaurantID 
exports.getOrders = (req, res) => {
  let rest_id = req.params.rest_id;
  Order.getOrders(rest_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}


 
exports.getOrdersCompleted = (req, res) => {
  let rest_id = req.params.rest_id;
  Order.getOrdersCompleted(rest_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}

// Get order details by id order 
exports.getOrderDetails = (req, res) => {
  let order_id = req.params.order_id;
  Order.getOrderDetails(order_id, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}


// Update fiche order 
exports.updateOrder = (req, res) => {
  let fiche_order = req.body;
  Order.updateOrder(fiche_order, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}
// // Get order by id user
// exports.getOrders = (req, res) => {
//   let rest_id = req.params.rest_id;
//   Order.getOrders(rest_id, (result) => {
//     if(result) {
//       res.status(200).send(result);
//     }
//     else {
//       res.status(400).send({message: "can't return list orders"})
//     }
//   })
// }


// Get order stat
exports.getOrdersStat = (req, res) => {

  let data = req.body
  Order.getOrdersStat(data, (result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}



// Get getRestaurantReadyToGetPaid
  // List of all restaurant who have orders at the time of the last payment  
exports.getRestaurantReadyToGetPaid = (req, res) => {
  // let data = req.body
  Order.getRestaurantReadyToGetPaid((result) => {
    if(result) {
      res.status(200).send(result);
    }
    else {
      res.status(400).send({message: "can't return list orders"})
    }
  })
}






