"use strict";
module.exports = (sequelize, DataTypes) => {
  const Profile = sequelize.define(
    "Profile",    {
      first_name: DataTypes.STRING,
      last_name: DataTypes.STRING,
      sex: DataTypes.STRING,
      birthdate : DataTypes.STRING,
      email: DataTypes.STRING,
    },{}
  );
  Profile.associate = function(models) {
    // associations can be defined here
    Profile.hasMany(models.Image);
    Profile.belongsTo(models.User);
  };
  return Profile;
};
