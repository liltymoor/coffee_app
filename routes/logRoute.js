const { connectionHistory } = require('../models');

module.exports = function (req, res, next) {
    res.status(200).json(connectionHistory.findAll());
}