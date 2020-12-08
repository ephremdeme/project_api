"use strict";
module.exports = (sequelize, DataTypes) => {
  const Profile = sequelize.define(
    "Profile",
    {
      first_name: { type: DataTypes.STRING, allowNull: false },
      last_name: { type: DataTypes.STRING, allowNull: false },
      email: {
        type: DataTypes.STRING,
        allowNull: true,
        validate: { isEmail: true },
      },
    },
    {}
  );
  Profile.associate = function (models) {
    // associations can be defined here
    Profile.hasMany(models.Image);
    Profile.belongsTo(models.User);
  };
  return Profile;
};
