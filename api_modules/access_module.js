
// MODULE IMPORTS
// =========================

require('../dotenv').config();

const bcrypt                = require('bcrypt');
const jwt                   = require('jsonwebtoken');
const {Request, Response}   = require('express');
const ErrorHandler          = require('../errorHandler/errorHandler');
const {account}             = require('../models');

// CONTROLLER LOGIC
// =========================

class AccessController
{
    /**
     * Function that gives the user his jwt (authorize) token if he has an account in system.
     * @param {Request<{}, any, any, qs.ParsedQs, Record<string, any>>} req 
     * @param {Response<any, Record<string, any>, number>} res 
     * @param {any} next
     * @returns {void}
     */
    async login(req, res, next)
    {
        // Getting POST data
        const {userLogin, userPassword, userRole} = req.body;

        // If user tries to pass empty data
        if (!userLogin|| !userPassword) 
            return next(ErrorHandler.badRequest("Invalid login or password."));

        const fetchAccount = await account.findOne({where: { login:userLogin}});

        // If there is no user with such login
        if (!fetchAccount)
            return next(ErrorHandler.badRequest("Invalid login or password."));

        // If password is wrong
        if (!bcrypt.compareSync(userPassword, fetchAccount.password))
            return next(ErrorHandler.badRequest("Invalid login or password."));
        
        const token = jwt.sign(
            {login: userLogin, role: userRole},
            process.env.SECRET_KEY,
            {expiresIn: '24h'}
        )
        
        return res.status(200).json(token);
    }

    async isAuth(req, res)
    {
        res.json({message: "api in progress"})
    };

}

module.exports = new AccessController();