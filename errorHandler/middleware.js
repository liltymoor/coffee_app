const ApiError = require('./errorHandler');

/**
 * Middleware that catches the errors.
 * @param {Error} error
 * @param {Request<{}, any, any, qs.ParsedQs, Record<string, any>>} req 
 * @param {Response<any, Record<string, any>, number>} res 
 * @param {any} next
 * @returns {any}
 */
module.exports = function (error, req, res, next) {
    if (err instanceof ApiError) {
        return res.status(err.status).json({message: err.message});
    }

    return res.status(500).json({message: "Unexpected error."});
}