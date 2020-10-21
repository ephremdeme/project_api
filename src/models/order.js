"use strict";
module.exports = (sequelize, DataTypes) => {
  const Order = sequelize.define(
    "Order",
    {
      status: DataTypes.BOOLEAN,
      confirmation_num: DataTypes.BIGINT(11),
      subTotalPrice: DataTypes.FLOAT,
      totalPrice: DataTypes.FLOAT,
    },
    {}
  );
  Order.associate = function (models) {
    // associations can be defined here
    Order.belongsToMany(models.Product, { through: "ProductOrder" });
    Order.belongsTo(models.User);
  };
  return Order;
};
