"use strict";
module.exports = (sequelize, DataTypes) => {
  const Role = sequelize.define(
    "Role",
    {
      role: {
        type: DataTypes.ENUM(["User", "Admin", "Operator"]),
        allowNull: false,
        defaultValue: "User",
      },
    },
    {}
  );
  Role.associate = function (models) {
    // associations can be defined here
    Role.belongsToMany(models.User, { through: "UserRoles" });
  };
  return Role;
};
