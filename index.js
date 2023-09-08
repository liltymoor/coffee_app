// IMPORTS 
// =========================

require('dotenv').config();

const express = require("express");
const sequelize = require("./db");
const models = require('./models');

// APP INIT
// =========================

const PORT = process.env.PORT || 5000;
const app = express();

const app_init = async () => {
    try 
    {
        await sequelize.authenticate(); // DB authorization
        await sequelize.sync();         // DB synchronization

        app.listen(PORT, () => {console.log('Server started on port ' + PORT);}); // Listening to server PORT
    }

    catch (exception) 
    {
        console.log("Exception were caught: " + exception);
    }
}


app_init();

// APP TEST GET METHOD
// =========================

app.get('/', async (req, res) => {
    const data = await models.coffeePlace.findAll();
    res.status(200).json(data);
})

// =========================

