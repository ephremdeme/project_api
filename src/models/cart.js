'use strict';
module.exports = (sequelize, DataTypes) => {
  const Cart = sequelize.define('Cart', {
    quantity: DataTypes.INTEGER,
    totalPrice: DataTypes.FLOAT
  }, {});
  Cart.associate = function(models) {
    // associations can be defined here
    Cart.belongsToMany(models.Product, {through: 'ProductCart'})
    Cart.belongsTo(models.User)
  };
  return Cart;
};