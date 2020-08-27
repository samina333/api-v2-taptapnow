const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const multer = require('multer');
const fs = require('fs');
 
//different file de
const menuUpload = multer({ dest: './upload/menu/' });
const profil = multer({ dest: './upload/profil/' });
const restaurantUpload = multer({ dest: './upload/restaurants/' });

//import created function or models
const user = require('./server/helpers/user.js');
const menu = require('./server/helpers/menu.js');
const interest = require('./server/helpers/interest.js');
const restaurant = require('./server/helpers/restaurant.js');
const order = require('./server/helpers/orders.js');
const country = require('./server/helpers/country.js');
const photos = require('./server/helpers/photos.js');
const admin_payment = require('./server/helpers/admin_payment.js');
const opening_times = require('./server/helpers/opening_times.js');
const bank_info = require('./server/helpers/bank_info.js');


const utils = require('./server/utils.js');

const app = express();

// Token authorization
let auth = require("./server/authorization.js");

app.use(cors());
app.use(bodyParser.json());

app.get('/', function(req, res) {
  res
    .status(200)
    .send({ Taptap: "Success"})
});

// Create endpoint about user action (Login, register)
app.post('/api/v2/admin/user/register', profil.single('photo_user'), user.saveUser);
app.post('/api/v2/admin/user/create', auth.validation(), user.createUser);
app.post('/api/v2/admin/user/login', user.login); // Login endpoint not working
app.post('/api/v2/admin/restaurant/setAdmin', auth.validation(), user.setUserAdmin);


//start updation
app.post('/api/v2/admin/user/delete', auth.validation(), user.deleteUser);


//end


// Get restaurant owner only
app.get('/api/v2/admin/restaurant/all/owner/', auth.validation(), user.getRestaurantOwner);

// Create endpoint about menu (CRUD)
app.post('/api/v2/admin/menu', auth.validation(), menuUpload.single('img_menu'), menu.saveMenu);
// app.delete('/api/v2/admin/menu/:menu_id', menu.deleteMenu);
app.delete('/api/v2/admin/menu/:menu_id', auth.validation(), menu.deleteMenu);
app.get('/api/v2/admin/menu/:rest_id', menu.getMenus);
app.put('/api/v2/admin/menu/',  menuUpload.single('img_menu'), auth.validation(), menu.updateMenu);

// Create endpoint return list orders
app.get('/api/v2/admin/restaurant/orders/:rest_id', auth.validation(), order.getOrders); 
app.get('/api/v2/admin/restaurant/orders/completed/only/:rest_id', auth.validation(), order.getOrdersCompleted); 


app.get('/api/v2/admin/restaurant/orders/orders_details/:order_id', auth.validation(), order.getOrderDetails); 
app.put('/api/v2/admin/restaurant/order/update/', auth.validation(), order.updateOrder); 
app.post('/api/v2/admin/restaurant/orders/stat/', auth.validation(), order.getOrdersStat); 




app.get('/api/v2/admin/restaurant/orders/payments/list_restaurant_ready_to_get_paid/', auth.validation(), order.getRestaurantReadyToGetPaid); 



/*
  create endpoint return stat about total customers, employees and orders
  endpoint about top menu base on restaurant id
*/

app.get('/api/v2/admin/restaurant/stat/:rest_id', auth.validation(), utils.returnStat);
app.get('/api/v2/admin/restaurant/topMenu/:rest_id', auth.validation(), utils.topMenu);

//super admin endpoint on restaurant (CRUD)
app.get('/api/v2/admin/restaurant/:rest_id', restaurant.getRestaurantById);
app.get('/api/v2/admin/restaurant/by_user/:id_user', auth.validation(), restaurant.getRestaurantByIdUser);
app.post('/api/v2/admin/restaurant/all', restaurant.getRestaurant);
app.get('/api/v2/admin/restaurant/count/data', restaurant.getRestaurantCount);
app.get('/api/v2/admin/restaurant/get/all', restaurant.getRestaurantWithOutPagination);
app.put('/api/v2/admin/restaurant/update', restaurantUpload.single('logo_restaurant'), auth.validation(), restaurant.updateRestaurant);

// Opening time end point
app.post('/api/v2/admin/restaurant/opening/', opening_times.saveOpeningTime);
app.get('/api/v2/admin/restaurant/opening/:id_restaurant', opening_times.getOpeningTimes);
app.delete('/api/v2/admin/restaurant/opening/:id_restaurant', opening_times.deleteOpeningTime);

