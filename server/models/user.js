const mongoose = require("mongoose");

const userSchema1 = mongoose.Schema({
    name: {
      required: true,
      type: String,
      trim: true,
    },
    email: {
      required: true,
      type: String,
      trim: true,
      validate: {
        validator: (value) => {
          const re =
            /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
          return value.match(re);
        },
        message: "Please enter a valid email address",
      },
    },
    password: {
      required: true,
      type: String,
    },
    age: {
      type: String,
      default: "",
    },
    address: {
      type: String,
      default: "",
    },
    type: {
      type: String,
      default: "user",
    },
    // cart: [
    //   {
    //     product: productSchema,
    //     quantity: {
    //       type: Number,
    //       required: true,
    //     },
    //   },
    // ],
  });
  
  const User = mongoose.model("User", userSchema1);
  module.exports = User;