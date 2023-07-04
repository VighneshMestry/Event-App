const mongoose = require("mongoose");

const eventSchema = mongoose.Schema({
  title: {
    type: String,
    required: true,
    trim: true,
  },
  backgroundImage: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  location: {
    type: String,
    required: true,
    trim: true,
  },
  duration: {
    type: String,
    required: true,
    trim: true,
  },
  punchLine1: {
    type: String,
    required: true,
    trim: true,
  },
  punchLine2: {
    type: String,
    required: true,
    trim: true,
  },
  galleryImage: [
    {
      type: String,
      required: true,
    },
  ],
  category: {
    type: String,
    required: true,
    trim: true,
  },
});

const Event = mongoose.model("Event", eventSchema);
module.exports = Event;
