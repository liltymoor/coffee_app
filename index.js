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
        await models.coffeePlace.destroy({ where: { id: 1}});
        await models.coffeePlace.create({
            address: 'Тверская ул., 2, Москва',
            coordinates: sequelize.literal(`POINT(37.6055, 55.7565)`),
            start_hours: '09:00:00',
            finish_hours: '21:00:00',
            unionAccount_id: 2,
        });

        await models.coffeePlace.create({
            address: 'Арбат ул., 1, Москва',
            coordinates: sequelize.literal(`POINT(37.6055, 55.7570)`),
            start_hours: '08:00:00',
            finish_hours: '20:00:00',
            unionAccount_id: 2,
        });

        const place = await models.coffeePlace.create({
            address: 'Арбат ул., 2, Москва',
            coordinates: sequelize.literal(`POINT(37.6050, 55.7568)`),
            start_hours: '09:00:00',
            finish_hours: '21:00:00',
            unionAccount_id: 1,
        });
        app.listen(PORT, () => {console.log('Server started on port ' + PORT); console.warn(place.toJSON())}); // Listening to server PORT
    }

    catch (exception) 
    {
        console.log("Exception were caught: " + exception);
    }
}


app_init();

// =========================