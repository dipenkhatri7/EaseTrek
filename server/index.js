const express = require("express");
const mongoose = require("mongoose");
require("dotenv").config();
const DB = "mongodb://localhost:27017/db";
mongoose.set("strictQuery", false);
mongoose
  .connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("Connected to MongoDB");
  });
const app = express();

app.get("/", (req, res) => {
  res.send("Root route");
});
app.listen(3000, () => console.log("Server is running on port 3000"));
