'use strict';
module.exports = (sequelize, DataTypes) => {
  const ProductOrder = sequelize.define('ProductOrder', {
  }, {});
  ProductOrder.associate = function(models) {
    // associations can be defined here
  };
  return ProductOrder;
};