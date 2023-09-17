const Router        = require('express');
const router        = Router();

const cpRouter      = require('./coffeePlacesRouter');
const accessRouter  = require('./accessRouter');

router.use('/coffee_places',    cpRouter);
router.use('/access',           accessRouter);

module.exports = router;