const express = require("express");
const mongoose = require("mongoose");
require("dotenv").config();
const userRouter = require("./routes/userRoutes");
mongoose.set("strictQuery", false);
mongoose
  .connect(
    `mongodb+srv://${process.env.MONGO_USERNAME}:${process.env.MONGO_PASSWORD}@cluster0.cwfzw7u.mongodb.net/?retryWrites=true&w=majority`,
    { useNewUrlParser: true, useUnifiedTopology: true }
  )
  .then(() => {
    console.log("Connected to MongoDB");
  });
const app = express();
app.use(express.json());
app.use(userRouter);

app.get("/get", (req, res) => {
  res.send("Root route");
});
app.listen(3000, () => console.log("Server is running on port 3000"));
