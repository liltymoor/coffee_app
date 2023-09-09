const {coffeePlace} = require('../models')

class CoffeePlacesController {
    async getPlaces(req, res)
    {
        const data = await coffeePlace.findAll();
        res.status(200).json(data);
    }

    async createPlace(req, res)
    {
        res.json({message: "api in progress"})
    }
}

module.exports = new CoffeePlacesController();