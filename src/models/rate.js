"use strict";
module.exports = (sequelize, DataTypes) => {
  const Rate = sequelize.define(
    "Rate",
    {
      rating: DataTypes.INTEGER
    },
    {}
  );
  Rate.associate = function(models) {
    Rate.belongsTo(models.Product);
    Rate.belongsTo(models.User);
  };
  return Rate;
};
