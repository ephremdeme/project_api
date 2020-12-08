"use strict";
module.exports = (sequelize, DataTypes) => {
  const Product = sequelize.define(
    "Product",
    {
      name: { type: DataTypes.STRING, allowNull: false },
      model: { type: DataTypes.STRING, allowNull: false },
      price: { type: DataTypes.DOUBLE, validate: { min: 1 } },
      shortDescription: { type: DataTypes.STRING(200), allowNull: false },
      fullDescription: { type: DataTypes.TEXT, allowNull: false },
      quantity: { type: DataTypes.INTEGER, allowNull: false },
      views: {
        type: DataTypes.INTEGER,
        defaultValue: 0,
      },
      sold: {
        type: DataTypes.INTEGER,
        defaultValue: 0,
      },
    },
    {}
  );
  Product.associate = function (models) {
    // associations can be defined here
    Product.belongsTo(models.User);
    Product.belongsTo(models.Category, {
      as: "Category",
      foreignKey: "CategoryId",
    });
    Product.belongsTo(models.Category, {
      as: "SubCategory",
      foreignKey: "SubCategoryId",
    });
    Product.hasMany(models.Comment);
    Product.hasMany(models.Rate);
    Product.hasMany(models.Image);

    Product.belongsToMany(models.Order, { through: "ProductOrder" });
  };
  return Product;
};
