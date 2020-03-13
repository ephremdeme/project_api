"use strict";
module.exports = (sequelize, DataTypes) => {
  const Image = sequelize.define(
    "Image",
    {
      filename: DataTypes.STRING
    },
    {}
  );
  Image.associate = function(models) {
    // associations can be defined here
    Image.belongsTo(models.Product, {foreignKey:"productId"});
    Image.belongsTo(models.User, {foreignKey:"userId"});
  };
  return Image;
};
