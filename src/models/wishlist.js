"use strict";
module.exports = (sequelize, DataTypes) => {
  const Wishlist = sequelize.define(
    "Wishlist",
    {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
    },
    {}
  );
  Wishlist.associate = function (models) {
    // associations can be defined here
    Wishlist.belongsTo(models.User);
    Wishlist.belongsTo(models.Product);
  };
  return Wishlist;
};
