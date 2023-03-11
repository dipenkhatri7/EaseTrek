const User = require("../models/userModel");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
exports.signUp = async (req, res) => {
  try {
    console.log(req.body);
    const { name, email, password, passwordConfirm } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "User already exists" });
    }
    console.log("Hashing password");
    console.log(password);
    const hashedPassword = await bcryptjs.hash(password, 12);
    let user = new User({
      name,
      email,
      password: hashedPassword,
      passwordConfirm: hashedPassword,
    });
    console.log("Saving user");
    user = await user.save();
    console.log("User saved");
    res.status(200).json(user);
  } catch (err) {
    console.log(err);
    res.status(400).json({
      status: "fail",
      message: err,
    });
  }
};
exports.signIn = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(401).json({ message: "User does not exist" });
    }
    const isPasswordCorrect = await bcryptjs.compare(password, user.password);
    if (!isPasswordCorrect) {
      return res.status(401).json({ message: "Invalid credentials" });
    }
    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);
    res.status(200).json({ token, ...user._doc });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: err,
    });
  }
};
