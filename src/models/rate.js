"use strict";
module.exports = (sequelize, DataTypes) => {
  const Rate = sequelize.define(
    "Rate",
    {
      rating: { type: DataTypes.INTEGER, allowNull: false },
    },
    {}
  );
  Rate.associate = function(models) {
    Rate.belongsTo(models.Product);
    Rate.belongsTo(models.User);
    Rate.belongsTo(models.Comment);
  };
  return Rate;
};
