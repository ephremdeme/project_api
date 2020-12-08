"use strict";
module.exports = (sequelize, DataTypes) => {
  const Address = sequelize.define(
    "Address",
    {
      kebele: { type: DataTypes.STRING, allowNull: false },
      subcity: { type: DataTypes.STRING, allowNull: false },
      city: { type: DataTypes.STRING, allowNull: false },
      wereda: { type: DataTypes.STRING, allowNull: false },
      zone: { type: DataTypes.STRING, allowNull: false },
      state: { type: DataTypes.STRING, allowNull: false },
    },
    {}
  );
  Address.associate = function (models) {
    // associations can be defined here
    Address.belongsTo(models.User);
  };
  return Address;
};
