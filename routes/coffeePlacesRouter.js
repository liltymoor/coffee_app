// API REQUIREMENTS
// =========================

const Router       = require('express');
const cpController = require('../api_modules/coffeePlaces_module')

// ROUTER LOGIC
// =========================

const router = Router();

router.post ('/createPlace', cpController.createPlace);
router.get  ('/getPlaces',    cpController.getPlaces); 

// MODULE EXPORT
// =========================

module.exports = router;