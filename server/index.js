// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routes/auth");


//INIT
//If we initialize this express (which we did) then we also have to listen it
const app = express();
// const PORT = process.env.PORT || 3000;
const PORT = 3000;
const DB = "mongodb+srv://vighnesh:Rotomacc%4027@cluster0.kvzn2wp.mongodb.net/?retryWrites=true&w=majority";


app.use(express.json());
app.use(authRouter);

// Connections
// here connect is a promise or future so here we should use await keyword 
// but as this query is not in an async function we use 'then' in such cases
mongoose.set('strictQuery', false);
mongoose.connect(DB).then (() => {
  console.log("Connections successful")
}).catch((e) => {console.log(e)});


// API's have following requests
// GET, PUT, POST, DELETE, UPDATE -> CRUD
// This app.listen binds itself to the host specified and listen for any other connections 
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected server at ${PORT}`);
  });