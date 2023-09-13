
// MODULE IMPORTS
// =========================

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
        const {userLogin, userPassword, userRole} = req.body;

        if (!userLogin|| !userPassword) {
            return next(ErrorHandler.badRequest("Invalid login or password."));
        }

        const fetchAccount = await account.findOne({where: { login: userLogin}});

        if (!fetchAccount) {
            fetchAccount = account.create({
                login: userLogin,
                password: await bcrypt.hash(userPassword, 5),
                naming: "Super User account | Organization Acc",
                role: "su",
                coffee_place_id: -1
            })
            //return next(ErrorHandler.badRequest("Invalid login or password."));
        }

        if (!bcrypt.compareSync(userPassword, fetchAccount.password)) {
            return next(ErrorHandler.badRequest("Invalid login or password."));
        }
        
        const token = jwt.sign(
            {login: userLogin, role: userRole},
            process.env.SECRET_KEY,
            {expiresIn: '24h'}
        )
        
        console.log("New JWT created | sk: " + process.env.SECRET_KEY + " JWT: " + token);
        return res.json(token);

        //res.json({message: "api in progress"})
    }

    async isAuth(req, res)
    {
        res.json({message: "api in progress"})
    };

}

module.exports = new AccessController();