// app.get('/api/v2/admin/users', auth.validation(), user.getUsers);
app.get('/api/v2/admin/users', user.getUsersTest); // for testing all users without token
app.post('/api/v2/admin/users/pagination', user.getUserPagination); // with paginantion
app.get('/api/v2/admin/users/count/data', user.getUserCount); // with paginantio

app.get('/api/v2/admin/user/:id_user', auth.validation(), user.getUserInfoByID); // for testing all users without token
app.post('/api/v2/admin/user/update',auth.validation(),  profil.single('photo_user'), user.updateUser); // update user without photo

// app.post('/api/v2/admin/restaurant', auth.validation(), restaurantUpload.single('logo_restaurant'), restaurant.saveRestaurant);

/* test just for verification */
app.post('/api/v2/admin/restaurant', restaurantUpload.single('logo_restaurant'), restaurant.saveRestaurant);

// Endpoint to return image for specific object
app.get('/api/v2/api/path', utils.getImage);

// Search
app.post('/api/v2/admin/restaurant/search', restaurant.searchRestaurant); // for testing all users without token
app.post('/api/v2/admin/users/search', user.searchUsers); // for testing all users without token

// Interest
app.get('/api/v2/admin/interest/', interest.getInterest);
app.post('/api/v2/admin/interest/', interest.addInterest);

// Interest by date
app.post('/api/v2/admin/insterest/search/by_interval/', auth.validation(), interest.searchInterestByDateInterval); 

// Country enpoint
app.get('/api/v2/admin/country/', country.getCountry);

// Payment admin 
app.get('/api/v2/admin/restaurant/payment/admin/all/', auth.validation(), admin_payment.getAdminPayment);
app.get('/api/v2/admin/restaurant/payment/admin/uniq/:res_id', auth.validation(), admin_payment.getAdminPaymentByIdRestaurant);
app.post('/api/v2/admin/restaurant/payment/admin/', auth.validation(),  admin_payment.makePaymentAdmin);
app.post('/api/v2/admin/restaurant/payment/admin/search', admin_payment.searchAdminPaymentBy); 

// Payment Stat
app.post('/api/v2/admin/restaurant/payment/stat/', auth.validation(), admin_payment.getPaymentStat); 

// Payment by date
app.post('/api/v2/admin/restaurant/payment/admin/search/by_interval/', auth.validation(), admin_payment.searchByDateInterval); 

// Stat
app.post('/api/v2/admin/restaurant/stat/', auth.validation(), restaurant.statRestaurantMenu)

// Create endpoint about menu (CRUD)
app.post('/api/v2/admin/photo', auth.validation(), menuUpload.single('path'), photos.savePhotos);
app.delete('/api/v2/admin/photo/:photos_id', auth.validation(), photos.deletePhotos);
app.get('/api/v2/admin/photo/', photos.getPhotos);
app.put('/api/v2/admin/photo/',  menuUpload.single('path'), auth.validation(), photos.updatePhotos);

// Bank info enpoint
app.post('/api/v2/admin/restaurant/user/bank_info/', auth.validation(), bank_info.saveBankInfo);
app.get('/api/v2/admin/restaurant/user/bank_info/:id_user', auth.validation(), bank_info.getBankInfoByUserId);
app.post('/api/v2/admin/restaurant/user/bank_info/update', auth.validation(), bank_info.updateBankInfo);

// Do it later
// app.post('/api/v2/admin/restaurant/payment/pagination', user.getPaymentPagination); // with paginantion
// app.get('/api/v2/admin/restaurant/count/data', user.getPaymentCount); // with paginantio

//updation
app.post('/api/v2/admin/restaurant/all', restaurant.getRestaurant);
app.post('/api/v2/admin/restaurant/order/addquestions', auth.validation(), order.addQuestions); 
app.get('/api/v2/admin/restaurant/order/getquestions',  order.getquestions); 

app.post('/api/v2/admin/restaurant/payment/admin/addfee', auth.validation(), admin_payment.addfee);
app.get('/api/v2/admin/restaurant/payment/admin/getfee',  admin_payment.getfee);
app.post('/api/v2/admin/restaurant/payment/admin/updatefee', auth.validation(), admin_payment.updatefee);

app.post('/api/v2/admin/restaurant/alert', restaurant.alert);

app.post('/api/v2/admin/restaurant/order/addanswer',  order.addAnswer); 
app.get('/api/v2/admin/restaurant/order/getanswer',  order.getAnswer); 



const port = process.env.PORT || 3001;
app.listen(port, function() {
  console.log(`Application listening on port ${port}`);
})