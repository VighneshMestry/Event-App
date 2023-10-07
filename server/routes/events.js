const express = require("express");
const Event = require("../models/events");

const authRouter = express.Router();

authRouter.post("/api/add-event", async (req, res) => {
  console.log('last check');
  try {
    console.log('api started');
    const {
      title,
      backgroundImage,
      description,
      location,
      duration,
      punchLine1,
      punchLine2,
      galleryImage,
      category,
    } = req.body;

    let event = new Event({
      title,
      backgroundImage,
      description,
      location,
      duration,
      punchLine1,
      punchLine2,
      galleryImage,
      category}
    );
    console.log('api executed');
    event = await event.save();
    res.json(event);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = authRouter;