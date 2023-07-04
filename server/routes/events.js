const express = require("express");
const mongoose = require("mongoose");
const auth = require("../middlewares/auth");
const Event = require("../models/events");

const authRouter = express.Router();

authRouter.post("/api/add-event", auth, async (req, res) => {
  try {
    const {
      title,
      backgroundImage,
      description,
      location,
      duration,
      punchLine1,
      punchLine2,
      galleryImage,
      categorytitle,
    } = req.body;

    const event = new Event(
      title,
      backgroundImage,
      description,
      location,
      duration,
      punchLine1,
      punchLine2,
      galleryImage,
      categorytitle
    );

    event = await event.save();
    res.json(event);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
