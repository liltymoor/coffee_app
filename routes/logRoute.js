const { connectionHistory } = require('../models');

module.exports = async (req, res, next) => {
    const serverHistory   = await connectionHistory.findAll();
    const connectionCount = await connectionHistory.count();

    res.status(200).json({count: connectionCount, history: serverHistory});
}