"use strict";
module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define(
    "User",
    {
      username: DataTypes.STRING,
      phone: DataTypes.STRING,
      status: { type: DataTypes.BOOLEAN, defaultValue: true },
      password: DataTypes.STRING,
      tokenCount: { type: DataTypes.INTEGER, defaultValue: 0 },
    },
    {}
  );
  User.associate = function (models) {
    // associations can be defined here
    User.hasMany(models.Comment);
    User.hasMany(models.Product);
    User.hasMany(models.Rate);
    User.hasOne(models.Cart);
    User.hasOne(models.Profile);
  };
  return User;
};
