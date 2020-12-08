"use strict";
module.exports = (sequelize, DataTypes) => {
  const Image = sequelize.define(
    "Image",
    {
      filename: { type: DataTypes.STRING, allowNull: false },
    },
    {}
  );
  Image.associate = function(models) {
    // associations can be defined here
    Image.belongsTo(models.Product);
    Image.belongsTo(models.Profile);
  };
  return Image;
};
