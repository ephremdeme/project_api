"use strict";
module.exports = (sequelize, DataTypes) => {
  const Rate = sequelize.define(
    "Rate",
    {
      rating: DataTypes.NUMBER
    },
    {}
  );
  Rate.associate = function(models) {
    Rate.belongsTo(models.Product, { foreignKey: "productId" });
    Rate.belongsTo(models.User, { foreignKey: "userId" });
  };
  return Rate;
};
