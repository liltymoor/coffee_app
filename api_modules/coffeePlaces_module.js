
// MODULE IMPORTS
// =========================

const {coffeePlace}         = require('../models')
const {Request, Response}   = require('express');
const ErrorHandler          = require('../errorHandler/errorHandler');

// CONTROLLER LOGIC
// =========================

class CoffeePlacesController {
    /**
     * API function to get all coffee places in JSON format.
     * @param {Request<{}, any, any, qs.ParsedQs, Record<string, any>>} req 
     * @param {Response<any, Record<string, any>, number>} res 
     * @returns {void}
     */
    async getPlaces(req, res)
    {
        const data = await coffeePlace.findAll({
            where : { is_public: true }
        });
        res.status(200).json(data);
    }

    /**
     * API function to create coffee places by passing the query.
     * 
     * Example of creating an instance
     * ```js
     * const place = await models.coffeePlace.create({
            address: 'Арбат ул., 2, Москва',
            coordinates: sequelize.literal(`POINT(37.6050, 55.7568)`),
            start_hours: '09:00:00',
            finish_hours: '21:00:00',
            unionAccount_id: 1,
        });
     * ```
     * @param {Request<{}, any, any, qs.ParsedQs, Record<string, any>>} req 
     * @param {Response<any, Record<string, any>, number>} res
     * @param {any} next
     * @returns {void}
     */
    async createPlace(req, res, next)
    {
        // Getting query (GET) params from request
        const {
            address,
            coordinates, 
            start_hours, 
            finish_hours, 
            unionAccount_id
        } = req.body;
        
        
        // Checking if some params are bad
        if (!address || !coordinates || !start_hours || !finish_hours || !unionAccount_id) {
            return next(ErrorHandler.badRequest("Some params were passed wrong"));
        }


        // Creating an instance with given params
        const created_instance = coffeePlace.create({
            address: address,
            coordinates: coordinates,
            start_hours: start_hours,
            finish_hours: finish_hours,
            unionAccount_id: unionAccount_id
        })
        
        // Response
        res.json({
            message: "api createPlace",

            given_params: [
                address, coordinates,
                start_hours, finish_hours,
                unionAccount_id
            ],

            created_instance: created_instance
        })
    }
}

// MODULE EXPORTS
// =========================

module.exports = new CoffeePlacesController();
