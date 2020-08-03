exports.validation = () => {
  return (req, res, next) => {
    const bearerHeader = req.headers['authorization'];
    if(typeof bearerHeader !== 'undefined') {
      //split at the space
      const bearer = bearerHeader.split(' ');
      //get token from array
      const bearerToken = bearer[1];
      req.token = bearerToken;
      //call next middleware
      next();
    } else {
      res.status(403).send('Need Token to access');
    }
  }
}