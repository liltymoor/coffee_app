// IMPORTS 
// =========================

require('dotenv').config();

const express       = require("express");
const sequelize     = require("./db");
const models        = require('./models');
const cors          = require('cors')
const errorHandler  = require('./errorHandler/middleware');
const logger        = require('./errorHandler/loggerMiddleware');

const router        = require('./routes/router')

// APP INIT
// =========================

const PORT  = process.env.PORT || 5000;
const app   = express();

// Must be first
app.use(logger);

app.use(cors());
app.use(express.json());
app.use('/api', router);

// Must be last
app.use(errorHandler);

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

// =========================
