const express = require("express");
const authConroller = require("../controller/authController");
const tokenValid = require("../middlewares/tokenValid");
const router = express.Router();
router.post("/signup", authConroller.signUp);
router.post("/isTokenValid", tokenValid.protect);
router.post("/signIn", authConroller.signIn);
router.get("/", tokenValid.home);
module.exports = router;
