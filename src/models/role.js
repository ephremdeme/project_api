"use strict";
module.exports = (sequelize, DataTypes) => {
  const Role = sequelize.define(
    "Role",
    {
      role: { type: DataTypes.STRING, allowNull: false },
    },
    {}
  );
  Role.associate = function (models) {
    // associations can be defined here
    Role.belongsToMany(models.User, { through: "UserRoles" });
  };
  return Role;
};
