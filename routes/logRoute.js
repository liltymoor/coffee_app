const { connectionHistory } = require('../models');

module.exports = function (req, res, next) {
    const serverHistory   = connectionHistory.findAll();
    const connectionCount = connectionHistory.count();

    res.status(200).json({count: connectionCount, history: serverHistory});
}