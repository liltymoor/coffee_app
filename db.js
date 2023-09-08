const {Sequelize} = require('sequelize');


module.exports = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USERNAME,
    process.env.DB_PASSWORD,
    {
        define: {
            charset: 'utf8',
            collate: 'utf8_general_ci', 
            timestamps: true
        },
        dialect: "postgres",
        host: process.env.DB_HOST,
        port: process.env.DB_PORT
    }
)