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



exports.addQuestions = (req, res) => {
  data = req.body;
  
    //handle type issues

for (var i=0; i<data.question.length ; i++){
questions ={}
  let question = data.question[i];

  questions.question = question;

  console.log(" Format result ", questions)


console.log(questions)
        Order.addQuestions(questions, (result) => {
          if(result){
            //res.status(200).send(result);
            console.log(result)
          }
          else {
            //res.status(400).send({result: "can't save new restaurant"});
                        console.log("error")

          }
        })    
}   
res.status(200).send("success");

}

exports.getquestions = (req, res) => {

    Order.getquestions((result) => {
        if(result) {
            res.status(200).send(result);
        }
        else {
        res.status(400).send({message: "can't get"})
        }
    })
}


exports.addAnswer = (req, res) => {
  data = req.body;
  
for (var i=0; i<data.answer.length ; i++){
answers ={}

  
  let id_question_fk = data.id_question_fk[i];
  let question = data.question[i];
  let answer = data.answer[i];

  answers.id_question_fk = id_question_fk;
  answers.question = question;
  answers.answer = answer;

  console.log(" Format result ", answers)
  console.log(answers)
        Order.addAnswer(answers, (result) => {
          if(result){
            //res.status(200).send(result);
            console.log(result)
          }
          else {
            //res.status(400).send({result: "can't save new restaurant"});
                        console.log("error")

          }
        })    
}   
res.status(200).send("success");

}

exports.getAnswer = (req, res) => {
console.log("sam")
    Order.getAnswer((result) => {
        if(result) {
            res.status(200).send(result);
        }
        else {
        res.status(400).send({message: "can't get"})
        }
    })
}