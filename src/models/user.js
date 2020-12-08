"use strict";
module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define(
    "User",
    {
      username: { type: DataTypes.STRING, allowNull: false },

      phone: {
        allowNull: false,
        type: DataTypes.STRING,
        unique: true,
      },
      status: { type: DataTypes.BOOLEAN, defaultValue: true },
      password: { type: DataTypes.STRING, allowNull: false },
      tokenCount: { type: DataTypes.INTEGER, defaultValue: 0 },
    },
    {}
  );
  User.associate = function (models) {
    // associations can be defined here
    User.hasMany(models.Comment);
    User.hasMany(models.Product);
    User.hasOne(models.Rate);
    User.hasOne(models.Order);
    User.hasOne(models.Profile);
    User.belongsToMany(models.Role, { through: "UserRoles" });
  };
  return User;
};
