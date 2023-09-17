const { json } = require("sequelize")
const { connectionHistory } = require('../models'); 
/**
 * Middleware that logging the connections.
 * @param {Error} error
 * @param {Request<{}, any, any, qs.ParsedQs, Record<string, any>>} req 
 * @param {Response<any, Record<string, any>, number>} res 
 * @param {any} next
 * @returns {any}
 */
module.exports = function (req, res, next) {
    const newConnection = connectionHistory.create({
        client_ip: req.ip.split(':')[3],
        user_agent: req.get('User-Agent'),
        headers: req.headers
    })

    console.log(newConnection);

    next();
}