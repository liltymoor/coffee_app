const sequelize = require('./db');
const {DataTypes} = require('sequelize');

// MODELS
// =========================

const unionAccount = sequelize.define("unionAccount", {

    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    leader_account: {type: DataTypes.INTEGER, allowNull: false}
})

const account = sequelize.define("account", {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    login: {type: DataTypes.CHAR(32), allowNull: false},
    password: {type: DataTypes.CHAR(32), allowNull: false},
    naming: {type: DataTypes.CHAR(64), allowNull: false},
    coffee_place_id: {type: DataTypes.INTEGER, allowNull: false}
})

const coffeePlace = sequelize.define("coffee_place", {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    address: {type: DataTypes.STRING, allowNull: false},
    coordinates: {type: 'point', allowNull: true},
    start_hours: {type: DataTypes.TIME, allowNull: true},
    finish_hours: {type: DataTypes.TIME, allowNull: true},
    unionAccount_id: {type: DataTypes.INTEGER, allowNull: false}},
    {
        charset: 'utf8',
        collate: 'utf8_unicode_ci'
    }
    )

const product = sequelize.define("product", {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    naming: {type: DataTypes.CHAR(16), allowNull: false},
    product_img: {type: DataTypes.STRING, allowNull: true},
    product_level: {type: DataTypes.CHAR(16), allowNull: false},
    coffee_place_id: {type: DataTypes.INTEGER, allowNull: false}
})

// MODEL RELATIONS
// =========================

unionAccount.hasMany(coffeePlace);
coffeePlace.belongsTo(unionAccount);

account.hasOne(unionAccount);
unionAccount.belongsTo(account);

coffeePlace.hasMany(account);
account.belongsTo(coffeePlace);

coffeePlace.hasMany(product);
product.belongsTo(coffeePlace);

// EXPORTING MODELS
// =========================

module.exports = {
    unionAccount,
    coffeePlace,
    account,
    product
}

// =========================