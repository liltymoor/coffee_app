const jwt = require('jsonwebtoken');


/**
* Auth checker
* @param {Request<{}, any, any, qs.ParsedQs, Record<string, any>>} req 
* @param {Response<any, Record<string, any>, number>} res 
* @param {any} next
* @returns {void}
*/
module.exports = function (req, res, next) {
    try {
        // TOKEN EXAMPLE: Authorization: Bearer j12dsUSha321JS4l2sMALL1222...
        // splitting it by space between 'Bearer' and the token. Then choosing the token
        const token = req.headers.authorization.split(' ')[1];
        const decoded = jwt.verify(token, process.env.SECRET_KEY);

        req.user = decoded;
        next();
    } catch (e) {
        res.status(401).json({message: "Access Denied."});
    }
}