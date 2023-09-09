// API REQUIREMENTS
// =========================

const Router            = require('express');
const accessController  = require('../api_modules/access_module');

// ROUTER LOGIC
// =========================

const router = Router();

router.post ('/login',   accessController.login);
router.get  ('/is_auth',  accessController.isAuth); 

// MODULE EXPORT
// =========================

module.exports = router;