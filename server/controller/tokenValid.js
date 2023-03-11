const jwt = require("jsonwebtoken");
const User = require("../models/userModel");

exports.auth = async (req, res, next) => {
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
    console.log("After decoded");
    const user = await User.findById(decoded.id);
    console.log("user", user);
    if (!user) return res.status(400).json({ message: "User does not exists" });
    req.user = decoded.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(400).json({ message: "Not authorized" });
  }
};
exports.protect = async (req, res) => {
  try {
    console.log("Inside isTokenValid");
    console.log(req.header("Authorization"));
    const token = req.header("Authorization");
    if (!token) return res.status(400).json({ message: "Not authorized" });
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    if (!decoded) return res.status(400);
    const user = await User.findById(decoded.id);
    console.log("user", user);
    if (!user) return res.status(400).json({ message: "User does not exists" });
    res.status(200).json(true);
  } catch (err) {
    res.status(400).json({ message: "Not authorized" });
  }
};
exports.home = async (req, res) => {
  console.log("Inside home");
  const user = await User.findById(req.user);
  res.status(200).json({ ...user._doc, token: req.token });
};
