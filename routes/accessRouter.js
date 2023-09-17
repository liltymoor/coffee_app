// API REQUIREMENTS
// =========================

const Router            = require('express');
const accessController  = require('../api_modules/access_module');
const authChecker       = require('../errorHandler/authMiddleware');

// ROUTER LOGIC
// =========================

const router = Router();

router.post ('/login',   accessController.login);
router.get  ('/is_auth', authChecker, accessController.isAuth); 

// MODULE EXPORT
// =========================

module.exports = router;