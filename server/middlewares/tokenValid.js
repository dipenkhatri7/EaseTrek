const jwt = require("jsonwebtoken");
const User = require("../models/userModel");

exports.protect = async (req, res) => {
  try {
    console.log("Inside isTokenValid");
    const token = req.header("Authorization");
    console.log(token);
    if (!token) {
      return res.status(400).json({ message: "Not authorized" });
    }
    console.log("HERe");
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    console.log("decoded", decoded);
    if (!decoded) return res.status(400);
    const user = await User.findById(decoded.id);
    if (!user) return res.status(400).json(false);
    req.user = decoded.id;
    req.token = token;
    res.status(200);
    // const user = await User.findById(decoded.id);

    // if (!user) {
    //   return res.status(400).json({ message: "User does not exist" });
    // }

    if (user) {
      return res.status(200);
    }
  } catch (err) {
    res.status(400).json({ message: "Not authorized" });
  }
};
(exports.home = this.protect),
  async (req, res) => {
    console.log("Home route");
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  };
