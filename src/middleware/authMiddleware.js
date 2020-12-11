const jwt = require("jsonwebtoken");

module.exports.authMiddleware = (req, res, next) => {
  const authHeader = req.get("Authorization");
  if (!authHeader) {
    req.isAuth = false;
    return next();
  }

  const token = authHeader.split(" ")[1];

  console.log(authHeader);

  if (!token || token === "") {
    req.isAuth = false;
    return next();
  }

  let decodeToken;

  try {
    decodeToken = jwt.verify(
      token,
      Buffer.from(process.env.ACESS_TOKEN_SECRET_KEY).toString("base64")
    );

    req.user = decodeToken.user;
  } catch (error) {
    // return new Error("Invalid Tokens");
    return next()

  }
  req.isAuth = true;
  return next();
};
