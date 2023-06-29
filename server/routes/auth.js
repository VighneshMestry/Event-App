const express = require("express");
const User = require("../models/user");
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { email, name, password } = req.body;

    const existingUser = await User.findOne({ email: email });

    if (existingUser) {
      return res.status(400).json({ msg: "User already exists!" });
    }

    let user = new User({ name, email, password });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email });

    if(!user) {
      return res.status(400).json({msg: 'User not found!'});
    }

    if(password != user.password){
      return res.status(400).json({msg: 'Incorrect password'});
    }
    const token = jwt.sign({id : user._id}, "passwordKey");
    console.log('Api request successful');
    res.json({token, ...user.doc});

  } catch (e) {
    res.status(500).json({ msg: e.toString });
  }
});

module.exports = authRouter;
